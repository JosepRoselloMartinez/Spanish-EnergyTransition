## Constraints needed to reproduce the scenario for CH in 2011
## All data are calculated in Excel file

## Data from Ree(Red Electrica Española: informe electrico 2015)

subject to elec_prod_NUCLEAR: sum {t in PERIODS, h in HOUR_OF_PERIOD [t], td in TYPICAL_DAY_OF_PERIOD [t]}   (   F_t ['NUCLEAR', h , td] )  = 54755;#GWh 54755;
subject to elec_prod_CCGT: sum {t in PERIODS, h in HOUR_OF_PERIOD [t], td in TYPICAL_DAY_OF_PERIOD [t]} (        F_t ['CCGT', h , td] ) = 35854;#29357+6497(fuel/gas)GWh;
subject to elec_prod_COAL_US: sum {t in PERIODS, h in HOUR_OF_PERIOD [t], td in TYPICAL_DAY_OF_PERIOD [t]} (     F_t ['COAL_US', h , td] )= 52789;#GWh assume conventional coal as coal ultrasupercritical; 
subject to elec_prod_COAL_IGCC: sum {t in PERIODS, h in HOUR_OF_PERIOD [t], td in TYPICAL_DAY_OF_PERIOD [t]} (   F_t ['COAL_IGCC', h , td] ) = 0;
subject to elec_prod_PV: sum {t in PERIODS, h in HOUR_OF_PERIOD [t], td in TYPICAL_DAY_OF_PERIOD [t]} (F_t ['PV', h , td] ) = 8236;#GWh;
#fix F ['PV'] :=4.664;#GW
subject to elec_prod_WIND_ONSHORE: sum {t in PERIODS, h in HOUR_OF_PERIOD [t], td in TYPICAL_DAY_OF_PERIOD [t]}  ( F_t ['WIND_ONSHORE' , h , td])  = 48120; #GWh 48109+11;
#fix F ['WIND_ONSHORE'] :=23.020;#GW
subject to elec_prod_WIND_OFFSHORE: sum {t in PERIODS, h in HOUR_OF_PERIOD [t], td in TYPICAL_DAY_OF_PERIOD [t]} ( F_t ['WIND_OFFSHORE', h , td] ) = 0;
subject to elec_prod_HYDRO_RIVER: sum {t in PERIODS, h in HOUR_OF_PERIOD [t], td in TYPICAL_DAY_OF_PERIOD [t]} (F_t ['HYDRO_RIVER', h , td] ) = 8234;#GWh;
subject to elec_prod_HYDRO_DAM: sum {t in PERIODS, h in HOUR_OF_PERIOD [t], td in TYPICAL_DAY_OF_PERIOD [t]} (F_t ['HYDRO_DAM', h , td] ) =19823;#GWh;
subject to heat_prod_GEOTHERMAL: sum {t in PERIODS, h in HOUR_OF_PERIOD [t], td in TYPICAL_DAY_OF_PERIOD [t]} (F_t ['DHN_DEEP_GEO', h , td] ) = 220;#GWh 19ktoe Data from libro de la energía 2015;
subject to elec_prod_GEOTHERMAL: sum {t in PERIODS, h in HOUR_OF_PERIOD [t], td in TYPICAL_DAY_OF_PERIOD [t]} (F_t ['GEOTHERMAL', h , td] ) = 0;
subject to elec_prod_WAVE: sum {t in PERIODS, h in HOUR_OF_PERIOD [t], td in TYPICAL_DAY_OF_PERIOD [t]} (F_t ['WAVE', h , td] ) = 0.25;#GWh;
subject to elec_prod_PT_POWER_BLOCK: sum {t in PERIODS, h in HOUR_OF_PERIOD [t], td in TYPICAL_DAY_OF_PERIOD [t]} (F_t ['PT_POWER_BLOCK', h , td] ) = 4904.75;#GWh;
#fix F ['PT_POWER_BLOCK'] :=2.2225;#GW
subject to elec_prod_ST_POWER_BLOCK: sum {t in PERIODS, h in HOUR_OF_PERIOD [t], td in TYPICAL_DAY_OF_PERIOD [t]} (F_t ['ST_POWER_BLOCK', h , td] ) = 178;#GWh;
#fix F ['ST_POWER_BLOCK'] :=0.051;#GW
subject to elec_prod_STIRLING_DISH: sum {t in PERIODS, h in HOUR_OF_PERIOD [t], td in TYPICAL_DAY_OF_PERIOD [t]} (F_t ['STIRLING_DISH', h , td] ) = 2.25;#GWh;
#fix F ['STIRLING_DISH'] :=0.00225;#GW


subject to elec_prod_IND_COGEN_WASTE: sum {t in PERIODS, h in HOUR_OF_PERIOD [t], td in TYPICAL_DAY_OF_PERIOD [t]} (F_t ['IND_COGEN_WASTE', h , td] )*0.6667 =1766;#GWh;
subject to elec_prod_IND_COGEN_GAS: sum {t in PERIODS, h in HOUR_OF_PERIOD [t], td in TYPICAL_DAY_OF_PERIOD [t]} (F_t ['IND_COGEN_GAS', h , td] )*0.7651= 25108;#GWh;
subject to elec_prod_BIOMETHANATION: sum {t in PERIODS, h in HOUR_OF_PERIOD [t], td in TYPICAL_DAY_OF_PERIOD [t]} (F_t ['BIOMETHANATION', h , td] )/2.73 =1174;#GWh;

##Emissions 2015
let gwp_op["COAL"] := 0.36;#0.354;# gwp_direct =0.34;
let gwp_op["DIESEL"] := 0.27;#0.2919;gwp_direct =0.27;#0.3;
let gwp_op["GASOLINE"] := 0.25;#0.2913;#gwp_direct =0.25;#0.29;
let gwp_op["NG"] := 0.2;#0.237;gwp_direct =0.2;#0,26;
let gwp_op["WASTE"] := 0.26;#0.237;gwp_direct =0.26;

let gwp_op["LFO"] := 0.28;#gwp_direct =0.28;

let gwp_op["ELECTRICITY"] := 0;
let gwp_op["BIOETHANOL"] := 0.25;
let gwp_op["BIODIESEL"] := 0.27;
let gwp_op["URANIUM"] := 0;
let gwp_op["WASTE"] := 0.26;
let gwp_op["WET_BIOMASS"] := 0;
let gwp_op["WOOD"] := 0;

# Biomass generation for electricity

let layers_in_out ["DHN_COGEN_WOOD","HEAT_LOW_T_DHN"] := 0;
let layers_in_out ["DHN_COGEN_WOOD","ELECTRICITY"] := 1;
let layers_in_out ["DHN_COGEN_WOOD","WOOD"] := -2;
subject to elec_prod_WOOD_elec: sum {t in PERIODS, h in HOUR_OF_PERIOD [t], td in TYPICAL_DAY_OF_PERIOD [t]} (F_t ['DHN_COGEN_WOOD', h , td] )= 3818;#GWh;

#Nuclear generation for electricity
let layers_in_out["NUCLEAR","URANIUM"] := -3.030303;

#Coal generation for electricity
let layers_in_out["COAL_US","COAL"] := -2.7778;

#CCGT generation for electricity
let layers_in_out["CCGT","NG"] := -1.724137;#efficiency of 58%;

#Gas generation for heat
let layers_in_out["IND_BOILER_GAS","NG"] := -1.204;#efficiency of 83% HR4 Roadmap Profile of heating and Cooling;
let layers_in_out["DEC_BOILER_GAS","NG"] := -1.1764;#efficiency of 82,4% HR4 Profile of heating and Cooling 

#Wood generation for heat
let layers_in_out["IND_BOILER_WOOD","WOOD"] := -1.17647;#efficiency of 85% HR4 Roadmap Profile of heating and Cooling;
let layers_in_out["DEC_BOILER_WOOD","WOOD"] := -1.4285;#efficiency of 70% HR4 Roadmap Profile of heating and Cooling

#LFO generation for heat
let layers_in_out["IND_BOILER_OIL","LFO"] := -1.25;#efficiency of 80% https://iea-etsap.org/E-TechDS/PDF/I01-ind_boilers-GS-AD-gct.pdf;
let layers_in_out["DEC_BOILER_OIL","LFO"] := -1.398;#efficiency of 75% https://ec.europa.eu/energy/sites/ener/files/documents/technical_analysis_residential_heat.pdf;

##Biofuels
subject to biofuels_2015: sum {t in PERIODS, h in HOUR_OF_PERIOD [t], td in TYPICAL_DAY_OF_PERIOD [t]} (F_t ['BIOETHANOL', h , td] ) = 2232.96;# 192 ktoe biogasoline
subject to biofuels_2015_2: sum {t in PERIODS, h in HOUR_OF_PERIOD [t], td in TYPICAL_DAY_OF_PERIOD [t]} (F_t ['BIODIESEL', h , td] )  = 9164.44;# 788 + 0 ktoe biodiesel+other liquid biofuels
#subject to biogas_2015: sum {t in PERIODS, h in HOUR_OF_PERIOD [t], td in TYPICAL_DAY_OF_PERIOD [t]} (F_t ['BIOMETHANATION', h , td] )  = 3047.06;#192 ktoe biogas 


# subject to elec_prod_GT_OIL: sum {t in PERIODS, h in HOUR_OF_PERIOD [t], td in TYPICAL_DAY_OF_PERIOD [t]} (F_t ['GT_OIL', h , td] ) = 200;
# subject to elec_prod_INCINERATOR: sum {t in PERIODS, h in HOUR_OF_PERIOD [t], td in TYPICAL_DAY_OF_PERIOD [t]} (F_t ['INCINERATOR', h , td] ) = 530;
# subject to elec_prod_BIOMASS_ST: sum {t in PERIODS, h in HOUR_OF_PERIOD [t], td in TYPICAL_DAY_OF_PERIOD [t]} (F_t ['BIOMASS_ST', h , td] ) = 3600;

#End-uses Demand matrix
let end_uses_demand_year ["ELECTRICITY", "HOUSEHOLDS"]:=59619.47;#GWh 66129.55;
let end_uses_demand_year ["ELECTRICITY", "INDUSTRY"]:=63040.51;#GWh 74106.74;
let end_uses_demand_year ["ELECTRICITY", "SERVICES"]:=48822.90;#GWh 55513.46;
let end_uses_demand_year ["ELECTRICITY", "TRANSPORTATION"]:=0;#GWh
let end_uses_demand_year ["LIGHTING", "HOUSEHOLDS"]:=4173.62;#GWh 8892.67;
let end_uses_demand_year ["LIGHTING", "INDUSTRY"]:=6446.006055;#GWh 7329.24;
let end_uses_demand_year ["LIGHTING", "SERVICES"]:=13207.29;#GWh 21588.57; 
let end_uses_demand_year ["LIGHTING", "TRANSPORTATION"]:=0;#GWh
let end_uses_demand_year ["HEAT_HIGH_T", "HOUSEHOLDS"]:=0;#GWh
let end_uses_demand_year ["HEAT_HIGH_T", "INDUSTRY"]:=114681.6647;#GWh
let end_uses_demand_year ["HEAT_HIGH_T", "SERVICES"]:=4439.598586;#GWh
let end_uses_demand_year ["HEAT_HIGH_T", "TRANSPORTATION"]:=0;#GWh
let end_uses_demand_year ["HEAT_LOW_T_SH", "HOUSEHOLDS"]:=49217.925706259;#GWh 60787.73;
let end_uses_demand_year ["HEAT_LOW_T_SH", "INDUSTRY"]:=22269.59981;#GWh
let end_uses_demand_year ["HEAT_LOW_T_SH", "SERVICES"]:=28792.7528;#GWh
let end_uses_demand_year ["HEAT_LOW_T_SH", "TRANSPORTATION"]:=0;#GWh
let end_uses_demand_year ["HEAT_LOW_T_HW", "HOUSEHOLDS"]:=43324.60398;#GWh
let end_uses_demand_year ["HEAT_LOW_T_HW", "INDUSTRY"]:=0;#GWh
let end_uses_demand_year ["HEAT_LOW_T_HW", "SERVICES"]:=4422.54503;#GWh
let end_uses_demand_year ["HEAT_LOW_T_HW", "TRANSPORTATION"]:=0;#GWh
let end_uses_demand_year ["PROCESS_COOLING", "HOUSEHOLDS"]:=0;#GWh
let end_uses_demand_year ["PROCESS_COOLING", "INDUSTRY"]:=15438.63658;#GWh
let end_uses_demand_year ["PROCESS_COOLING", "SERVICES"]:=9552.047114;#GWh
let end_uses_demand_year ["PROCESS_COOLING", "TRANSPORTATION"]:=0;#GWh
let end_uses_demand_year ["SPACE_COOLING", "HOUSEHOLDS"]:=11951.30749;#GWh
let end_uses_demand_year ["SPACE_COOLING", "INDUSTRY"]:=11686.50279;#GWh
let end_uses_demand_year ["SPACE_COOLING", "SERVICES"]:=34487.71344;#GWh
let end_uses_demand_year ["SPACE_COOLING", "TRANSPORTATION"]:=0;#GWh
let end_uses_demand_year ["MOBILITY_PASSENGER", "HOUSEHOLDS"]:=0;#Mpkm
let end_uses_demand_year ["MOBILITY_PASSENGER", "INDUSTRY"]:=0;#Mpkm
let end_uses_demand_year ["MOBILITY_PASSENGER", "SERVICES"]:=0;#Mpkm
let end_uses_demand_year ["MOBILITY_PASSENGER", "TRANSPORTATION"]:=418901;#Mpkm 418901
let end_uses_demand_year ["MOBILITY_FREIGHT", "HOUSEHOLDS"]:=0;#Mtkm
let end_uses_demand_year ["MOBILITY_FREIGHT", "INDUSTRY"]:=0;#Mtkm
let end_uses_demand_year ["MOBILITY_FREIGHT", "SERVICES"]:=0;#Mtkm
let end_uses_demand_year ["MOBILITY_FREIGHT", "TRANSPORTATION"]:=263912;#Mtkm;
let end_uses_demand_year ["NON_ENERGY", "HOUSEHOLDS"]:=0;#GWh
let end_uses_demand_year ["NON_ENERGY", "INDUSTRY"]:=0;#GWh
let end_uses_demand_year ["NON_ENERGY", "SERVICES"]:=0;#GWh
let end_uses_demand_year ["NON_ENERGY", "TRANSPORTATION"]:=0;#GWh

#SHARES
let share_mobility_public_min := 0.251	;
let share_mobility_public_max := 	0.251	;#spain2015 #??																																	
																																		
let share_freight_train_min := 	0.049	;	#spain2015;																																
let  share_freight_train_max := 	0.049	;	#imposed the same as min;																														
																																		
let  share_freight_road_min := 	0	;	#0.779 spain2015;																																
let  share_freight_road_max := 	1	;		#fixed to converge;																														
																																		
let  share_freight_boat_min := 	0.173	;#spain2015;																																	
let  share_freight_boat_max := 	0.173	;		#imposed the same as min;																													
																																		
let  share_heat_dhn_min := 	0	;																																
let  share_heat_dhn_max := 	1	;		




#FREIGHT MOBILITY;

let fmin_perc['TRUCK_DIESEL'] := 0;
let fmax_perc['TRUCK_DIESEL'] := 1;#forced to converge, 0.992 https://www.acea.be/uploads/statistic_documents/ACEA_Report_Vehicles_in_use-Europe_2017.pdf#page=6 pag 15;
let fmin_perc['TRUCK_NG'] := 0;
let fmax_perc['TRUCK_NG'] := 0.005; #LPG+NG;
let fmin_perc['TRUCK_FUEL_CELL'] := 0;
let fmax_perc['TRUCK_FUEL_CELL'] := 0;
#let fmin_perc['TRUCK_ELEC'] := 0; #not implemented;
#let fmax_perc['TRUCK_ELEC'] := 0; #not implemented;

let fmin_perc['BOAT_FREIGHT_NG'] := 0;#starts in 2020;
let fmax_perc['BOAT_FREIGHT_NG'] := 0;
let fmin_perc['BOAT_FREIGHT_DIESEL'] := 0;
let fmax_perc['BOAT_FREIGHT_DIESEL'] := 1;#forced to converge;



#SOURCE : # Eurostat2017 p49

let fmin_perc['TRAMWAY_TROLLEY'] := 0.0671;#0.067128;
let fmax_perc['TRAMWAY_TROLLEY'] := 0.0671;#0.067128;
let fmin_perc['BUS_COACH_DIESEL'] := 0;#fixed to converge 0.42557;
let fmax_perc['BUS_COACH_DIESEL'] := 1;#fixed to converge;
let fmin_perc['BUS_COACH_HYDIESEL'] := 0;
let fmax_perc['BUS_COACH_HYDIESEL'] := 0;
let fmin_perc['BUS_COACH_CNG_STOICH'] := 0.0103;#0.01031;
let fmax_perc['BUS_COACH_CNG_STOICH'] := 0.0103;#0.01031;
let fmin_perc['BUS_COACH_FC_HYBRIDH2'] := 0;
let fmax_perc['BUS_COACH_FC_HYBRIDH2'] := 0;
let fmin_perc['TRAIN_PUB'] := 0.2461;#0.246136344;
let fmax_perc['TRAIN_PUB'] := 0.2461;#0.246136344;
let fmin_perc['PLANES'] := 0.2412;#0.241235032 Added;
let fmax_perc['PLANES'] := 0.2412;#Added;
let fmin_perc['BOAT_PASS_DIESEL'] := 0.0092;#0.0091679Added;
let fmax_perc['BOAT_PASS_DIESEL'] := 0.0092;#0.0091679Added;
let fmin_perc['BOAT_PASS_NG'] := 0;#Added;
let fmax_perc['BOAT_PASS_NG'] := 0;#Added;
#let fmin_perc['BUS_COACH_BEV'] := 0.00044;#Added;
#let fmax_perc['BUS_COACH_BEV'] := 0.00044;#Added;


# Private mobility
let fmin_perc['CAR_GASOLINE'] := 0.38048;# share starting from the total fleet of spain in 2015 from https://www.dgt.es/es/seguridad-vial/estadisticas-e-indicadores/parque-vehiculos/tablas-estadisticas/ ;
let fmax_perc['CAR_GASOLINE'] := 0.38048; #share starting from the total fleet of spain in 2015 from https://www.dgt.es/es/seguridad-vial/estadisticas-e-indicadores/parque-vehiculos/tablas-estadisticas/ ;
let fmin_perc['CAR_DIESEL'] := 0;#fixed to converge 0.4979 share starting from the total fleet of spain in 2015 from https://www.dgt.es/es/seguridad-vial/estadisticas-e-indicadores/parque-vehiculos/tablas-estadisticas/ ;
let fmax_perc['CAR_DIESEL'] := 1;#fixed to converge:0.4979;
let fmin_perc['CAR_NG'] := 0.0002;# contains CAR_LPG --> share starting from the different shares of FA from https://www.eafo.eu/vehicles-and-fleet/m2-m3;
let fmax_perc['CAR_NG'] := 0.0002;# contains CAR_LPG
let fmin_perc['CAR_HEV'] := 0.0;
let fmax_perc['CAR_HEV'] := 0.0;
let fmin_perc['MOTORCYCLE'] := 0.1211;#Added;
let fmax_perc['MOTORCYCLE'] := 0.1211;#Added;
let fmin_perc['CAR_FUEL_CELL'] := 0.0;
let fmax_perc['CAR_FUEL_CELL'] := 0.0;
let fmin_perc['CAR_BEV'] := 0.0002;
let fmax_perc['CAR_BEV'] := 0.0002;
#let fmin_perc['CAR_PHEV'] := 0.0001;
#let fmax_perc['CAR_PHEV'] := 0.0001;
#let fmin_perc['CAR_LPG'] := 0.0002;#Added;
#let fmin_perc['CAR_H2'] := 0.0;#Added;


let layers_in_out["CAR_GASOLINE","GASOLINE"] := -0.4805;
let layers_in_out["CAR_DIESEL","DIESEL"] := -0.4262;
let layers_in_out["TRUCK_DIESEL","DIESEL"] := -0.74528;

# Industry - Case 2 (fixing elec output)
#let fmin_perc ['IND_COGEN_GAS'] := 0.471;#0.4712508;
#let fmax_perc ['IND_COGEN_GAS'] := 0.471;#0.4712508;
let fmin_perc ['IND_COGEN_WOOD'] := 0;
let fmax_perc ['IND_COGEN_WOOD'] := 0;#0.0075;
let fmin_perc ['IND_BOILER_GAS'] := 0;#fixed to converge 0.0327815;
let fmax_perc ['IND_BOILER_GAS'] := 1;#0fixed to converge;
let fmin_perc ['IND_BOILER_WOOD'] := 0.1;#
let fmax_perc ['IND_BOILER_WOOD'] := 0.1;
let fmin_perc ['IND_BOILER_OIL'] := 0.071;#0.0709677;
let fmax_perc ['IND_BOILER_OIL'] := 0.071;#0.0709677;
let fmin_perc ['IND_BOILER_COAL'] := 0.0875;#
let fmax_perc ['IND_BOILER_COAL'] := 0.0875;
let fmin_perc ['IND_BOILER_WASTE'] := 0.072;#0.110248;
let fmax_perc ['IND_BOILER_WASTE'] := 0.072;#0.110248;
#let fmin_perc ['IND_COGEN_WASTE'] := 0.103;#0.064752;
#let fmax_perc ['IND_COGEN_WASTE'] := 0.103;#0.064752;
let fmin_perc ['IND_DIRECT_ELEC'] := 0.0625;
let fmax_perc ['IND_DIRECT_ELEC'] := 0.0625;


#we modified efficiency in 2015
 
let layers_in_out["IND_COGEN_GAS","ELECTRICITY"] := 0.7651 ;
#let layers_in_out["IND_COGEN_GAS","ELECTRICITY"] := 0.67947 ;#0.32372/0.476;
let layers_in_out["IND_COGEN_GAS","HEAT_HIGH_T"] := 1 ;
let layers_in_out["IND_COGEN_GAS","NG"] := -2.743;

let layers_in_out["IND_COGEN_WASTE","ELECTRICITY"] := 0.6667 ;
let layers_in_out["IND_COGEN_WASTE","HEAT_HIGH_T"] := 1 ;
let layers_in_out["IND_COGEN_WASTE","WASTE"] := -2.2222;


# Heat Low T DHN
#let loss_network ['HEAT_LOW_T_DHN'] := 0.0864;


# Case2  (fixing cogen electricity production) #Assuming DHN=0;
let fmin_perc ['DHN_HP_ELEC'] := 0;#0.0436;
let fmin_perc ['DHN_COGEN_GAS'] := 0;#0.59413;
#let fmin_perc ['DHN_COGEN_WOOD'] := 0; #0.06603;
let fmin_perc ['DHN_COGEN_WASTE'] := 0;#0.72823 .124080;
let fmin_perc ['DHN_BOILER_GAS'] := 0;#0.13883;
let fmin_perc ['DHN_BOILER_WOOD'] := 0;
let fmin_perc ['DHN_BOILER_OIL'] :=0;# 0.00651;
let fmin_perc ['DHN_DEEP_GEO'] := 0;#0.00443 0.01;
let fmax_perc ['DHN_HP_ELEC'] :=0;#0.0437;
let fmax_perc ['DHN_COGEN_GAS'] := 0;#0.59413;
#let fmax_perc ['DHN_COGEN_WOOD'] := 0; #0.06603;
let fmax_perc ['DHN_COGEN_WASTE'] := 0;#0.72823 0.14080 ; 
let fmax_perc ['DHN_BOILER_GAS'] := 0;#0.13883;
let fmax_perc ['DHN_BOILER_WOOD'] := 0;
let fmax_perc ['DHN_BOILER_OIL'] := 0;# 0.00651;
let fmax_perc ['DHN_DEEP_GEO'] := 1;#0.00443 0.01;
let fmax_perc ['DHN_COGEN_WET_BIOMASS'] := 0;



# Heat Low T decentralized. Case2  (fixing elec out from cogen)
#From Heat Roadmap Spain (2015)
let fmin_perc ['DEC_HP_ELEC'] := 0;
let fmin_perc ['DEC_THHP_GAS'] := 0;
let fmin_perc ['DEC_COGEN_GAS'] := 0;#assumed that all gas is supplied by boilers;
let fmin_perc ['DEC_COGEN_OIL'] := 0;
let fmin_perc ['DEC_ADVCOGEN_GAS'] := 0;
let fmin_perc ['DEC_ADVCOGEN_H2'] := 0;
let fmin_perc ['DEC_BOILER_GAS'] := 0;#fixed to converge 0.413621;
let fmin_perc ['DEC_BOILER_WOOD'] := 0.186927;
let fmin_perc ['DEC_BOILER_OIL'] := 0.275271;
let fmin_perc ['DEC_DIRECT_ELEC'] := 0.089177;
let fmin_perc ['DEC_SOLAR'] := 0.035004;

let fmax_perc ['DEC_HP_ELEC'] := 0;
let fmax_perc ['DEC_THHP_GAS'] := 0;
let fmax_perc ['DEC_COGEN_GAS'] := 0;
let fmax_perc ['DEC_COGEN_OIL'] := 0;
let fmax_perc ['DEC_ADVCOGEN_GAS'] := 0;
let fmax_perc ['DEC_ADVCOGEN_H2'] := 0;
let fmax_perc ['DEC_BOILER_GAS'] := 1;#fixed to converge;
let fmax_perc ['DEC_BOILER_WOOD'] := 0.186927;
let fmax_perc ['DEC_BOILER_OIL'] := 0.275271;
let fmax_perc ['DEC_SOLAR'] := 0.035004;
let fmax_perc ['DEC_DIRECT_ELEC'] := 0.089177;


# PHS
let f_min ['PHS'] :=2762;# capacity of 5.603;
let f_max ['PHS'] :=2762;# cpacity of 5.603;

# No TS :
let f_max ['TS_DEC_THHP_GAS'] :=0;
let f_max ['TS_DEC_HP_ELEC'] :=0;
let f_max ['TS_DEC_COGEN_GAS'] :=0;
let f_max ['TS_DEC_COGEN_OIL'] :=0;
let f_max ['TS_DEC_ADVCOGEN_GAS'] :=0;
let f_max ['TS_DEC_ADVCOGEN_H2'] :=0;
let f_max ['TS_DEC_BOILER_GAS'] :=0;
let f_max ['TS_DEC_BOILER_WOOD'] :=0;
let f_max ['TS_DEC_BOILER_OIL'] :=0;
let f_max ['TS_DEC_DIRECT_ELEC'] :=0;
let f_max ['TS_DHN_DAILY'] :=0;
let f_max ['TS_DHN_SEASONAL'] :=0;
#let f_max ['TS_HIGH_TEMP'] :=0;

let f_max ['SLF_STO'] :=0;

# No synthetic fuels :
#let f_max ["BIO_HYDROLYSIS"] := 0;
let f_max ["PYROLYSIS"] := 0;
let f_max ['SLF_TO_DIESEL'] :=0;
let f_max ['SLF_TO_GASOLINE'] :=0;
let f_max ['SLF_TO_LFO'] :=0;

