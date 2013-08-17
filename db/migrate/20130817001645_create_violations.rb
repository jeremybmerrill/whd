class CreateViolations < ActiveRecord::Migration
  def change
    create_table :violations do |t|
      t.integer :id
      t.integer :case_id
      t.string :trade_nm
      t.string :legal_name
      t.string :street_addr_1_txt
      t.string :cty_nm
      t.string :st_cd
      t.string :zip_cd
      t.string :naic_cd
      t.string :naics_code_description
      t.integer :case_violtn_cnt
      t.integer :cmp_assd_cnt
      t.integer :ee_violtd_cnt
      t.decimal :bw_atp_amt, :precision => 10, :scale => 2
      t.integer :crew_ee_atp_cnt
      t.integer :flsa_violtn_cnt
      t.string :flsa_repeat_violator
      t.decimal :flsa_bw_atp_amt, :precision => 10, :scale => 2
      t.integer :flsa_ee_atp_cnt
      t.decimal :flsa_mw_bw_atp_amt, :precision => 10, :scale => 2
      t.decimal :flsa_ot_bw_atp_amt, :precision => 10, :scale => 2
      t.decimal :flsa_15a3_bw_atp_amt, :precision => 10, :scale => 2
      t.decimal :flsa_cmp_assd_amt, :precision => 10, :scale => 2
      t.integer :sca_violtn_cnt
      t.decimal :sca_bw_atp_amt, :precision => 10, :scale => 2
      t.integer :sca_ee_atp_cnt
      t.integer :mspa_violtn_cnt
      t.decimal :mspa_bw_atp_amt, :precision => 10, :scale => 2
      t.integer :mspa_ee_atp_cnt
      t.decimal :mspa_cmp_assd_amt, :precision => 10, :scale => 2
      t.integer :h1b_violtn_cnt
      t.decimal :h1b_bw_atp_amt, :precision => 10, :scale => 2
      t.integer :h1b_ee_atp_cnt
      t.decimal :h1b_cmp_assd_amt, :precision => 10, :scale => 2
      t.integer :fmla_violtn_cnt
      t.decimal :fmla_bw_atp_amt, :precision => 10, :scale => 2
      t.integer :fmla_ee_atp_cnt
      t.decimal :fmla_cmp_assd_amt, :precision => 10, :scale => 2
      t.integer :flsa_cl_violtn_cnt
      t.integer :flsa_cl_minor_cnt
      t.decimal :flsa_cl_cmp_assd_amt, :precision => 10, :scale => 2
      t.integer :dbra_cl_violtn_cnt
      t.decimal :dbra_bw_atp_amt, :precision => 10, :scale => 2
      t.integer :dbra_ee_atp_cnt
      t.integer :h2a_violtn_cnt
      t.decimal :h2a_bw_atp_amt, :precision => 10, :scale => 2
      t.integer :h2a_ee_atp_cnt
      t.decimal :h2a_cmp_assd_amt, :precision => 10, :scale => 2
      t.integer :flsa_smw14_violtn_cnt
      t.decimal :flsa_smw14_bw_amt, :precision => 10, :scale => 2
      t.integer :flsa_smw14_ee_atp_cnt
      t.integer :cwhssa_violtn_cnt
      t.decimal :cwhssa_bw_amt, :precision => 10, :scale => 2
      t.integer :cwhssa_ee_cnt
      t.integer :osha_violtn_cnt
      t.decimal :osha_bw_atp_amt, :precision => 10, :scale => 2
      t.integer :osha_ee_atp_cnt
      t.decimal :osha_cmp_assd_amt, :precision => 10, :scale => 2
      t.integer :eppa_violtn_cnt
      t.decimal :eppa_bw_atp_amt, :precision => 10, :scale => 2
      t.integer :eppa_ee_cnt
      t.decimal :eppa_cmp_assd_amt, :precision => 10, :scale => 2
      t.integer :h1a_violtn_cnt
      t.decimal :h1a_bw_atp_amt, :precision => 10, :scale => 2
      t.integer :h1a_ee_atp_cnt
      t.decimal :h1a_cmp_assd_amt, :precision => 10, :scale => 2
      t.integer :crew_violtn_cnt
      t.decimal :crew_bw_atp_amt, :precision => 10, :scale => 2
      t.integer :crew_ee_atp_cnt
      t.decimal :crew_cmp_assd_amt, :precision => 10, :scale => 2
      t.integer :ccpa_violtn_cnt
      t.decimal :ccpa_bw_atp_amt, :precision => 10, :scale => 2
      t.integer :ccpa_ee_atp_cnt
      t.integer :flsa_smwpw_violtn_cnt
      t.decimal :flsa_smwpw_bw_atp_amt, :precision => 10, :scale => 2
      t.integer :flsa_smwpw_ee_atp_cnt
      t.integer :flsa_hmwkr_violtn_cnt
      t.decimal :flsa_hmwkr_bw_atp_amt, :precision => 10, :scale => 2
      t.integer :flsa_hmwkr_ee_atp_cnt
      t.decimal :flsa_hmwkr_cmp_assd_amt, :precision => 10, :scale => 2
      t.integer :ca_violtn_cnt
      t.decimal :ca_bw_atp_amt, :precision => 10, :scale => 2
      t.integer :ca_ee_atp_cnt
      t.integer :pca_violtn_cnt
      t.decimal :pca_bw_atp_amt, :precision => 10, :scale => 2
      t.integer :pca_ee_atp_cnt
      t.integer :flsa_smwap_violtn_cnt
      t.decimal :flsa_smwap_bw_atp_amt, :precision => 10, :scale => 2
      t.integer :flsa_smwap_ee_atp_cnt
      t.integer :flsa_smwft_violtn_cnt
      t.decimal :flsa_smwft_bw_atp_amt, :precision => 10, :scale => 2
      t.integer :flsa_smwft_ee_atp_cnt
      t.integer :flsa_smwl_violtn_cnt
      t.decimal :flsa_smwl_bw_atp_amt, :precision => 10, :scale => 2
      t.integer :flsa_smwl_ee_atp_cnt
      t.integer :flsa_smwmg_violtn_cnt
      t.decimal :flsa_smwmg_bw_atp_amt, :precision => 10, :scale => 2
      t.integer :flsa_smwmg_ee_atp_cnt
      t.integer :flsa_smwsl_violtn_cnt
      t.decimal :flsa_smwsl_bw_atp_amt, :precision => 10, :scale => 2
      t.integer :flsa_smwsl_ee_atp_cnt
      t.integer :eev_violtn_cnt
      t.integer :h2b_violtn_cnt
      t.decimal :h2b_bw_atp_amt, :precision => 10, :scale => 2
      t.integer :h2b_ee_atp_cnt
      t.integer :sraw_violtn_cnt
      t.decimal :sraw_bw_atp_amt, :precision => 10, :scale => 2
      t.integer :sraw_ee_atp_cnt
      t.decimal :indstry_dim_id, :precision => 10, :scale => 2
      t.decimal :zip_dim_id, :precision => 10, :scale => 2
      t.datetime :ld_dt
      t.datetime :findings_start_date
      t.datetime :findings_end_date

      t.timestamps
    end
  end
end
