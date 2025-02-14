-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2017.4
-- Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity canny_edge_detection is
port (
    axis_in_TDATA : IN STD_LOGIC_VECTOR (23 downto 0);
    axis_in_TKEEP : IN STD_LOGIC_VECTOR (2 downto 0);
    axis_in_TSTRB : IN STD_LOGIC_VECTOR (2 downto 0);
    axis_in_TUSER : IN STD_LOGIC_VECTOR (0 downto 0);
    axis_in_TLAST : IN STD_LOGIC_VECTOR (0 downto 0);
    axis_in_TID : IN STD_LOGIC_VECTOR (0 downto 0);
    axis_in_TDEST : IN STD_LOGIC_VECTOR (0 downto 0);
    axis_out_TDATA : OUT STD_LOGIC_VECTOR (7 downto 0);
    axis_out_TKEEP : OUT STD_LOGIC_VECTOR (0 downto 0);
    axis_out_TSTRB : OUT STD_LOGIC_VECTOR (0 downto 0);
    axis_out_TUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    axis_out_TLAST : OUT STD_LOGIC_VECTOR (0 downto 0);
    axis_out_TID : OUT STD_LOGIC_VECTOR (0 downto 0);
    axis_out_TDEST : OUT STD_LOGIC_VECTOR (0 downto 0);
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    axis_in_TVALID : IN STD_LOGIC;
    axis_in_TREADY : OUT STD_LOGIC;
    axis_out_TVALID : OUT STD_LOGIC;
    axis_out_TREADY : IN STD_LOGIC );
end;


architecture behav of canny_edge_detection is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "canny_edge_detection,hls_ip_2017_4,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020clg400-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=dataflow,HLS_SYN_CLOCK=10.770000,HLS_SYN_LAT=942490,HLS_SYN_TPT=942482,HLS_SYN_MEM=15,HLS_SYN_DSP=5,HLS_SYN_FF=4566,HLS_SYN_LUT=6832}";
    constant ap_const_lv8_0 : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';

    signal ap_rst_n_inv : STD_LOGIC;
    signal AXIS2GrayArray_U0_ap_start : STD_LOGIC;
    signal AXIS2GrayArray_U0_ap_done : STD_LOGIC;
    signal AXIS2GrayArray_U0_ap_continue : STD_LOGIC;
    signal AXIS2GrayArray_U0_ap_idle : STD_LOGIC;
    signal AXIS2GrayArray_U0_ap_ready : STD_LOGIC;
    signal AXIS2GrayArray_U0_start_out : STD_LOGIC;
    signal AXIS2GrayArray_U0_start_write : STD_LOGIC;
    signal AXIS2GrayArray_U0_axis_in_TREADY : STD_LOGIC;
    signal AXIS2GrayArray_U0_fifo1_din : STD_LOGIC_VECTOR (7 downto 0);
    signal AXIS2GrayArray_U0_fifo1_write : STD_LOGIC;
    signal GaussianBlur_U0_ap_start : STD_LOGIC;
    signal GaussianBlur_U0_ap_done : STD_LOGIC;
    signal GaussianBlur_U0_ap_continue : STD_LOGIC;
    signal GaussianBlur_U0_ap_idle : STD_LOGIC;
    signal GaussianBlur_U0_ap_ready : STD_LOGIC;
    signal GaussianBlur_U0_start_out : STD_LOGIC;
    signal GaussianBlur_U0_start_write : STD_LOGIC;
    signal GaussianBlur_U0_fifo1_read : STD_LOGIC;
    signal GaussianBlur_U0_fifo2_din : STD_LOGIC_VECTOR (7 downto 0);
    signal GaussianBlur_U0_fifo2_write : STD_LOGIC;
    signal Sobel_1280u_720u_U0_ap_start : STD_LOGIC;
    signal Sobel_1280u_720u_U0_ap_done : STD_LOGIC;
    signal Sobel_1280u_720u_U0_ap_continue : STD_LOGIC;
    signal Sobel_1280u_720u_U0_ap_idle : STD_LOGIC;
    signal Sobel_1280u_720u_U0_ap_ready : STD_LOGIC;
    signal Sobel_1280u_720u_U0_start_out : STD_LOGIC;
    signal Sobel_1280u_720u_U0_start_write : STD_LOGIC;
    signal Sobel_1280u_720u_U0_fifo2_read : STD_LOGIC;
    signal Sobel_1280u_720u_U0_fifo3_value_din : STD_LOGIC_VECTOR (7 downto 0);
    signal Sobel_1280u_720u_U0_fifo3_value_write : STD_LOGIC;
    signal Sobel_1280u_720u_U0_fifo3_grad_din : STD_LOGIC_VECTOR (1 downto 0);
    signal Sobel_1280u_720u_U0_fifo3_grad_write : STD_LOGIC;
    signal NonMaxSuppression_U0_ap_start : STD_LOGIC;
    signal NonMaxSuppression_U0_ap_done : STD_LOGIC;
    signal NonMaxSuppression_U0_ap_continue : STD_LOGIC;
    signal NonMaxSuppression_U0_ap_idle : STD_LOGIC;
    signal NonMaxSuppression_U0_ap_ready : STD_LOGIC;
    signal NonMaxSuppression_U0_start_out : STD_LOGIC;
    signal NonMaxSuppression_U0_start_write : STD_LOGIC;
    signal NonMaxSuppression_U0_fifo3_value_read : STD_LOGIC;
    signal NonMaxSuppression_U0_fifo3_grad_read : STD_LOGIC;
    signal NonMaxSuppression_U0_fifo4_din : STD_LOGIC_VECTOR (7 downto 0);
    signal NonMaxSuppression_U0_fifo4_write : STD_LOGIC;
    signal ZeroPadding_U0_ap_start : STD_LOGIC;
    signal ZeroPadding_U0_ap_done : STD_LOGIC;
    signal ZeroPadding_U0_ap_continue : STD_LOGIC;
    signal ZeroPadding_U0_ap_idle : STD_LOGIC;
    signal ZeroPadding_U0_ap_ready : STD_LOGIC;
    signal ZeroPadding_U0_start_out : STD_LOGIC;
    signal ZeroPadding_U0_start_write : STD_LOGIC;
    signal ZeroPadding_U0_fifo4_read : STD_LOGIC;
    signal ZeroPadding_U0_fifo5_din : STD_LOGIC_VECTOR (7 downto 0);
    signal ZeroPadding_U0_fifo5_write : STD_LOGIC;
    signal HystThreshold_U0_ap_start : STD_LOGIC;
    signal HystThreshold_U0_ap_done : STD_LOGIC;
    signal HystThreshold_U0_ap_continue : STD_LOGIC;
    signal HystThreshold_U0_ap_idle : STD_LOGIC;
    signal HystThreshold_U0_ap_ready : STD_LOGIC;
    signal HystThreshold_U0_start_out : STD_LOGIC;
    signal HystThreshold_U0_start_write : STD_LOGIC;
    signal HystThreshold_U0_fifo5_read : STD_LOGIC;
    signal HystThreshold_U0_fifo6_din : STD_LOGIC_VECTOR (7 downto 0);
    signal HystThreshold_U0_fifo6_write : STD_LOGIC;
    signal HystThresholdComp_U0_ap_start : STD_LOGIC;
    signal HystThresholdComp_U0_ap_done : STD_LOGIC;
    signal HystThresholdComp_U0_ap_continue : STD_LOGIC;
    signal HystThresholdComp_U0_ap_idle : STD_LOGIC;
    signal HystThresholdComp_U0_ap_ready : STD_LOGIC;
    signal HystThresholdComp_U0_start_out : STD_LOGIC;
    signal HystThresholdComp_U0_start_write : STD_LOGIC;
    signal HystThresholdComp_U0_fifo6_read : STD_LOGIC;
    signal HystThresholdComp_U0_fifo7_din : STD_LOGIC_VECTOR (7 downto 0);
    signal HystThresholdComp_U0_fifo7_write : STD_LOGIC;
    signal GrayArray2AXIS_U0_ap_start : STD_LOGIC;
    signal GrayArray2AXIS_U0_ap_done : STD_LOGIC;
    signal GrayArray2AXIS_U0_ap_continue : STD_LOGIC;
    signal GrayArray2AXIS_U0_ap_idle : STD_LOGIC;
    signal GrayArray2AXIS_U0_ap_ready : STD_LOGIC;
    signal GrayArray2AXIS_U0_axis_out_TDATA : STD_LOGIC_VECTOR (7 downto 0);
    signal GrayArray2AXIS_U0_axis_out_TVALID : STD_LOGIC;
    signal GrayArray2AXIS_U0_axis_out_TKEEP : STD_LOGIC_VECTOR (0 downto 0);
    signal GrayArray2AXIS_U0_axis_out_TSTRB : STD_LOGIC_VECTOR (0 downto 0);
    signal GrayArray2AXIS_U0_axis_out_TUSER : STD_LOGIC_VECTOR (0 downto 0);
    signal GrayArray2AXIS_U0_axis_out_TLAST : STD_LOGIC_VECTOR (0 downto 0);
    signal GrayArray2AXIS_U0_axis_out_TID : STD_LOGIC_VECTOR (0 downto 0);
    signal GrayArray2AXIS_U0_axis_out_TDEST : STD_LOGIC_VECTOR (0 downto 0);
    signal GrayArray2AXIS_U0_fifo7_read : STD_LOGIC;
    signal ap_sync_continue : STD_LOGIC;
    signal fifo1_full_n : STD_LOGIC;
    signal fifo1_dout : STD_LOGIC_VECTOR (7 downto 0);
    signal fifo1_empty_n : STD_LOGIC;
    signal fifo2_full_n : STD_LOGIC;
    signal fifo2_dout : STD_LOGIC_VECTOR (7 downto 0);
    signal fifo2_empty_n : STD_LOGIC;
    signal fifo3_value_full_n : STD_LOGIC;
    signal fifo3_value_dout : STD_LOGIC_VECTOR (7 downto 0);
    signal fifo3_value_empty_n : STD_LOGIC;
    signal fifo3_grad_full_n : STD_LOGIC;
    signal fifo3_grad_dout : STD_LOGIC_VECTOR (1 downto 0);
    signal fifo3_grad_empty_n : STD_LOGIC;
    signal fifo4_full_n : STD_LOGIC;
    signal fifo4_dout : STD_LOGIC_VECTOR (7 downto 0);
    signal fifo4_empty_n : STD_LOGIC;
    signal fifo5_full_n : STD_LOGIC;
    signal fifo5_dout : STD_LOGIC_VECTOR (7 downto 0);
    signal fifo5_empty_n : STD_LOGIC;
    signal fifo6_full_n : STD_LOGIC;
    signal fifo6_dout : STD_LOGIC_VECTOR (7 downto 0);
    signal fifo6_empty_n : STD_LOGIC;
    signal fifo7_full_n : STD_LOGIC;
    signal fifo7_dout : STD_LOGIC_VECTOR (7 downto 0);
    signal fifo7_empty_n : STD_LOGIC;
    signal start_for_GaussianBlur_U0_din : STD_LOGIC_VECTOR (0 downto 0);
    signal start_for_GaussianBlur_U0_full_n : STD_LOGIC;
    signal start_for_GaussianBlur_U0_dout : STD_LOGIC_VECTOR (0 downto 0);
    signal start_for_GaussianBlur_U0_empty_n : STD_LOGIC;
    signal start_for_Sobel_1280u_720u_U0_din : STD_LOGIC_VECTOR (0 downto 0);
    signal start_for_Sobel_1280u_720u_U0_full_n : STD_LOGIC;
    signal start_for_Sobel_1280u_720u_U0_dout : STD_LOGIC_VECTOR (0 downto 0);
    signal start_for_Sobel_1280u_720u_U0_empty_n : STD_LOGIC;
    signal start_for_NonMaxSuppression_U0_din : STD_LOGIC_VECTOR (0 downto 0);
    signal start_for_NonMaxSuppression_U0_full_n : STD_LOGIC;
    signal start_for_NonMaxSuppression_U0_dout : STD_LOGIC_VECTOR (0 downto 0);
    signal start_for_NonMaxSuppression_U0_empty_n : STD_LOGIC;
    signal start_for_ZeroPadding_U0_din : STD_LOGIC_VECTOR (0 downto 0);
    signal start_for_ZeroPadding_U0_full_n : STD_LOGIC;
    signal start_for_ZeroPadding_U0_dout : STD_LOGIC_VECTOR (0 downto 0);
    signal start_for_ZeroPadding_U0_empty_n : STD_LOGIC;
    signal start_for_HystThreshold_U0_din : STD_LOGIC_VECTOR (0 downto 0);
    signal start_for_HystThreshold_U0_full_n : STD_LOGIC;
    signal start_for_HystThreshold_U0_dout : STD_LOGIC_VECTOR (0 downto 0);
    signal start_for_HystThreshold_U0_empty_n : STD_LOGIC;
    signal start_for_HystThresholdComp_U0_din : STD_LOGIC_VECTOR (0 downto 0);
    signal start_for_HystThresholdComp_U0_full_n : STD_LOGIC;
    signal start_for_HystThresholdComp_U0_dout : STD_LOGIC_VECTOR (0 downto 0);
    signal start_for_HystThresholdComp_U0_empty_n : STD_LOGIC;
    signal start_for_GrayArray2AXIS_U0_din : STD_LOGIC_VECTOR (0 downto 0);
    signal start_for_GrayArray2AXIS_U0_full_n : STD_LOGIC;
    signal start_for_GrayArray2AXIS_U0_dout : STD_LOGIC_VECTOR (0 downto 0);
    signal start_for_GrayArray2AXIS_U0_empty_n : STD_LOGIC;
    signal GrayArray2AXIS_U0_start_full_n : STD_LOGIC;
    signal GrayArray2AXIS_U0_start_write : STD_LOGIC;

    component AXIS2GrayArray IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        start_full_n : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        start_out : OUT STD_LOGIC;
        start_write : OUT STD_LOGIC;
        axis_in_TDATA : IN STD_LOGIC_VECTOR (23 downto 0);
        axis_in_TVALID : IN STD_LOGIC;
        axis_in_TREADY : OUT STD_LOGIC;
        axis_in_TKEEP : IN STD_LOGIC_VECTOR (2 downto 0);
        axis_in_TSTRB : IN STD_LOGIC_VECTOR (2 downto 0);
        axis_in_TUSER : IN STD_LOGIC_VECTOR (0 downto 0);
        axis_in_TLAST : IN STD_LOGIC_VECTOR (0 downto 0);
        axis_in_TID : IN STD_LOGIC_VECTOR (0 downto 0);
        axis_in_TDEST : IN STD_LOGIC_VECTOR (0 downto 0);
        fifo1_din : OUT STD_LOGIC_VECTOR (7 downto 0);
        fifo1_full_n : IN STD_LOGIC;
        fifo1_write : OUT STD_LOGIC );
    end component;


    component GaussianBlur IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        start_full_n : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        start_out : OUT STD_LOGIC;
        start_write : OUT STD_LOGIC;
        fifo1_dout : IN STD_LOGIC_VECTOR (7 downto 0);
        fifo1_empty_n : IN STD_LOGIC;
        fifo1_read : OUT STD_LOGIC;
        fifo2_din : OUT STD_LOGIC_VECTOR (7 downto 0);
        fifo2_full_n : IN STD_LOGIC;
        fifo2_write : OUT STD_LOGIC );
    end component;


    component Sobel_1280u_720u_s IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        start_full_n : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        start_out : OUT STD_LOGIC;
        start_write : OUT STD_LOGIC;
        fifo2_dout : IN STD_LOGIC_VECTOR (7 downto 0);
        fifo2_empty_n : IN STD_LOGIC;
        fifo2_read : OUT STD_LOGIC;
        fifo3_value_din : OUT STD_LOGIC_VECTOR (7 downto 0);
        fifo3_value_full_n : IN STD_LOGIC;
        fifo3_value_write : OUT STD_LOGIC;
        fifo3_grad_din : OUT STD_LOGIC_VECTOR (1 downto 0);
        fifo3_grad_full_n : IN STD_LOGIC;
        fifo3_grad_write : OUT STD_LOGIC );
    end component;


    component NonMaxSuppression IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        start_full_n : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        start_out : OUT STD_LOGIC;
        start_write : OUT STD_LOGIC;
        fifo3_value_dout : IN STD_LOGIC_VECTOR (7 downto 0);
        fifo3_value_empty_n : IN STD_LOGIC;
        fifo3_value_read : OUT STD_LOGIC;
        fifo3_grad_dout : IN STD_LOGIC_VECTOR (1 downto 0);
        fifo3_grad_empty_n : IN STD_LOGIC;
        fifo3_grad_read : OUT STD_LOGIC;
        fifo4_din : OUT STD_LOGIC_VECTOR (7 downto 0);
        fifo4_full_n : IN STD_LOGIC;
        fifo4_write : OUT STD_LOGIC );
    end component;


    component ZeroPadding IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        start_full_n : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        start_out : OUT STD_LOGIC;
        start_write : OUT STD_LOGIC;
        fifo4_dout : IN STD_LOGIC_VECTOR (7 downto 0);
        fifo4_empty_n : IN STD_LOGIC;
        fifo4_read : OUT STD_LOGIC;
        fifo5_din : OUT STD_LOGIC_VECTOR (7 downto 0);
        fifo5_full_n : IN STD_LOGIC;
        fifo5_write : OUT STD_LOGIC );
    end component;


    component HystThreshold IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        start_full_n : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        start_out : OUT STD_LOGIC;
        start_write : OUT STD_LOGIC;
        fifo5_dout : IN STD_LOGIC_VECTOR (7 downto 0);
        fifo5_empty_n : IN STD_LOGIC;
        fifo5_read : OUT STD_LOGIC;
        fifo6_din : OUT STD_LOGIC_VECTOR (7 downto 0);
        fifo6_full_n : IN STD_LOGIC;
        fifo6_write : OUT STD_LOGIC );
    end component;


    component HystThresholdComp IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        start_full_n : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        start_out : OUT STD_LOGIC;
        start_write : OUT STD_LOGIC;
        fifo6_dout : IN STD_LOGIC_VECTOR (7 downto 0);
        fifo6_empty_n : IN STD_LOGIC;
        fifo6_read : OUT STD_LOGIC;
        fifo7_din : OUT STD_LOGIC_VECTOR (7 downto 0);
        fifo7_full_n : IN STD_LOGIC;
        fifo7_write : OUT STD_LOGIC );
    end component;


    component GrayArray2AXIS IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        axis_out_TDATA : OUT STD_LOGIC_VECTOR (7 downto 0);
        axis_out_TVALID : OUT STD_LOGIC;
        axis_out_TREADY : IN STD_LOGIC;
        axis_out_TKEEP : OUT STD_LOGIC_VECTOR (0 downto 0);
        axis_out_TSTRB : OUT STD_LOGIC_VECTOR (0 downto 0);
        axis_out_TUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
        axis_out_TLAST : OUT STD_LOGIC_VECTOR (0 downto 0);
        axis_out_TID : OUT STD_LOGIC_VECTOR (0 downto 0);
        axis_out_TDEST : OUT STD_LOGIC_VECTOR (0 downto 0);
        fifo7_dout : IN STD_LOGIC_VECTOR (7 downto 0);
        fifo7_empty_n : IN STD_LOGIC;
        fifo7_read : OUT STD_LOGIC );
    end component;


    component fifo_w8_d1_A IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (7 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (7 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component fifo_w2_d1_A IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (1 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (1 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component start_for_Gaussiaocq IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (0 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (0 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component start_for_Sobel_1pcA IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (0 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (0 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component start_for_NonMaxSqcK IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (0 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (0 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component start_for_ZeroPadrcU IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (0 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (0 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component start_for_HystThrsc4 IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (0 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (0 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component start_for_HystThrtde IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (0 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (0 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component start_for_GrayArrudo IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (0 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (0 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;



begin
    AXIS2GrayArray_U0 : component AXIS2GrayArray
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => AXIS2GrayArray_U0_ap_start,
        start_full_n => start_for_GaussianBlur_U0_full_n,
        ap_done => AXIS2GrayArray_U0_ap_done,
        ap_continue => AXIS2GrayArray_U0_ap_continue,
        ap_idle => AXIS2GrayArray_U0_ap_idle,
        ap_ready => AXIS2GrayArray_U0_ap_ready,
        start_out => AXIS2GrayArray_U0_start_out,
        start_write => AXIS2GrayArray_U0_start_write,
        axis_in_TDATA => axis_in_TDATA,
        axis_in_TVALID => axis_in_TVALID,
        axis_in_TREADY => AXIS2GrayArray_U0_axis_in_TREADY,
        axis_in_TKEEP => axis_in_TKEEP,
        axis_in_TSTRB => axis_in_TSTRB,
        axis_in_TUSER => axis_in_TUSER,
        axis_in_TLAST => axis_in_TLAST,
        axis_in_TID => axis_in_TID,
        axis_in_TDEST => axis_in_TDEST,
        fifo1_din => AXIS2GrayArray_U0_fifo1_din,
        fifo1_full_n => fifo1_full_n,
        fifo1_write => AXIS2GrayArray_U0_fifo1_write);

    GaussianBlur_U0 : component GaussianBlur
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => GaussianBlur_U0_ap_start,
        start_full_n => start_for_Sobel_1280u_720u_U0_full_n,
        ap_done => GaussianBlur_U0_ap_done,
        ap_continue => GaussianBlur_U0_ap_continue,
        ap_idle => GaussianBlur_U0_ap_idle,
        ap_ready => GaussianBlur_U0_ap_ready,
        start_out => GaussianBlur_U0_start_out,
        start_write => GaussianBlur_U0_start_write,
        fifo1_dout => fifo1_dout,
        fifo1_empty_n => fifo1_empty_n,
        fifo1_read => GaussianBlur_U0_fifo1_read,
        fifo2_din => GaussianBlur_U0_fifo2_din,
        fifo2_full_n => fifo2_full_n,
        fifo2_write => GaussianBlur_U0_fifo2_write);

    Sobel_1280u_720u_U0 : component Sobel_1280u_720u_s
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => Sobel_1280u_720u_U0_ap_start,
        start_full_n => start_for_NonMaxSuppression_U0_full_n,
        ap_done => Sobel_1280u_720u_U0_ap_done,
        ap_continue => Sobel_1280u_720u_U0_ap_continue,
        ap_idle => Sobel_1280u_720u_U0_ap_idle,
        ap_ready => Sobel_1280u_720u_U0_ap_ready,
        start_out => Sobel_1280u_720u_U0_start_out,
        start_write => Sobel_1280u_720u_U0_start_write,
        fifo2_dout => fifo2_dout,
        fifo2_empty_n => fifo2_empty_n,
        fifo2_read => Sobel_1280u_720u_U0_fifo2_read,
        fifo3_value_din => Sobel_1280u_720u_U0_fifo3_value_din,
        fifo3_value_full_n => fifo3_value_full_n,
        fifo3_value_write => Sobel_1280u_720u_U0_fifo3_value_write,
        fifo3_grad_din => Sobel_1280u_720u_U0_fifo3_grad_din,
        fifo3_grad_full_n => fifo3_grad_full_n,
        fifo3_grad_write => Sobel_1280u_720u_U0_fifo3_grad_write);

    NonMaxSuppression_U0 : component NonMaxSuppression
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => NonMaxSuppression_U0_ap_start,
        start_full_n => start_for_ZeroPadding_U0_full_n,
        ap_done => NonMaxSuppression_U0_ap_done,
        ap_continue => NonMaxSuppression_U0_ap_continue,
        ap_idle => NonMaxSuppression_U0_ap_idle,
        ap_ready => NonMaxSuppression_U0_ap_ready,
        start_out => NonMaxSuppression_U0_start_out,
        start_write => NonMaxSuppression_U0_start_write,
        fifo3_value_dout => fifo3_value_dout,
        fifo3_value_empty_n => fifo3_value_empty_n,
        fifo3_value_read => NonMaxSuppression_U0_fifo3_value_read,
        fifo3_grad_dout => fifo3_grad_dout,
        fifo3_grad_empty_n => fifo3_grad_empty_n,
        fifo3_grad_read => NonMaxSuppression_U0_fifo3_grad_read,
        fifo4_din => NonMaxSuppression_U0_fifo4_din,
        fifo4_full_n => fifo4_full_n,
        fifo4_write => NonMaxSuppression_U0_fifo4_write);

    ZeroPadding_U0 : component ZeroPadding
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => ZeroPadding_U0_ap_start,
        start_full_n => start_for_HystThreshold_U0_full_n,
        ap_done => ZeroPadding_U0_ap_done,
        ap_continue => ZeroPadding_U0_ap_continue,
        ap_idle => ZeroPadding_U0_ap_idle,
        ap_ready => ZeroPadding_U0_ap_ready,
        start_out => ZeroPadding_U0_start_out,
        start_write => ZeroPadding_U0_start_write,
        fifo4_dout => fifo4_dout,
        fifo4_empty_n => fifo4_empty_n,
        fifo4_read => ZeroPadding_U0_fifo4_read,
        fifo5_din => ZeroPadding_U0_fifo5_din,
        fifo5_full_n => fifo5_full_n,
        fifo5_write => ZeroPadding_U0_fifo5_write);

    HystThreshold_U0 : component HystThreshold
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => HystThreshold_U0_ap_start,
        start_full_n => start_for_HystThresholdComp_U0_full_n,
        ap_done => HystThreshold_U0_ap_done,
        ap_continue => HystThreshold_U0_ap_continue,
        ap_idle => HystThreshold_U0_ap_idle,
        ap_ready => HystThreshold_U0_ap_ready,
        start_out => HystThreshold_U0_start_out,
        start_write => HystThreshold_U0_start_write,
        fifo5_dout => fifo5_dout,
        fifo5_empty_n => fifo5_empty_n,
        fifo5_read => HystThreshold_U0_fifo5_read,
        fifo6_din => HystThreshold_U0_fifo6_din,
        fifo6_full_n => fifo6_full_n,
        fifo6_write => HystThreshold_U0_fifo6_write);

    HystThresholdComp_U0 : component HystThresholdComp
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => HystThresholdComp_U0_ap_start,
        start_full_n => start_for_GrayArray2AXIS_U0_full_n,
        ap_done => HystThresholdComp_U0_ap_done,
        ap_continue => HystThresholdComp_U0_ap_continue,
        ap_idle => HystThresholdComp_U0_ap_idle,
        ap_ready => HystThresholdComp_U0_ap_ready,
        start_out => HystThresholdComp_U0_start_out,
        start_write => HystThresholdComp_U0_start_write,
        fifo6_dout => fifo6_dout,
        fifo6_empty_n => fifo6_empty_n,
        fifo6_read => HystThresholdComp_U0_fifo6_read,
        fifo7_din => HystThresholdComp_U0_fifo7_din,
        fifo7_full_n => fifo7_full_n,
        fifo7_write => HystThresholdComp_U0_fifo7_write);

    GrayArray2AXIS_U0 : component GrayArray2AXIS
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => GrayArray2AXIS_U0_ap_start,
        ap_done => GrayArray2AXIS_U0_ap_done,
        ap_continue => GrayArray2AXIS_U0_ap_continue,
        ap_idle => GrayArray2AXIS_U0_ap_idle,
        ap_ready => GrayArray2AXIS_U0_ap_ready,
        axis_out_TDATA => GrayArray2AXIS_U0_axis_out_TDATA,
        axis_out_TVALID => GrayArray2AXIS_U0_axis_out_TVALID,
        axis_out_TREADY => axis_out_TREADY,
        axis_out_TKEEP => GrayArray2AXIS_U0_axis_out_TKEEP,
        axis_out_TSTRB => GrayArray2AXIS_U0_axis_out_TSTRB,
        axis_out_TUSER => GrayArray2AXIS_U0_axis_out_TUSER,
        axis_out_TLAST => GrayArray2AXIS_U0_axis_out_TLAST,
        axis_out_TID => GrayArray2AXIS_U0_axis_out_TID,
        axis_out_TDEST => GrayArray2AXIS_U0_axis_out_TDEST,
        fifo7_dout => fifo7_dout,
        fifo7_empty_n => fifo7_empty_n,
        fifo7_read => GrayArray2AXIS_U0_fifo7_read);

    fifo1_U : component fifo_w8_d1_A
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => AXIS2GrayArray_U0_fifo1_din,
        if_full_n => fifo1_full_n,
        if_write => AXIS2GrayArray_U0_fifo1_write,
        if_dout => fifo1_dout,
        if_empty_n => fifo1_empty_n,
        if_read => GaussianBlur_U0_fifo1_read);

    fifo2_U : component fifo_w8_d1_A
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => GaussianBlur_U0_fifo2_din,
        if_full_n => fifo2_full_n,
        if_write => GaussianBlur_U0_fifo2_write,
        if_dout => fifo2_dout,
        if_empty_n => fifo2_empty_n,
        if_read => Sobel_1280u_720u_U0_fifo2_read);

    fifo3_value_U : component fifo_w8_d1_A
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => Sobel_1280u_720u_U0_fifo3_value_din,
        if_full_n => fifo3_value_full_n,
        if_write => Sobel_1280u_720u_U0_fifo3_value_write,
        if_dout => fifo3_value_dout,
        if_empty_n => fifo3_value_empty_n,
        if_read => NonMaxSuppression_U0_fifo3_value_read);

    fifo3_grad_U : component fifo_w2_d1_A
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => Sobel_1280u_720u_U0_fifo3_grad_din,
        if_full_n => fifo3_grad_full_n,
        if_write => Sobel_1280u_720u_U0_fifo3_grad_write,
        if_dout => fifo3_grad_dout,
        if_empty_n => fifo3_grad_empty_n,
        if_read => NonMaxSuppression_U0_fifo3_grad_read);

    fifo4_U : component fifo_w8_d1_A
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => NonMaxSuppression_U0_fifo4_din,
        if_full_n => fifo4_full_n,
        if_write => NonMaxSuppression_U0_fifo4_write,
        if_dout => fifo4_dout,
        if_empty_n => fifo4_empty_n,
        if_read => ZeroPadding_U0_fifo4_read);

    fifo5_U : component fifo_w8_d1_A
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => ZeroPadding_U0_fifo5_din,
        if_full_n => fifo5_full_n,
        if_write => ZeroPadding_U0_fifo5_write,
        if_dout => fifo5_dout,
        if_empty_n => fifo5_empty_n,
        if_read => HystThreshold_U0_fifo5_read);

    fifo6_U : component fifo_w8_d1_A
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => HystThreshold_U0_fifo6_din,
        if_full_n => fifo6_full_n,
        if_write => HystThreshold_U0_fifo6_write,
        if_dout => fifo6_dout,
        if_empty_n => fifo6_empty_n,
        if_read => HystThresholdComp_U0_fifo6_read);

    fifo7_U : component fifo_w8_d1_A
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => HystThresholdComp_U0_fifo7_din,
        if_full_n => fifo7_full_n,
        if_write => HystThresholdComp_U0_fifo7_write,
        if_dout => fifo7_dout,
        if_empty_n => fifo7_empty_n,
        if_read => GrayArray2AXIS_U0_fifo7_read);

    start_for_Gaussiaocq_U : component start_for_Gaussiaocq
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => start_for_GaussianBlur_U0_din,
        if_full_n => start_for_GaussianBlur_U0_full_n,
        if_write => AXIS2GrayArray_U0_start_write,
        if_dout => start_for_GaussianBlur_U0_dout,
        if_empty_n => start_for_GaussianBlur_U0_empty_n,
        if_read => GaussianBlur_U0_ap_ready);

    start_for_Sobel_1pcA_U : component start_for_Sobel_1pcA
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => start_for_Sobel_1280u_720u_U0_din,
        if_full_n => start_for_Sobel_1280u_720u_U0_full_n,
        if_write => GaussianBlur_U0_start_write,
        if_dout => start_for_Sobel_1280u_720u_U0_dout,
        if_empty_n => start_for_Sobel_1280u_720u_U0_empty_n,
        if_read => Sobel_1280u_720u_U0_ap_ready);

    start_for_NonMaxSqcK_U : component start_for_NonMaxSqcK
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => start_for_NonMaxSuppression_U0_din,
        if_full_n => start_for_NonMaxSuppression_U0_full_n,
        if_write => Sobel_1280u_720u_U0_start_write,
        if_dout => start_for_NonMaxSuppression_U0_dout,
        if_empty_n => start_for_NonMaxSuppression_U0_empty_n,
        if_read => NonMaxSuppression_U0_ap_ready);

    start_for_ZeroPadrcU_U : component start_for_ZeroPadrcU
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => start_for_ZeroPadding_U0_din,
        if_full_n => start_for_ZeroPadding_U0_full_n,
        if_write => NonMaxSuppression_U0_start_write,
        if_dout => start_for_ZeroPadding_U0_dout,
        if_empty_n => start_for_ZeroPadding_U0_empty_n,
        if_read => ZeroPadding_U0_ap_ready);

    start_for_HystThrsc4_U : component start_for_HystThrsc4
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => start_for_HystThreshold_U0_din,
        if_full_n => start_for_HystThreshold_U0_full_n,
        if_write => ZeroPadding_U0_start_write,
        if_dout => start_for_HystThreshold_U0_dout,
        if_empty_n => start_for_HystThreshold_U0_empty_n,
        if_read => HystThreshold_U0_ap_ready);

    start_for_HystThrtde_U : component start_for_HystThrtde
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => start_for_HystThresholdComp_U0_din,
        if_full_n => start_for_HystThresholdComp_U0_full_n,
        if_write => HystThreshold_U0_start_write,
        if_dout => start_for_HystThresholdComp_U0_dout,
        if_empty_n => start_for_HystThresholdComp_U0_empty_n,
        if_read => HystThresholdComp_U0_ap_ready);

    start_for_GrayArrudo_U : component start_for_GrayArrudo
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => start_for_GrayArray2AXIS_U0_din,
        if_full_n => start_for_GrayArray2AXIS_U0_full_n,
        if_write => HystThresholdComp_U0_start_write,
        if_dout => start_for_GrayArray2AXIS_U0_dout,
        if_empty_n => start_for_GrayArray2AXIS_U0_empty_n,
        if_read => GrayArray2AXIS_U0_ap_ready);




    AXIS2GrayArray_U0_ap_continue <= ap_const_logic_1;
    AXIS2GrayArray_U0_ap_start <= ap_const_logic_1;
    GaussianBlur_U0_ap_continue <= ap_const_logic_1;
    GaussianBlur_U0_ap_start <= start_for_GaussianBlur_U0_empty_n;
    GrayArray2AXIS_U0_ap_continue <= ap_const_logic_1;
    GrayArray2AXIS_U0_ap_start <= start_for_GrayArray2AXIS_U0_empty_n;
    GrayArray2AXIS_U0_start_full_n <= ap_const_logic_1;
    GrayArray2AXIS_U0_start_write <= ap_const_logic_0;
    HystThresholdComp_U0_ap_continue <= ap_const_logic_1;
    HystThresholdComp_U0_ap_start <= start_for_HystThresholdComp_U0_empty_n;
    HystThreshold_U0_ap_continue <= ap_const_logic_1;
    HystThreshold_U0_ap_start <= start_for_HystThreshold_U0_empty_n;
    NonMaxSuppression_U0_ap_continue <= ap_const_logic_1;
    NonMaxSuppression_U0_ap_start <= start_for_NonMaxSuppression_U0_empty_n;
    Sobel_1280u_720u_U0_ap_continue <= ap_const_logic_1;
    Sobel_1280u_720u_U0_ap_start <= start_for_Sobel_1280u_720u_U0_empty_n;
    ZeroPadding_U0_ap_continue <= ap_const_logic_1;
    ZeroPadding_U0_ap_start <= start_for_ZeroPadding_U0_empty_n;

    ap_rst_n_inv_assign_proc : process(ap_rst_n)
    begin
                ap_rst_n_inv <= not(ap_rst_n);
    end process;

    ap_sync_continue <= ap_const_logic_0;
    axis_in_TREADY <= AXIS2GrayArray_U0_axis_in_TREADY;
    axis_out_TDATA <= GrayArray2AXIS_U0_axis_out_TDATA;
    axis_out_TDEST <= GrayArray2AXIS_U0_axis_out_TDEST;
    axis_out_TID <= GrayArray2AXIS_U0_axis_out_TID;
    axis_out_TKEEP <= GrayArray2AXIS_U0_axis_out_TKEEP;
    axis_out_TLAST <= GrayArray2AXIS_U0_axis_out_TLAST;
    axis_out_TSTRB <= GrayArray2AXIS_U0_axis_out_TSTRB;
    axis_out_TUSER <= GrayArray2AXIS_U0_axis_out_TUSER;
    axis_out_TVALID <= GrayArray2AXIS_U0_axis_out_TVALID;
    start_for_GaussianBlur_U0_din <= (0=>ap_const_logic_1, others=>'-');
    start_for_GrayArray2AXIS_U0_din <= (0=>ap_const_logic_1, others=>'-');
    start_for_HystThresholdComp_U0_din <= (0=>ap_const_logic_1, others=>'-');
    start_for_HystThreshold_U0_din <= (0=>ap_const_logic_1, others=>'-');
    start_for_NonMaxSuppression_U0_din <= (0=>ap_const_logic_1, others=>'-');
    start_for_Sobel_1280u_720u_U0_din <= (0=>ap_const_logic_1, others=>'-');
    start_for_ZeroPadding_U0_din <= (0=>ap_const_logic_1, others=>'-');
end behav;
