

class Violation < ActiveRecord::Base
  include ActionView::Helpers #for number_to_precision

  attr_accessible :bw_atp_amt, :ca_bw_atp_amt, :ca_ee_atp_cnt, :ca_violtn_cnt, :case_id, :case_violtn_cnt, :ccpa_bw_atp_amt, :ccpa_ee_atp_cnt, :ccpa_violtn_cnt, :cmp_assd_cnt, :crew_bw_atp_amt, :crew_cmp_assd_amt, :crew_ee_atp_cnt, :crew_ee_atp_cnt, :crew_violtn_cnt, :cty_nm, :cwhssa_bw_amt, :cwhssa_ee_cnt, :cwhssa_violtn_cnt, :dbra_bw_atp_amt, :dbra_cl_violtn_cnt, :dbra_ee_atp_cnt, :ee_violtd_cnt, :eev_violtn_cnt, :eppa_bw_atp_amt, :eppa_cmp_assd_amt, :eppa_ee_cnt, :eppa_violtn_cnt, :findings_end_date, :findings_start_date, :flsa_15a3_bw_atp_amt, :flsa_bw_atp_amt, :flsa_cl_cmp_assd_amt, :flsa_cl_minor_cnt, :flsa_cl_violtn_cnt, :flsa_cmp_assd_amt, :flsa_ee_atp_cnt, :flsa_hmwkr_bw_atp_amt, :flsa_hmwkr_cmp_assd_amt, :flsa_hmwkr_ee_atp_cnt, :flsa_hmwkr_violtn_cnt, :flsa_mw_bw_atp_amt, :flsa_ot_bw_atp_amt, :flsa_repeat_violator, :flsa_smw14_bw_amt, :flsa_smw14_ee_atp_cnt, :flsa_smw14_violtn_cnt, :flsa_smwap_bw_atp_amt, :flsa_smwap_ee_atp_cnt, :flsa_smwap_violtn_cnt, :flsa_smwft_bw_atp_amt, :flsa_smwft_ee_atp_cnt, :flsa_smwft_violtn_cnt, :flsa_smwl_bw_atp_amt, :flsa_smwl_ee_atp_cnt, :flsa_smwl_violtn_cnt, :flsa_smwmg_bw_atp_amt, :flsa_smwmg_ee_atp_cnt, :flsa_smwmg_violtn_cnt, :flsa_smwpw_bw_atp_amt, :flsa_smwpw_ee_atp_cnt, :flsa_smwpw_violtn_cnt, :flsa_smwsl_bw_atp_amt, :flsa_smwsl_ee_atp_cnt, :flsa_smwsl_violtn_cnt, :flsa_violtn_cnt, :fmla_bw_atp_amt, :fmla_cmp_assd_amt, :fmla_ee_atp_cnt, :fmla_violtn_cnt, :h1a_bw_atp_amt, :h1a_cmp_assd_amt, :h1a_ee_atp_cnt, :h1a_violtn_cnt, :h1b_bw_atp_amt, :h1b_cmp_assd_amt, :h1b_ee_atp_cnt, :h1b_violtn_cnt, :h2a_bw_atp_amt, :h2a_cmp_assd_amt, :h2a_ee_atp_cnt, :h2a_violtn_cnt, :h2b_bw_atp_amt, :h2b_ee_atp_cnt, :h2b_violtn_cnt, :id, :indstry_dim_id, :ld_dt, :legal_name, :mspa_bw_atp_amt, :mspa_cmp_assd_amt, :mspa_ee_atp_cnt, :mspa_violtn_cnt, :naic_cd, :naics_code_description, :osha_bw_atp_amt, :osha_cmp_assd_amt, :osha_ee_atp_cnt, :osha_violtn_cnt, :pca_bw_atp_amt, :pca_ee_atp_cnt, :pca_violtn_cnt, :sca_bw_atp_amt, :sca_ee_atp_cnt, :sca_violtn_cnt, :sraw_bw_atp_amt, :sraw_ee_atp_cnt, :sraw_violtn_cnt, :st_cd, :street_addr_1_txt, :trade_nm, :zip_cd, :zip_dim_id

  scope :started_since, ->(year){ where("findings_start_date > ?", "#{year}-01-01") }
  scope :ended_since, ->(year){ where("findings_end_date > ?", "#{year}-01-01") }

  scope :flsa, ->{where("flsa_violtn_cnt > 0")}
  scope :back_wage_payments, ->{where("bw_atp_amt > 0")}
  scope :minimum_wage_back_wage_payments, ->{where("flsa_mw_bw_atp_amt > 0")}

  def self.percentile(field, amount)
  	larger = self.where("#{field} > ?", amount).count
  	all =  self.where("#{field} > ?", 0).count
  	puts "#{larger} / #{all}"
  	(larger.to_f/all) * 100
  end
  def self.percentile_by_amount(amount)
  	self.percentile(:flsa_mw_bw_atp_amt, amount)
  end
  def self.percentile_by_employees(ees)
  	self.percentile(:flsa_ee_atp_cnt, ees)
  end

  def flsa_bw_atp_sum
  	# sometimes this doesn't equal flsa_bw_atp_amt.
  	[self.flsa_mw_bw_atp_amt,
  	self.flsa_ot_bw_atp_amt,
  	self.flsa_15a3_bw_atp_amt,
  	self.flsa_smw14_bw_amt,
  	self.flsa_smwpw_bw_atp_amt,
  	self.flsa_hmwkr_bw_atp_amt,
  	self.flsa_smwap_bw_atp_amt,
  	self.flsa_smwft_bw_atp_amt,
  	self.flsa_smwl_bw_atp_amt,
  	self.flsa_smwmg_bw_atp_amt,
  	self.flsa_smwsl_bw_atp_amt].sum
  end

  def to_s
  	puts %{
  	#{trade_nm} / #{legal_name} ##{case_id}
  	\t#{case_violtn_cnt} viols wrt #{ee_violtd_cnt} employees
  	\tATP $#{number_with_precision(bw_atp_amt, :precision => 2, :delimiter => ',')}
  	\t#{flsa_violtn_cnt} FLSA viols
  	\tATP $#{number_with_precision(flsa_bw_atp_amt, :precision => 2, :delimiter => ',')} under FLSA to #{flsa_ee_atp_cnt} employees 
  	\tsum: $#{number_with_precision(flsa_bw_atp_sum, :precision => 2, :delimiter => ',')}
  	\tmw bw atp: $#{number_with_precision(flsa_mw_bw_atp_amt, :precision => 2, :delimiter => ',')}
  	\tot bw atp: $#{number_with_precision(flsa_ot_bw_atp_amt, :precision => 2, :delimiter => ',')}
  	}
  	nil
  end
end
