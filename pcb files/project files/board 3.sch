<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="9.6.2">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="2" name="Route2" color="1" fill="3" visible="no" active="no"/>
<layer number="3" name="Route3" color="4" fill="3" visible="no" active="no"/>
<layer number="4" name="Route4" color="1" fill="4" visible="no" active="no"/>
<layer number="5" name="Route5" color="4" fill="4" visible="no" active="no"/>
<layer number="6" name="Route6" color="1" fill="8" visible="no" active="no"/>
<layer number="7" name="Route7" color="4" fill="8" visible="no" active="no"/>
<layer number="8" name="Route8" color="1" fill="2" visible="no" active="no"/>
<layer number="9" name="Route9" color="4" fill="2" visible="no" active="no"/>
<layer number="10" name="Route10" color="1" fill="7" visible="no" active="no"/>
<layer number="11" name="Route11" color="4" fill="7" visible="no" active="no"/>
<layer number="12" name="Route12" color="1" fill="5" visible="no" active="no"/>
<layer number="13" name="Route13" color="4" fill="5" visible="no" active="no"/>
<layer number="14" name="Route14" color="1" fill="6" visible="no" active="no"/>
<layer number="15" name="Route15" color="4" fill="6" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="88" name="SimResults" color="9" fill="1" visible="yes" active="yes"/>
<layer number="89" name="SimProbes" color="9" fill="1" visible="yes" active="yes"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
<layer number="99" name="SpiceOrder" color="7" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="ESP32">
<packages>
<package name="ESP32-WROOM">
<smd name="IO12" x="0" y="1.5" dx="3" dy="0.9" layer="1"/>
<smd name="IO0" x="18" y="1.5" dx="3" dy="0.9" layer="1"/>
<smd name="GND2" x="3.285" y="0" dx="3" dy="0.9" layer="1" rot="R90"/>
<smd name="IO13" x="4.555" y="0" dx="3" dy="0.9" layer="1" rot="R90"/>
<smd name="SD2" x="5.825" y="0" dx="3" dy="0.9" layer="1" rot="R90"/>
<smd name="SD3" x="7.095" y="0" dx="3" dy="0.9" layer="1" rot="R90"/>
<smd name="CMD" x="8.365" y="0" dx="3" dy="0.9" layer="1" rot="R90"/>
<smd name="CLK" x="9.635" y="0" dx="3" dy="0.9" layer="1" rot="R90"/>
<smd name="SD0" x="10.905" y="0" dx="3" dy="0.9" layer="1" rot="R90"/>
<smd name="SD1" x="12.175" y="0" dx="3" dy="0.9" layer="1" rot="R90"/>
<smd name="IO15" x="13.445" y="0" dx="3" dy="0.9" layer="1" rot="R90"/>
<smd name="IO2" x="14.715" y="0" dx="3" dy="0.9" layer="1" rot="R90"/>
<smd name="IO14" x="0" y="2.77" dx="3" dy="0.9" layer="1"/>
<smd name="IO27" x="0" y="4.04" dx="3" dy="0.9" layer="1"/>
<smd name="IO26" x="0" y="5.31" dx="3" dy="0.9" layer="1"/>
<smd name="IO25" x="0" y="6.58" dx="3" dy="0.9" layer="1"/>
<smd name="IO33" x="0" y="7.85" dx="3" dy="0.9" layer="1"/>
<smd name="IO32" x="0" y="9.12" dx="3" dy="0.9" layer="1"/>
<smd name="IO35" x="0" y="10.39" dx="3" dy="0.9" layer="1"/>
<smd name="IO34" x="0" y="11.66" dx="3" dy="0.9" layer="1"/>
<smd name="SENSOR_VN" x="0" y="12.93" dx="3" dy="0.9" layer="1"/>
<smd name="SENSOR_VP" x="0" y="14.2" dx="3" dy="0.9" layer="1"/>
<smd name="EN" x="0" y="15.47" dx="3" dy="0.9" layer="1"/>
<smd name="3V3" x="0" y="16.74" dx="3" dy="0.9" layer="1"/>
<smd name="GND1" x="0" y="18.01" dx="3" dy="0.9" layer="1"/>
<smd name="IO4" x="18" y="2.77" dx="3" dy="0.9" layer="1"/>
<smd name="IO16" x="18" y="4.04" dx="3" dy="0.9" layer="1"/>
<smd name="IO17" x="18" y="5.31" dx="3" dy="0.9" layer="1"/>
<smd name="IO5" x="18" y="6.58" dx="3" dy="0.9" layer="1"/>
<smd name="IO18" x="18" y="7.85" dx="3" dy="0.9" layer="1"/>
<smd name="IO19" x="18" y="9.12" dx="3" dy="0.9" layer="1"/>
<smd name="NC" x="18" y="10.39" dx="3" dy="0.9" layer="1"/>
<smd name="IO21" x="18" y="11.66" dx="3" dy="0.9" layer="1"/>
<smd name="RX" x="18" y="12.93" dx="3" dy="0.9" layer="1"/>
<smd name="TX" x="18" y="14.2" dx="3" dy="0.9" layer="1"/>
<smd name="IO22" x="18" y="15.47" dx="3" dy="0.9" layer="1"/>
<smd name="IO23" x="18" y="16.74" dx="3" dy="0.9" layer="1"/>
<smd name="GND3" x="18" y="18.01" dx="3" dy="0.9" layer="1"/>
<wire x1="0" y1="0" x2="18" y2="0" width="0.127" layer="21"/>
<wire x1="18" y1="0" x2="18" y2="19.2" width="0.127" layer="21"/>
<wire x1="18" y1="19.2" x2="18" y2="25.5" width="0.127" layer="21"/>
<wire x1="18" y1="25.5" x2="0" y2="25.5" width="0.127" layer="21"/>
<wire x1="0" y1="25.5" x2="0" y2="19.2" width="0.127" layer="21"/>
<wire x1="0" y1="19.2" x2="0" y2="0" width="0.127" layer="21"/>
<wire x1="0" y1="19.2" x2="18" y2="19.2" width="0.127" layer="21"/>
<wire x1="5.5" y1="8" x2="10.5" y2="8" width="0.127" layer="21"/>
<wire x1="10.5" y1="8" x2="10.5" y2="13" width="0.127" layer="21"/>
<wire x1="10.5" y1="13" x2="5.5" y2="13" width="0.127" layer="21"/>
<wire x1="5.5" y1="13" x2="5.5" y2="8" width="0.127" layer="21"/>
<smd name="GND4" x="8" y="10.5" dx="5" dy="5" layer="1"/>
<text x="9" y="18" size="1.0668" layer="21" align="center">ESP32-WROOM-32</text>
<wire x1="16.51" y1="20.0025" x2="16.51" y2="24.13" width="0.8128" layer="21"/>
<wire x1="16.51" y1="24.13" x2="13.97" y2="24.13" width="0.8128" layer="21"/>
<wire x1="13.97" y1="24.13" x2="13.97" y2="20.0025" width="0.8128" layer="21"/>
<wire x1="13.97" y1="24.13" x2="11.43" y2="24.13" width="0.8128" layer="21"/>
<wire x1="11.43" y1="24.13" x2="11.43" y2="21.59" width="0.8128" layer="21"/>
<wire x1="11.43" y1="21.59" x2="8.89" y2="21.59" width="0.8128" layer="21"/>
<wire x1="8.89" y1="21.59" x2="8.89" y2="24.13" width="0.8128" layer="21"/>
<wire x1="8.89" y1="24.13" x2="6.35" y2="24.13" width="0.8128" layer="21"/>
<wire x1="6.35" y1="24.13" x2="6.35" y2="21.59" width="0.8128" layer="21"/>
<wire x1="6.35" y1="21.59" x2="3.81" y2="21.59" width="0.8128" layer="21"/>
<wire x1="3.81" y1="21.59" x2="3.81" y2="24.13" width="0.8128" layer="21"/>
<wire x1="3.81" y1="24.13" x2="1.27" y2="24.13" width="0.8128" layer="21"/>
<wire x1="1.27" y1="24.13" x2="1.27" y2="20.701" width="0.8128" layer="21"/>
<smd name="GND5" x="8" y="10.5" dx="5" dy="5" layer="16" rot="R180"/>
</package>
</packages>
<symbols>
<symbol name="ESP32_WROOM">
<pin name="GND4" x="0" y="2.54" visible="pin" length="short"/>
<pin name="GPIO11" x="0" y="5.08" visible="pin" length="short"/>
<pin name="GPIO10" x="0" y="7.62" visible="pin" length="short"/>
<pin name="GPIO9" x="0" y="10.16" visible="pin" length="short"/>
<pin name="GPIO13" x="0" y="12.7" visible="pin" length="short"/>
<pin name="GND1" x="0" y="15.24" visible="pin" length="short"/>
<pin name="GPIO12" x="0" y="17.78" visible="pin" length="short"/>
<pin name="GPIO14" x="0" y="20.32" visible="pin" length="short"/>
<pin name="GPIO27" x="0" y="22.86" visible="pin" length="short"/>
<pin name="GPIO26" x="0" y="25.4" visible="pin" length="short"/>
<pin name="GPIO25" x="0" y="27.94" visible="pin" length="short"/>
<pin name="GPIO33" x="0" y="30.48" visible="pin" length="short"/>
<pin name="GPIO32" x="0" y="33.02" visible="pin" length="short"/>
<pin name="GPIO35" x="0" y="35.56" visible="pin" length="short"/>
<pin name="GPIO34" x="0" y="38.1" visible="pin" length="short"/>
<pin name="GPIO39" x="0" y="40.64" visible="pin" length="short"/>
<pin name="GPIO36" x="0" y="43.18" visible="pin" length="short"/>
<pin name="EN" x="0" y="45.72" visible="pin" length="short"/>
<pin name="3.3V" x="0" y="48.26" visible="pin" length="short"/>
<pin name="GPIO6" x="30.48" y="2.54" visible="pin" length="short" rot="R180"/>
<pin name="GPIO7" x="30.48" y="5.08" visible="pin" length="short" rot="R180"/>
<pin name="GPIO8" x="30.48" y="7.62" visible="pin" length="short" rot="R180"/>
<pin name="GPIO15" x="30.48" y="10.16" visible="pin" length="short" rot="R180"/>
<pin name="GPIO2" x="30.48" y="12.7" visible="pin" length="short" rot="R180"/>
<pin name="GPIO0" x="30.48" y="15.24" visible="pin" length="short" rot="R180"/>
<pin name="GPIO4" x="30.48" y="17.78" visible="pin" length="short" rot="R180"/>
<pin name="GPIO16" x="30.48" y="20.32" visible="pin" length="short" rot="R180"/>
<pin name="GPIO17" x="30.48" y="22.86" visible="pin" length="short" rot="R180"/>
<pin name="GPIO5" x="30.48" y="25.4" visible="pin" length="short" rot="R180"/>
<pin name="GPIO18" x="30.48" y="27.94" visible="pin" length="short" rot="R180"/>
<pin name="GPIO19" x="30.48" y="30.48" visible="pin" length="short" rot="R180"/>
<pin name="GND3" x="30.48" y="33.02" visible="pin" length="short" rot="R180"/>
<pin name="GPIO21" x="30.48" y="35.56" visible="pin" length="short" rot="R180"/>
<pin name="RX" x="30.48" y="38.1" visible="pin" length="short" rot="R180"/>
<pin name="TX" x="30.48" y="40.64" visible="pin" length="short" rot="R180"/>
<pin name="GPIO22" x="30.48" y="43.18" visible="pin" length="short" rot="R180"/>
<pin name="GPIO23" x="30.48" y="45.72" visible="pin" length="short" rot="R180"/>
<pin name="GND2" x="30.48" y="48.26" visible="pin" length="short" rot="R180"/>
<wire x1="2.54" y1="0" x2="2.54" y2="50.8" width="0.254" layer="94"/>
<wire x1="2.54" y1="50.8" x2="27.94" y2="50.8" width="0.254" layer="94"/>
<wire x1="27.94" y1="50.8" x2="27.94" y2="0" width="0.254" layer="94"/>
<wire x1="27.94" y1="0" x2="2.54" y2="0" width="0.254" layer="94"/>
<text x="3.81" y="-2.54" size="1.778" layer="94">ESP32</text>
<pin name="GND5" x="15.24" y="-2.54" visible="pin" length="short" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="ESP32-WROOM">
<gates>
<gate name="G$1" symbol="ESP32_WROOM" x="-2.54" y="0"/>
</gates>
<devices>
<device name="" package="ESP32-WROOM">
<connects>
<connect gate="G$1" pin="3.3V" pad="3V3"/>
<connect gate="G$1" pin="EN" pad="EN"/>
<connect gate="G$1" pin="GND1" pad="GND1"/>
<connect gate="G$1" pin="GND2" pad="GND2"/>
<connect gate="G$1" pin="GND3" pad="GND3"/>
<connect gate="G$1" pin="GND4" pad="GND4"/>
<connect gate="G$1" pin="GND5" pad="GND5"/>
<connect gate="G$1" pin="GPIO0" pad="IO0"/>
<connect gate="G$1" pin="GPIO10" pad="SD3"/>
<connect gate="G$1" pin="GPIO11" pad="CMD"/>
<connect gate="G$1" pin="GPIO12" pad="IO12"/>
<connect gate="G$1" pin="GPIO13" pad="IO13"/>
<connect gate="G$1" pin="GPIO14" pad="IO14"/>
<connect gate="G$1" pin="GPIO15" pad="IO15"/>
<connect gate="G$1" pin="GPIO16" pad="IO16"/>
<connect gate="G$1" pin="GPIO17" pad="IO17"/>
<connect gate="G$1" pin="GPIO18" pad="IO18"/>
<connect gate="G$1" pin="GPIO19" pad="IO19"/>
<connect gate="G$1" pin="GPIO2" pad="IO2"/>
<connect gate="G$1" pin="GPIO21" pad="IO21"/>
<connect gate="G$1" pin="GPIO22" pad="IO22"/>
<connect gate="G$1" pin="GPIO23" pad="IO23"/>
<connect gate="G$1" pin="GPIO25" pad="IO25"/>
<connect gate="G$1" pin="GPIO26" pad="IO26"/>
<connect gate="G$1" pin="GPIO27" pad="IO27"/>
<connect gate="G$1" pin="GPIO32" pad="IO32"/>
<connect gate="G$1" pin="GPIO33" pad="IO33"/>
<connect gate="G$1" pin="GPIO34" pad="IO34"/>
<connect gate="G$1" pin="GPIO35" pad="IO35"/>
<connect gate="G$1" pin="GPIO36" pad="SENSOR_VP"/>
<connect gate="G$1" pin="GPIO39" pad="SENSOR_VN"/>
<connect gate="G$1" pin="GPIO4" pad="IO4"/>
<connect gate="G$1" pin="GPIO5" pad="IO5"/>
<connect gate="G$1" pin="GPIO6" pad="CLK"/>
<connect gate="G$1" pin="GPIO7" pad="SD0"/>
<connect gate="G$1" pin="GPIO8" pad="SD1"/>
<connect gate="G$1" pin="GPIO9" pad="SD2"/>
<connect gate="G$1" pin="RX" pad="RX"/>
<connect gate="G$1" pin="TX" pad="TX"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="SS8050-G">
<packages>
<package name="SOT95P240X115-3N">
<description>&lt;b&gt;SOT-23_2&lt;/b&gt;&lt;br&gt;</description>
<wire x1="-1.9" y1="1.75" x2="1.9" y2="1.75" width="0.05" layer="51"/>
<wire x1="1.9" y1="1.75" x2="1.9" y2="-1.75" width="0.05" layer="51"/>
<wire x1="1.9" y1="-1.75" x2="-1.9" y2="-1.75" width="0.05" layer="51"/>
<wire x1="-1.9" y1="-1.75" x2="-1.9" y2="1.75" width="0.05" layer="51"/>
<wire x1="-0.65" y1="1.45" x2="0.3" y2="1.45" width="0.1" layer="51"/>
<wire x1="0.3" y1="1.45" x2="0.65" y2="1.45" width="0.1" layer="51"/>
<wire x1="0.65" y1="1.45" x2="0.65" y2="-1.45" width="0.1" layer="51"/>
<wire x1="0.65" y1="-1.45" x2="-0.65" y2="-1.45" width="0.1" layer="51"/>
<wire x1="-0.65" y1="-1.45" x2="-0.65" y2="0.5" width="0.1" layer="51"/>
<wire x1="-0.65" y1="0.5" x2="-0.65" y2="1.45" width="0.1" layer="51"/>
<wire x1="-0.65" y1="0.5" x2="0.3" y2="1.45" width="0.1" layer="51"/>
<wire x1="-0.2" y1="1.45" x2="0.2" y2="1.45" width="0.2" layer="21"/>
<wire x1="0.2" y1="1.45" x2="0.2" y2="-1.45" width="0.2" layer="21"/>
<wire x1="0.2" y1="-1.45" x2="-0.2" y2="-1.45" width="0.2" layer="21"/>
<wire x1="-0.2" y1="-1.45" x2="-0.2" y2="1.45" width="0.2" layer="21"/>
<wire x1="-1.65" y1="1.5" x2="-0.55" y2="1.5" width="0.2" layer="21"/>
<text x="0" y="0" size="1.27" layer="25" align="center">&gt;NAME</text>
<text x="0" y="0" size="1.27" layer="27" align="center">&gt;VALUE</text>
<smd name="1" x="-1.1" y="0.95" dx="1.1" dy="0.6" layer="1"/>
<smd name="2" x="-1.1" y="-0.95" dx="1.1" dy="0.6" layer="1"/>
<smd name="3" x="1.1" y="0" dx="1.1" dy="0.6" layer="1"/>
</package>
</packages>
<symbols>
<symbol name="SS8050-G">
<circle x="8.89" y="0" radius="4.016" width="0.254" layer="94"/>
<wire x1="7.62" y1="2.54" x2="7.62" y2="1.27" width="0.508" layer="94"/>
<wire x1="7.62" y1="1.27" x2="7.62" y2="0" width="0.508" layer="94"/>
<wire x1="7.62" y1="0" x2="7.62" y2="-1.27" width="0.508" layer="94"/>
<wire x1="7.62" y1="-1.27" x2="7.62" y2="-2.54" width="0.508" layer="94"/>
<wire x1="7.62" y1="1.27" x2="10.16" y2="3.81" width="0.254" layer="94"/>
<wire x1="7.62" y1="-1.27" x2="10.16" y2="-3.81" width="0.254" layer="94"/>
<wire x1="10.16" y1="-3.81" x2="10.16" y2="-5.08" width="0.254" layer="94"/>
<wire x1="10.16" y1="3.81" x2="10.16" y2="5.08" width="0.254" layer="94"/>
<wire x1="2.54" y1="0" x2="7.62" y2="0" width="0.254" layer="94"/>
<text x="13.97" y="1.27" size="1.778" layer="95" align="center-left">&gt;NAME</text>
<text x="13.97" y="-1.27" size="1.778" layer="96" align="center-left">&gt;VALUE</text>
<polygon width="0.254" layer="94">
<vertex x="8.382" y="-2.54"/>
<vertex x="8.89" y="-2.032"/>
<vertex x="9.398" y="-3.048"/>
</polygon>
<pin name="B" x="0" y="0" visible="pad" length="short"/>
<pin name="C" x="10.16" y="7.62" visible="pad" length="short" rot="R270"/>
<pin name="E" x="10.16" y="-7.62" visible="pad" length="short" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="SS8050-G" prefix="Q">
<description>&lt;b&gt;Bipolar Transistors - BJT NPN TRANSISTOR 1.5A 40V&lt;/b&gt;&lt;p&gt;
Source: &lt;a href="http://www.comchiptech.com/admin/files/product/SS8050-G RevA181526.pdf"&gt; Datasheet &lt;/a&gt; &lt;a href="https://pricing.snapeda.com/parts/SS8050-G/Comchip%20Technology/view-part?ref=eda"&gt;Check prices&lt;/a&gt;</description>
<gates>
<gate name="G$1" symbol="SS8050-G" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SOT95P240X115-3N">
<connects>
<connect gate="G$1" pin="B" pad="1"/>
<connect gate="G$1" pin="C" pad="3"/>
<connect gate="G$1" pin="E" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="AVAILABILITY" value="Good"/>
<attribute name="DESCRIPTION" value=" Bipolar (BJT) Transistor NPN 25V 1.5A 100MHz 300mW Surface Mount SOT-23 "/>
<attribute name="MF" value="Comchip Technology"/>
<attribute name="MP" value="SS8050-G"/>
<attribute name="PACKAGE" value="TO-236 Comchip"/>
<attribute name="PRICE" value="None"/>
<attribute name="PURCHASE-URL" value="https://pricing.snapeda.com/search/part/SS8050-G/?ref=eda"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="NCP1117LPST33T3G">
<packages>
<package name="SOT230P700X175-4N">
<wire x1="1.75" y1="3.25" x2="1.75" y2="-3.25" width="0.127" layer="51"/>
<wire x1="1.75" y1="-3.25" x2="-1.75" y2="-3.25" width="0.127" layer="51"/>
<wire x1="-1.75" y1="-3.25" x2="-1.75" y2="3.25" width="0.127" layer="51"/>
<wire x1="-1.75" y1="3.25" x2="1.75" y2="3.25" width="0.127" layer="51"/>
<wire x1="1.75" y1="3.25" x2="1.75" y2="-3.25" width="0.127" layer="21"/>
<wire x1="1.75" y1="-3.25" x2="-1.75" y2="-3.25" width="0.127" layer="21"/>
<wire x1="-1.75" y1="-3.25" x2="-1.75" y2="3.25" width="0.127" layer="21"/>
<wire x1="-1.75" y1="3.25" x2="1.75" y2="3.25" width="0.127" layer="21"/>
<wire x1="4.5" y1="3.5" x2="4.5" y2="-3.5" width="0.05" layer="39"/>
<wire x1="4.5" y1="-3.5" x2="-4.5" y2="-3.5" width="0.05" layer="39"/>
<wire x1="-4.5" y1="-3.5" x2="-4.5" y2="3.5" width="0.05" layer="39"/>
<wire x1="-4.5" y1="3.5" x2="4.5" y2="3.5" width="0.05" layer="39"/>
<text x="-3.471309375" y="4.52891875" size="1.64336875" layer="25">&gt;NAME</text>
<text x="-3.45725" y="-6.2397" size="1.633840625" layer="27">&gt;VALUE</text>
<circle x="-3.75" y="3.5" radius="0.1" width="0.2" layer="21"/>
<smd name="2" x="-3.15" y="0" dx="1.5" dy="2" layer="1" rot="R270"/>
<smd name="4" x="3.15" y="0" dx="3.8" dy="2" layer="1" rot="R270"/>
<smd name="1" x="-3.15" y="2.3" dx="1.5" dy="2" layer="1" rot="R270"/>
<smd name="3" x="-3.15" y="-2.3" dx="1.5" dy="2" layer="1" rot="R270"/>
</package>
</packages>
<symbols>
<symbol name="NCP1117LPST33T3G">
<wire x1="-12.7" y1="5.08" x2="12.7" y2="5.08" width="0.41" layer="94"/>
<wire x1="12.7" y1="5.08" x2="12.7" y2="-5.08" width="0.41" layer="94"/>
<wire x1="12.7" y1="-5.08" x2="-12.7" y2="-5.08" width="0.41" layer="94"/>
<wire x1="-12.7" y1="-5.08" x2="-12.7" y2="5.08" width="0.41" layer="94"/>
<text x="-12.7214" y="6.087509375" size="2.08536875" layer="95" ratio="10" rot="SR0">&gt;NAME</text>
<text x="5.08" y="-9.086359375" size="2.08426875" layer="96" ratio="10" rot="SR0">&gt;VALUE</text>
<pin name="INPUT" x="-17.78" y="2.54" length="middle" direction="in"/>
<pin name="OUTPUT" x="17.78" y="2.54" length="middle" direction="out" rot="R180"/>
<pin name="GND" x="0" y="-10.16" length="middle" direction="pwr" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="NCP1117LPST33T3G" prefix="U">
<description>None &lt;a href="https://pricing.snapeda.com/parts/NCP1117LPST33T3G/Rochester%20Electronics%2C%20LLC/view-part?ref=eda"&gt;Check prices&lt;/a&gt;</description>
<gates>
<gate name="G$1" symbol="NCP1117LPST33T3G" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SOT230P700X175-4N">
<connects>
<connect gate="G$1" pin="GND" pad="1"/>
<connect gate="G$1" pin="INPUT" pad="3"/>
<connect gate="G$1" pin="OUTPUT" pad="2 4"/>
</connects>
<technologies>
<technology name="">
<attribute name="AVAILABILITY" value="Good"/>
<attribute name="DESCRIPTION" value=" Linear Voltage Regulator IC 1 Output 1A SOT-223 "/>
<attribute name="MF" value="Rochester Electronics, LLC"/>
<attribute name="MP" value="NCP1117LPST33T3G"/>
<attribute name="PACKAGE" value="None"/>
<attribute name="PRICE" value="None"/>
<attribute name="PURCHASE-URL" value="https://pricing.snapeda.com/search/part/NCP1117LPST33T3G/?ref=eda"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="micro usb 10118192-0002LF">
<packages>
<package name="AMPHENOL_10118192-0002LF">
<wire x1="-3.75" y1="0.225" x2="3.75" y2="0.225" width="0.127" layer="51"/>
<wire x1="3.75" y1="0.225" x2="3.75" y2="-4.125" width="0.127" layer="51"/>
<wire x1="3.75" y1="-4.125" x2="3.75" y2="-4.825" width="0.127" layer="51"/>
<wire x1="3.75" y1="-4.825" x2="-3.75" y2="-4.825" width="0.127" layer="51"/>
<wire x1="-3.75" y1="-4.825" x2="-3.75" y2="-4.125" width="0.127" layer="51"/>
<wire x1="-3.75" y1="-4.125" x2="-3.75" y2="0.225" width="0.127" layer="51"/>
<wire x1="3.75" y1="-4.125" x2="-3.75" y2="-4.125" width="0.127" layer="51"/>
<wire x1="3.75" y1="-4.125" x2="7.8" y2="-4.125" width="0.127" layer="51"/>
<text x="5.1" y="-3.8" size="0.4064" layer="51">PCB Edge</text>
<wire x1="-3.75" y1="-4" x2="-3.75" y2="-4.125" width="0.127" layer="21"/>
<wire x1="-3.75" y1="-4.125" x2="3.75" y2="-4.125" width="0.127" layer="21"/>
<wire x1="3.75" y1="-4.125" x2="3.75" y2="-4" width="0.127" layer="21"/>
<circle x="-1.4" y="1.3" radius="0.1" width="0.2" layer="21"/>
<circle x="-1.4" y="1.3" radius="0.1" width="0.2" layer="51"/>
<wire x1="-4.95" y1="0.925" x2="4.95" y2="0.925" width="0.05" layer="39"/>
<wire x1="4.95" y1="0.925" x2="4.95" y2="-5.075" width="0.05" layer="39"/>
<wire x1="4.95" y1="-5.075" x2="-4.95" y2="-5.075" width="0.05" layer="39"/>
<wire x1="-4.95" y1="-5.075" x2="-4.95" y2="0.925" width="0.05" layer="39"/>
<text x="-5.08" y="3.81" size="1.27" layer="25">&gt;NAME</text>
<text x="-5.08" y="2.032" size="1.27" layer="27">&gt;VALUE</text>
<smd name="3" x="0" y="0" dx="0.4" dy="1.35" layer="1"/>
<smd name="2" x="-0.65" y="0" dx="0.4" dy="1.35" layer="1"/>
<smd name="4" x="0.65" y="0" dx="0.4" dy="1.35" layer="1"/>
<smd name="1" x="-1.3" y="0" dx="0.4" dy="1.35" layer="1"/>
<smd name="5" x="1.3" y="0" dx="0.4" dy="1.35" layer="1"/>
<smd name="S1" x="-3.1" y="-0.125" dx="2.1" dy="1.6" layer="1"/>
<smd name="S2" x="3.1" y="-0.125" dx="2.1" dy="1.6" layer="1"/>
<smd name="S4" x="-1.2" y="-2.675" dx="1.9" dy="1.9" layer="1"/>
<smd name="S5" x="1.2" y="-2.675" dx="1.9" dy="1.9" layer="1"/>
<smd name="S3" x="-3.8" y="-2.675" dx="1.8" dy="1.9" layer="1"/>
<smd name="S6" x="3.8" y="-2.675" dx="1.8" dy="1.9" layer="1"/>
</package>
</packages>
<symbols>
<symbol name="10118192-0002LF">
<wire x1="-5.08" y1="10.16" x2="-5.08" y2="-10.16" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-10.16" x2="5.08" y2="-10.16" width="0.254" layer="94"/>
<wire x1="5.08" y1="-10.16" x2="5.08" y2="10.16" width="0.254" layer="94"/>
<wire x1="5.08" y1="10.16" x2="-5.08" y2="10.16" width="0.254" layer="94"/>
<text x="-5.08" y="11.43" size="1.778" layer="95">&gt;NAME</text>
<text x="-5.08" y="-12.7" size="1.778" layer="96">&gt;VALUE</text>
<pin name="D-" x="-10.16" y="5.08" length="middle"/>
<pin name="D+" x="-10.16" y="2.54" length="middle"/>
<pin name="ID" x="-10.16" y="0" length="middle"/>
<pin name="VCC" x="-10.16" y="7.62" length="middle" direction="pwr"/>
<pin name="GND" x="-10.16" y="-2.54" length="middle" direction="pwr"/>
<pin name="SHIELD" x="-10.16" y="-7.62" length="middle" direction="pas"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="10118192-0002LF" prefix="J">
<description>USB - micro B USB 2.0 Receptacle Connector 5 Position Surface Mount, Right Angle  </description>
<gates>
<gate name="G$1" symbol="10118192-0002LF" x="0" y="0"/>
</gates>
<devices>
<device name="" package="AMPHENOL_10118192-0002LF">
<connects>
<connect gate="G$1" pin="D+" pad="3"/>
<connect gate="G$1" pin="D-" pad="2"/>
<connect gate="G$1" pin="GND" pad="5"/>
<connect gate="G$1" pin="ID" pad="4"/>
<connect gate="G$1" pin="SHIELD" pad="S1 S2 S3 S4 S5 S6"/>
<connect gate="G$1" pin="VCC" pad="1"/>
</connects>
<technologies>
<technology name="">
<attribute name="DESCRIPTION" value=" USB - micro B USB 2.0 Receptacle Connector 5 Position Surface Mount, Right Angle "/>
<attribute name="DIGI-KEY_PART_NUMBER" value="609-5379-1-ND"/>
<attribute name="MF" value="Amphenol ICC (FCI)"/>
<attribute name="MP" value="10118192-0002LF"/>
<attribute name="PACKAGE" value="None"/>
<attribute name="PURCHASE-URL" value="https://pricing.snapeda.com/search/part/10118192-0002LF/?ref=eda"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="PESD5V0L4UG_115">
<packages>
<package name="SOT65P210X110-5N">
<wire x1="-0.68" y1="1.1" x2="-0.68" y2="-1.1" width="0.127" layer="51"/>
<wire x1="-0.68" y1="-1.1" x2="0.68" y2="-1.1" width="0.127" layer="51"/>
<wire x1="0.68" y1="-1.1" x2="0.68" y2="1.1" width="0.127" layer="51"/>
<wire x1="0.68" y1="1.1" x2="-0.68" y2="1.1" width="0.127" layer="51"/>
<wire x1="-0.68" y1="-1.18" x2="0.68" y2="-1.18" width="0.127" layer="21"/>
<wire x1="0.68" y1="1.18" x2="-0.68" y2="1.18" width="0.127" layer="21"/>
<wire x1="-1.72" y1="1.11" x2="-0.93" y2="1.11" width="0.05" layer="39"/>
<wire x1="-0.93" y1="1.11" x2="-0.93" y2="1.35" width="0.05" layer="39"/>
<wire x1="-0.93" y1="1.35" x2="0.93" y2="1.35" width="0.05" layer="39"/>
<wire x1="0.93" y1="1.35" x2="0.93" y2="1.11" width="0.05" layer="39"/>
<wire x1="0.93" y1="1.11" x2="1.72" y2="1.11" width="0.05" layer="39"/>
<wire x1="1.72" y1="1.11" x2="1.72" y2="-1.11" width="0.05" layer="39"/>
<wire x1="1.72" y1="-1.11" x2="0.93" y2="-1.11" width="0.05" layer="39"/>
<wire x1="0.93" y1="-1.11" x2="0.93" y2="-1.35" width="0.05" layer="39"/>
<wire x1="0.93" y1="-1.35" x2="-0.93" y2="-1.35" width="0.05" layer="39"/>
<wire x1="-0.93" y1="-1.35" x2="-0.93" y2="-1.11" width="0.05" layer="39"/>
<wire x1="-0.93" y1="-1.11" x2="-1.72" y2="-1.11" width="0.05" layer="39"/>
<wire x1="-1.72" y1="-1.11" x2="-1.72" y2="1.11" width="0.05" layer="39"/>
<text x="-2" y="1.65" size="0.8128" layer="25">&gt;NAME</text>
<text x="-2.2" y="-2.35" size="0.8128" layer="27">&gt;VALUE</text>
<circle x="-2" y="0.7" radius="0.1" width="0.2" layer="21"/>
<circle x="-2" y="0.7" radius="0.1" width="0.2" layer="51"/>
<smd name="1" x="-0.97" y="0.65" dx="0.99" dy="0.41" layer="1" roundness="50"/>
<smd name="2" x="-0.97" y="0" dx="0.99" dy="0.41" layer="1" roundness="50"/>
<smd name="3" x="-0.97" y="-0.65" dx="0.99" dy="0.41" layer="1" roundness="50"/>
<smd name="4" x="0.97" y="-0.65" dx="0.99" dy="0.41" layer="1" roundness="50"/>
<smd name="5" x="0.97" y="0.65" dx="0.99" dy="0.41" layer="1" roundness="50"/>
</package>
</packages>
<symbols>
<symbol name="PESD5V0L4UG,115">
<text x="-5.08" y="7.874" size="1.778" layer="95">&gt;NAME</text>
<text x="-5.08" y="-9.906" size="1.778" layer="96">&gt;VALUE</text>
<wire x1="1.27" y1="3.81" x2="3.81" y2="5.08" width="0.254" layer="94"/>
<wire x1="3.81" y1="5.08" x2="1.27" y2="6.35" width="0.254" layer="94"/>
<wire x1="3.81" y1="6.35" x2="3.81" y2="5.08" width="0.254" layer="94"/>
<wire x1="1.27" y1="6.35" x2="1.27" y2="5.08" width="0.254" layer="94"/>
<wire x1="1.27" y1="5.08" x2="1.27" y2="3.81" width="0.254" layer="94"/>
<wire x1="3.81" y1="5.08" x2="3.81" y2="3.81" width="0.254" layer="94"/>
<wire x1="3.81" y1="3.81" x2="3.175" y2="3.81" width="0.254" layer="94"/>
<wire x1="0" y1="5.08" x2="1.27" y2="5.08" width="0.254" layer="94"/>
<wire x1="5.08" y1="5.08" x2="3.81" y2="5.08" width="0.254" layer="94"/>
<wire x1="-1.27" y1="6.35" x2="-3.81" y2="5.08" width="0.254" layer="94"/>
<wire x1="-3.81" y1="5.08" x2="-1.27" y2="3.81" width="0.254" layer="94"/>
<wire x1="-3.81" y1="3.81" x2="-3.81" y2="5.08" width="0.254" layer="94"/>
<wire x1="-1.27" y1="3.81" x2="-1.27" y2="5.08" width="0.254" layer="94"/>
<wire x1="-1.27" y1="5.08" x2="-1.27" y2="6.35" width="0.254" layer="94"/>
<wire x1="-3.81" y1="5.08" x2="-3.81" y2="6.35" width="0.254" layer="94"/>
<wire x1="-3.81" y1="6.35" x2="-3.175" y2="6.35" width="0.254" layer="94"/>
<wire x1="0" y1="5.08" x2="-1.27" y2="5.08" width="0.254" layer="94"/>
<wire x1="-5.08" y1="5.08" x2="-3.81" y2="5.08" width="0.254" layer="94"/>
<wire x1="1.27" y1="-6.35" x2="3.81" y2="-5.08" width="0.254" layer="94"/>
<wire x1="3.81" y1="-5.08" x2="1.27" y2="-3.81" width="0.254" layer="94"/>
<wire x1="3.81" y1="-3.81" x2="3.81" y2="-5.08" width="0.254" layer="94"/>
<wire x1="1.27" y1="-3.81" x2="1.27" y2="-5.08" width="0.254" layer="94"/>
<wire x1="1.27" y1="-5.08" x2="1.27" y2="-6.35" width="0.254" layer="94"/>
<wire x1="3.81" y1="-5.08" x2="3.81" y2="-6.35" width="0.254" layer="94"/>
<wire x1="3.81" y1="-6.35" x2="3.175" y2="-6.35" width="0.254" layer="94"/>
<wire x1="0" y1="-5.08" x2="1.27" y2="-5.08" width="0.254" layer="94"/>
<wire x1="5.08" y1="-5.08" x2="3.81" y2="-5.08" width="0.254" layer="94"/>
<wire x1="-1.27" y1="-3.81" x2="-3.81" y2="-5.08" width="0.254" layer="94"/>
<wire x1="-3.81" y1="-5.08" x2="-1.27" y2="-6.35" width="0.254" layer="94"/>
<wire x1="-3.81" y1="-6.35" x2="-3.81" y2="-5.08" width="0.254" layer="94"/>
<wire x1="-1.27" y1="-6.35" x2="-1.27" y2="-5.08" width="0.254" layer="94"/>
<wire x1="-1.27" y1="-5.08" x2="-1.27" y2="-3.81" width="0.254" layer="94"/>
<wire x1="-3.81" y1="-5.08" x2="-3.81" y2="-3.81" width="0.254" layer="94"/>
<wire x1="-3.81" y1="-3.81" x2="-3.175" y2="-3.81" width="0.254" layer="94"/>
<wire x1="0" y1="-5.08" x2="-1.27" y2="-5.08" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-5.08" x2="-3.81" y2="-5.08" width="0.254" layer="94"/>
<wire x1="-5.08" y1="0" x2="0" y2="0" width="0.1524" layer="94"/>
<wire x1="0" y1="5.08" x2="0" y2="0" width="0.1524" layer="94"/>
<wire x1="0" y1="0" x2="0" y2="-5.08" width="0.1524" layer="94"/>
<circle x="0" y="0" radius="0.1143" width="0.2286" layer="94"/>
<circle x="0" y="5.08" radius="0.1143" width="0.2286" layer="94"/>
<circle x="0" y="-5.08" radius="0.1143" width="0.2286" layer="94"/>
<wire x1="-5.08" y1="-7.62" x2="-5.08" y2="7.62" width="0.254" layer="94"/>
<wire x1="-5.08" y1="7.62" x2="5.08" y2="7.62" width="0.254" layer="94"/>
<wire x1="5.08" y1="7.62" x2="5.08" y2="-7.62" width="0.254" layer="94"/>
<wire x1="5.08" y1="-7.62" x2="-5.08" y2="-7.62" width="0.254" layer="94"/>
<wire x1="-1.27" y1="5.08" x2="-3.81" y2="5.08" width="0.1524" layer="94"/>
<wire x1="1.27" y1="5.08" x2="3.556" y2="5.08" width="0.1524" layer="94"/>
<wire x1="-1.27" y1="-5.08" x2="-3.81" y2="-5.08" width="0.1524" layer="94"/>
<wire x1="1.27" y1="-5.08" x2="3.81" y2="-5.08" width="0.1524" layer="94"/>
<pin name="5" x="7.62" y="5.08" visible="off" length="short" direction="pas" rot="R180"/>
<pin name="2" x="-7.62" y="0" visible="off" length="short" direction="pas"/>
<pin name="1" x="-7.62" y="5.08" visible="off" length="short" direction="pas"/>
<pin name="4" x="7.62" y="-5.08" visible="off" length="short" direction="pas" rot="R180"/>
<pin name="3" x="-7.62" y="-5.08" visible="off" length="short" direction="pas"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="PESD5V0L4UG,115" prefix="U">
<description>PESDxL4UG Series 10 V 19 pF Low Capacitance ESD Protection Diode Array - SOT-353 </description>
<gates>
<gate name="G$1" symbol="PESD5V0L4UG,115" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SOT65P210X110-5N">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
</connects>
<technologies>
<technology name="">
<attribute name="DESCRIPTION" value=" 13V Clamp 2.5A (8/20µs) Ipp Tvs Diode Surface Mount 5-TSSOP "/>
<attribute name="DIGI-KEY_PART_NUMBER" value="1727-3835-1-ND"/>
<attribute name="MF" value="Nexperia USA"/>
<attribute name="MP" value="PESD5V0L4UG,115"/>
<attribute name="PACKAGE" value="TSSOP5-5 Nexperia"/>
<attribute name="PURCHASE-URL" value="https://pricing.snapeda.com/search/part/PESD5V0L4UG,115/?ref=eda"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="CP2102N-A02-GQFN24R">
<packages>
<package name="QFN50P400X400X80-25N">
<rectangle x1="-0.77" y1="-0.77" x2="0.77" y2="0.77" layer="31"/>
<text x="-2.84" y="-3.605" size="1.27" layer="27" align="top-left">&gt;VALUE</text>
<text x="-2.84" y="3.605" size="1.27" layer="25">&gt;NAME</text>
<circle x="-2.975" y="1.25" radius="0.1" width="0.2" layer="21"/>
<circle x="-2.975" y="1.25" radius="0.1" width="0.2" layer="51"/>
<wire x1="2" y1="-2" x2="-2" y2="-2" width="0.127" layer="51"/>
<wire x1="2" y1="2" x2="-2" y2="2" width="0.127" layer="51"/>
<wire x1="2" y1="-2" x2="2" y2="2" width="0.127" layer="51"/>
<wire x1="-2" y1="-2" x2="-2" y2="2" width="0.127" layer="51"/>
<wire x1="2" y1="-2" x2="1.7" y2="-2" width="0.127" layer="21"/>
<wire x1="2" y1="2" x2="1.7" y2="2" width="0.127" layer="21"/>
<wire x1="-2" y1="-2" x2="-1.7" y2="-2" width="0.127" layer="21"/>
<wire x1="-2" y1="2" x2="-1.7" y2="2" width="0.127" layer="21"/>
<wire x1="2" y1="-2" x2="2" y2="-1.7" width="0.127" layer="21"/>
<wire x1="2" y1="2" x2="2" y2="1.7" width="0.127" layer="21"/>
<wire x1="-2" y1="-2" x2="-2" y2="-1.7" width="0.127" layer="21"/>
<wire x1="-2" y1="2" x2="-2" y2="1.7" width="0.127" layer="21"/>
<wire x1="-2.605" y1="-2.605" x2="2.605" y2="-2.605" width="0.05" layer="39"/>
<wire x1="-2.605" y1="2.605" x2="2.605" y2="2.605" width="0.05" layer="39"/>
<wire x1="-2.605" y1="-2.605" x2="-2.605" y2="2.605" width="0.05" layer="39"/>
<wire x1="2.605" y1="-2.605" x2="2.605" y2="2.605" width="0.05" layer="39"/>
<smd name="7" x="-1.25" y="-1.935" dx="0.84" dy="0.26" layer="1" roundness="25" rot="R90"/>
<smd name="8" x="-0.75" y="-1.935" dx="0.84" dy="0.26" layer="1" roundness="25" rot="R90"/>
<smd name="9" x="-0.25" y="-1.935" dx="0.84" dy="0.26" layer="1" roundness="25" rot="R90"/>
<smd name="10" x="0.25" y="-1.935" dx="0.84" dy="0.26" layer="1" roundness="25" rot="R90"/>
<smd name="11" x="0.75" y="-1.935" dx="0.84" dy="0.26" layer="1" roundness="25" rot="R90"/>
<smd name="12" x="1.25" y="-1.935" dx="0.84" dy="0.26" layer="1" roundness="25" rot="R90"/>
<smd name="19" x="1.25" y="1.935" dx="0.84" dy="0.26" layer="1" roundness="25" rot="R90"/>
<smd name="20" x="0.75" y="1.935" dx="0.84" dy="0.26" layer="1" roundness="25" rot="R90"/>
<smd name="21" x="0.25" y="1.935" dx="0.84" dy="0.26" layer="1" roundness="25" rot="R90"/>
<smd name="22" x="-0.25" y="1.935" dx="0.84" dy="0.26" layer="1" roundness="25" rot="R90"/>
<smd name="23" x="-0.75" y="1.935" dx="0.84" dy="0.26" layer="1" roundness="25" rot="R90"/>
<smd name="24" x="-1.25" y="1.935" dx="0.84" dy="0.26" layer="1" roundness="25" rot="R90"/>
<smd name="1" x="-1.935" y="1.25" dx="0.84" dy="0.26" layer="1" roundness="25"/>
<smd name="2" x="-1.935" y="0.75" dx="0.84" dy="0.26" layer="1" roundness="25"/>
<smd name="3" x="-1.935" y="0.25" dx="0.84" dy="0.26" layer="1" roundness="25"/>
<smd name="4" x="-1.935" y="-0.25" dx="0.84" dy="0.26" layer="1" roundness="25"/>
<smd name="5" x="-1.935" y="-0.75" dx="0.84" dy="0.26" layer="1" roundness="25"/>
<smd name="6" x="-1.935" y="-1.25" dx="0.84" dy="0.26" layer="1" roundness="25"/>
<smd name="13" x="1.935" y="-1.25" dx="0.84" dy="0.26" layer="1" roundness="25"/>
<smd name="14" x="1.935" y="-0.75" dx="0.84" dy="0.26" layer="1" roundness="25"/>
<smd name="15" x="1.935" y="-0.25" dx="0.84" dy="0.26" layer="1" roundness="25"/>
<smd name="16" x="1.935" y="0.25" dx="0.84" dy="0.26" layer="1" roundness="25"/>
<smd name="17" x="1.935" y="0.75" dx="0.84" dy="0.26" layer="1" roundness="25"/>
<smd name="18" x="1.935" y="1.25" dx="0.84" dy="0.26" layer="1" roundness="25"/>
<smd name="25" x="0" y="0" dx="2.45" dy="2.45" layer="1" cream="no"/>
</package>
</packages>
<symbols>
<symbol name="CP2102N-A02-GQFN24R">
<wire x1="-17.78" y1="22.86" x2="17.78" y2="22.86" width="0.254" layer="94"/>
<wire x1="17.78" y1="22.86" x2="17.78" y2="-22.86" width="0.254" layer="94"/>
<wire x1="17.78" y1="-22.86" x2="-17.78" y2="-22.86" width="0.254" layer="94"/>
<wire x1="-17.78" y1="-22.86" x2="-17.78" y2="22.86" width="0.254" layer="94"/>
<text x="-17.78" y="23.86" size="1.778" layer="95" ratio="10" rot="SR0">&gt;NAME</text>
<text x="-17.78" y="-25.4" size="1.778" layer="96" ratio="10" rot="SR0">&gt;VALUE</text>
<pin name="!CTS" x="-22.86" y="0" length="middle" direction="in"/>
<pin name="!DCD" x="-22.86" y="-7.62" length="middle" direction="in"/>
<pin name="!DSR" x="-22.86" y="-5.08" length="middle" direction="in"/>
<pin name="RXD" x="-22.86" y="-15.24" length="middle" direction="in"/>
<pin name="VBUS" x="-22.86" y="10.16" length="middle" direction="in"/>
<pin name="VREGIN" x="-22.86" y="15.24" length="middle" direction="in"/>
<pin name="D+" x="-22.86" y="7.62" length="middle"/>
<pin name="D-" x="-22.86" y="5.08" length="middle"/>
<pin name="GPIO.0/TXT" x="22.86" y="-5.08" length="middle" rot="R180"/>
<pin name="GPIO.1/RXT" x="22.86" y="-7.62" length="middle" rot="R180"/>
<pin name="!RI!/CLK" x="22.86" y="7.62" length="middle" rot="R180"/>
<pin name="!RST" x="22.86" y="12.7" length="middle" rot="R180"/>
<pin name="VIO" x="22.86" y="17.78" length="middle" direction="pwr" rot="R180"/>
<pin name="VDD" x="22.86" y="20.32" length="middle" direction="pwr" rot="R180"/>
<pin name="!DTR" x="-22.86" y="-10.16" length="middle" direction="out"/>
<pin name="!RTS" x="-22.86" y="-2.54" length="middle" direction="out"/>
<pin name="SUSPEND" x="22.86" y="2.54" length="middle" direction="out" rot="R180"/>
<pin name="SUSPENDB" x="22.86" y="0" length="middle" direction="out" rot="R180"/>
<pin name="TXD" x="-22.86" y="-17.78" length="middle" direction="out"/>
<pin name="GPIO.2/RS485" x="22.86" y="-10.16" length="middle" rot="R180"/>
<pin name="GPIO.3/WAKEUP" x="22.86" y="-12.7" length="middle" rot="R180"/>
<pin name="GND" x="22.86" y="-20.32" length="middle" direction="pwr" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="CP2102N-A02-GQFN24R" prefix="U">
<gates>
<gate name="G$1" symbol="CP2102N-A02-GQFN24R" x="0" y="0"/>
</gates>
<devices>
<device name="" package="QFN50P400X400X80-25N">
<connects>
<connect gate="G$1" pin="!CTS" pad="18"/>
<connect gate="G$1" pin="!DCD" pad="24"/>
<connect gate="G$1" pin="!DSR" pad="22"/>
<connect gate="G$1" pin="!DTR" pad="23"/>
<connect gate="G$1" pin="!RI!/CLK" pad="1"/>
<connect gate="G$1" pin="!RST" pad="9"/>
<connect gate="G$1" pin="!RTS" pad="19"/>
<connect gate="G$1" pin="D+" pad="3"/>
<connect gate="G$1" pin="D-" pad="4"/>
<connect gate="G$1" pin="GND" pad="2 25"/>
<connect gate="G$1" pin="GPIO.0/TXT" pad="14"/>
<connect gate="G$1" pin="GPIO.1/RXT" pad="13"/>
<connect gate="G$1" pin="GPIO.2/RS485" pad="12"/>
<connect gate="G$1" pin="GPIO.3/WAKEUP" pad="11"/>
<connect gate="G$1" pin="RXD" pad="20"/>
<connect gate="G$1" pin="SUSPEND" pad="17"/>
<connect gate="G$1" pin="SUSPENDB" pad="15"/>
<connect gate="G$1" pin="TXD" pad="21"/>
<connect gate="G$1" pin="VBUS" pad="8"/>
<connect gate="G$1" pin="VDD" pad="6"/>
<connect gate="G$1" pin="VIO" pad="5"/>
<connect gate="G$1" pin="VREGIN" pad="7"/>
</connects>
<technologies>
<technology name="">
<attribute name="DESCRIPTION" value=" USB Bridge, USB to UART USB 2.0 UART Interface 24-QFN (4x4) "/>
<attribute name="DIGI-KEY_PART_NUMBER" value="336-5888-1-ND"/>
<attribute name="MF" value="Silicon Labs"/>
<attribute name="MP" value="CP2102N-A02-GQFN24R"/>
<attribute name="PACKAGE" value="WFQFN-24 Silicon Labs"/>
<attribute name="PURCHASE-URL" value="https://pricing.snapeda.com/search/part/CP2102N-A02-GQFN24R/?ref=eda"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="1N5819">
<packages>
<package name="SOD-123">
<wire x1="-1.4" y1="0.8" x2="-1.4" y2="0.5" width="0.127" layer="21"/>
<wire x1="-1.4" y1="0.8" x2="1.4" y2="0.8" width="0.127" layer="21"/>
<wire x1="1.4" y1="0.8" x2="1.4" y2="0.5" width="0.127" layer="21"/>
<wire x1="-1.4" y1="-0.5" x2="-1.4" y2="-0.8" width="0.127" layer="21"/>
<wire x1="-1.4" y1="-0.8" x2="1.4" y2="-0.8" width="0.127" layer="21"/>
<wire x1="1.4" y1="-0.8" x2="1.4" y2="-0.5" width="0.127" layer="21"/>
<wire x1="0.2" y1="0" x2="-0.2" y2="0.4" width="0.127" layer="21"/>
<wire x1="-0.2" y1="0.4" x2="-0.2" y2="0" width="0.127" layer="21"/>
<wire x1="-0.2" y1="0" x2="-0.2" y2="-0.4" width="0.127" layer="21"/>
<wire x1="-0.2" y1="-0.4" x2="0.2" y2="0" width="0.127" layer="21"/>
<wire x1="0.2" y1="0.4" x2="0.2" y2="0" width="0.127" layer="21"/>
<wire x1="0.2" y1="0" x2="0.2" y2="-0.4" width="0.127" layer="21"/>
<wire x1="-0.2" y1="0" x2="-0.6" y2="0" width="0.127" layer="21"/>
<wire x1="0.2" y1="0" x2="0.6" y2="0" width="0.127" layer="21"/>
<smd name="A" x="-1.85" y="0" dx="1.2" dy="0.7" layer="1"/>
<smd name="K" x="1.85" y="0" dx="1.2" dy="0.7" layer="1"/>
</package>
</packages>
<symbols>
<symbol name="DIODE-SYM">
<wire x1="2.54" y1="0" x2="0" y2="2.54" width="0.4064" layer="94"/>
<wire x1="0" y1="2.54" x2="0" y2="-2.54" width="0.4064" layer="94"/>
<wire x1="0" y1="-2.54" x2="2.54" y2="0" width="0.4064" layer="94"/>
<wire x1="2.54" y1="-2.54" x2="2.54" y2="2.794" width="0.4064" layer="94"/>
<text x="0" y="-5.088409375" size="1.2721" layer="95">&gt;NAME</text>
<text x="0" y="2.54505" size="1.27251875" layer="96">&gt;VALUE</text>
<pin name="A" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
<pin name="K" x="5.08" y="0" visible="off" length="short" direction="pas" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="1N5819">
<gates>
<gate name="G$1" symbol="DIODE-SYM" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SOD-123">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="K" pad="K"/>
</connects>
<technologies>
<technology name="">
<attribute name="DESCRIPTION" value=" Diode Schottky 40V 1A Through Hole DO-41 "/>
<attribute name="DIGI-KEY_PART_NUMBER" value="497-6610-1-ND"/>
<attribute name="MF" value="STMicroelectronics"/>
<attribute name="MP" value="1N5819"/>
<attribute name="PACKAGE" value="DO-41 STMicroelectronics"/>
<attribute name="PURCHASE-URL" value="https://pricing.snapeda.com/search/part/1N5819/?ref=eda"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="supply1" urn="urn:adsk.eagle:library:371">
<description>&lt;b&gt;Supply Symbols&lt;/b&gt;&lt;p&gt;
 GND, VCC, 0V, +5V, -5V, etc.&lt;p&gt;
 Please keep in mind, that these devices are necessary for the
 automatic wiring of the supply signals.&lt;p&gt;
 The pin name defined in the symbol is identical to the net which is to be wired automatically.&lt;p&gt;
 In this library the device names are the same as the pin names of the symbols, therefore the correct signal names appear next to the supply symbols in the schematic.&lt;p&gt;
 &lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
</packages>
<symbols>
<symbol name="+5V" urn="urn:adsk.eagle:symbol:26929/1" library_version="1">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<text x="-2.54" y="-5.08" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<pin name="+5V" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
<symbol name="GND" urn="urn:adsk.eagle:symbol:26925/1" library_version="1">
<wire x1="-1.905" y1="0" x2="1.905" y2="0" width="0.254" layer="94"/>
<text x="-2.54" y="-2.54" size="1.778" layer="96">&gt;VALUE</text>
<pin name="GND" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
<symbol name="+3V3" urn="urn:adsk.eagle:symbol:26950/1" library_version="1">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<text x="-2.54" y="-5.08" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<pin name="+3V3" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
<symbol name="VCC" urn="urn:adsk.eagle:symbol:26928/1" library_version="1">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<text x="-2.54" y="-2.54" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<pin name="VCC" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="+5V" urn="urn:adsk.eagle:component:26963/1" prefix="P+" library_version="1">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="+5V" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="GND" urn="urn:adsk.eagle:component:26954/1" prefix="GND" library_version="1">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="GND" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="+3V3" urn="urn:adsk.eagle:component:26981/1" prefix="+3V3" library_version="1">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="+3V3" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="VCC" urn="urn:adsk.eagle:component:26957/1" prefix="P+" library_version="1">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="VCC" symbol="VCC" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="APT2012SRCPRV">
<packages>
<package name="LEDC2012X75N">
<wire x1="-1" y1="0.63" x2="1" y2="0.63" width="0.127" layer="51"/>
<wire x1="1" y1="0.63" x2="1" y2="-0.63" width="0.127" layer="51"/>
<wire x1="1" y1="-0.63" x2="-1" y2="-0.63" width="0.127" layer="51"/>
<wire x1="-1" y1="-0.63" x2="-1" y2="0.63" width="0.127" layer="51"/>
<wire x1="-1" y1="0.995" x2="1" y2="0.995" width="0.127" layer="21"/>
<wire x1="-1" y1="-0.995" x2="1" y2="-0.995" width="0.127" layer="21"/>
<wire x1="-1.66" y1="1.059" x2="1.66" y2="1.059" width="0.05" layer="39"/>
<wire x1="1.66" y1="1.059" x2="1.66" y2="-1.059" width="0.05" layer="39"/>
<wire x1="1.66" y1="-1.059" x2="-1.66" y2="-1.059" width="0.05" layer="39"/>
<wire x1="-1.66" y1="-1.059" x2="-1.66" y2="1.059" width="0.05" layer="39"/>
<circle x="-2.2" y="0" radius="0.1" width="0.3" layer="21"/>
<circle x="-2.2" y="0" radius="0.1" width="0.3" layer="51"/>
<text x="-2.54" y="1.27" size="1.778" layer="25">&gt;NAME</text>
<text x="-2.54" y="-3.048" size="1.778" layer="27">&gt;VALUE</text>
<smd name="C" x="-0.975" y="0" dx="0.86" dy="1.36" layer="1" roundness="50"/>
<smd name="A" x="0.975" y="0" dx="0.86" dy="1.36" layer="1" roundness="50"/>
</package>
</packages>
<symbols>
<symbol name="APT2012SRCPRV">
<wire x1="2.54" y1="-1.27" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="2.54" y2="1.27" width="0.254" layer="94"/>
<wire x1="0" y1="-1.27" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="0" y2="1.27" width="0.254" layer="94"/>
<wire x1="2.54" y1="-1.27" x2="2.54" y2="0" width="0.254" layer="94"/>
<wire x1="2.54" y1="0" x2="2.54" y2="1.27" width="0.254" layer="94"/>
<wire x1="1.778" y1="2.032" x2="0.381" y2="3.429" width="0.1524" layer="94"/>
<wire x1="0.635" y1="1.905" x2="-0.762" y2="3.302" width="0.1524" layer="94"/>
<text x="-2.03513125" y="4.07026875" size="1.780740625" layer="95">&gt;NAME</text>
<text x="-2.03368125" y="-3.81315" size="1.77946875" layer="96">&gt;VALUE</text>
<polygon width="0.1524" layer="94">
<vertex x="0.381" y="3.429"/>
<vertex x="1.27" y="3.048"/>
<vertex x="0.762" y="2.54"/>
</polygon>
<polygon width="0.1524" layer="94">
<vertex x="-0.762" y="3.302"/>
<vertex x="0.127" y="2.921"/>
<vertex x="-0.381" y="2.413"/>
</polygon>
<wire x1="-5.08" y1="0" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="2.54" y1="0" x2="7.62" y2="0" width="0.254" layer="94"/>
<pin name="C" x="-7.62" y="0" length="short" direction="pas"/>
<pin name="A" x="10.16" y="0" length="short" direction="pas" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="APT2012SRCPRV" prefix="D">
<description>2.0X1.2MM,RED SMD LED </description>
<gates>
<gate name="G$1" symbol="APT2012SRCPRV" x="0" y="0"/>
</gates>
<devices>
<device name="" package="LEDC2012X75N">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<technologies>
<technology name="">
<attribute name="DESCRIPTION" value=" Red 640nm LED Indication - Discrete 1.85V 0805 (2012 Metric) "/>
<attribute name="DIGI-KEY_PART_NUMBER" value="754-1132-1-ND"/>
<attribute name="MF" value="Kingbright"/>
<attribute name="MP" value="APT2012SRCPRV"/>
<attribute name="PACKAGE" value="0805 Kingbright"/>
<attribute name="PURCHASE-URL" value="https://pricing.snapeda.com/search/part/APT2012SRCPRV/?ref=eda"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="CL10A475KQ8NNNC">
<packages>
<package name="CAPC1608X90N">
<text x="-1.46" y="-0.8" size="0.5" layer="27" align="top-left">&gt;VALUE</text>
<text x="-1.46" y="0.8" size="0.5" layer="25">&gt;NAME</text>
<wire x1="0.85" y1="-0.45" x2="-0.85" y2="-0.45" width="0.127" layer="51"/>
<wire x1="0.85" y1="0.45" x2="-0.85" y2="0.45" width="0.127" layer="51"/>
<wire x1="0.85" y1="-0.45" x2="0.85" y2="0.45" width="0.127" layer="51"/>
<wire x1="-0.85" y1="-0.45" x2="-0.85" y2="0.45" width="0.127" layer="51"/>
<wire x1="-1.465" y1="-0.715" x2="1.465" y2="-0.715" width="0.05" layer="39"/>
<wire x1="-1.465" y1="0.715" x2="1.465" y2="0.715" width="0.05" layer="39"/>
<wire x1="-1.465" y1="-0.715" x2="-1.465" y2="0.715" width="0.05" layer="39"/>
<wire x1="1.465" y1="-0.715" x2="1.465" y2="0.715" width="0.05" layer="39"/>
<smd name="1" x="-0.78" y="0" dx="0.87" dy="0.93" layer="1"/>
<smd name="2" x="0.78" y="0" dx="0.87" dy="0.93" layer="1"/>
</package>
</packages>
<symbols>
<symbol name="CL10A475KQ8NNNC">
<text x="0" y="3.81093125" size="1.77843125" layer="95">&gt;NAME</text>
<text x="0" y="-5.08848125" size="1.78096875" layer="96">&gt;VALUE</text>
<rectangle x1="0" y1="-1.906859375" x2="0.635" y2="1.905" layer="94"/>
<rectangle x1="1.90685" y1="-1.90685" x2="2.54" y2="1.905" layer="94"/>
<pin name="2" x="5.08" y="0" visible="pad" length="short" direction="pas" rot="R180"/>
<pin name="1" x="-2.54" y="0" visible="pad" length="short" direction="pas"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="CL10A475KQ8NNNC" prefix="C">
<description>Cap Ceramic 4.7uF 6.3V X5R 10% Pad SMD 0603 85C T/R </description>
<gates>
<gate name="G$1" symbol="CL10A475KQ8NNNC" x="0" y="0"/>
</gates>
<devices>
<device name="" package="CAPC1608X90N">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="DESCRIPTION" value=" 4.7µF ±10% 6.3V Ceramic Capacitor X5R 0603 (1608 Metric) "/>
<attribute name="DIGI-KEY_PART_NUMBER" value="1276-1045-1-ND"/>
<attribute name="MF" value="Samsung Electro-Mechanics"/>
<attribute name="MP" value="CL10A475KQ8NNNC"/>
<attribute name="PACKAGE" value="0603 Samsung"/>
<attribute name="PURCHASE-URL" value="https://pricing.snapeda.com/search/part/CL10A475KQ8NNNC/?ref=eda"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="con-lsta" urn="urn:adsk.eagle:library:161">
<description>&lt;b&gt;Female Headers etc.&lt;/b&gt;&lt;p&gt;
Naming:&lt;p&gt;
FE = female&lt;p&gt;
# contacts - # rows&lt;p&gt;
W = angled&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="FE05-2" urn="urn:adsk.eagle:footprint:8099/1" library_version="2">
<description>&lt;b&gt;FEMALE HEADER&lt;/b&gt;</description>
<wire x1="-5.715" y1="3.048" x2="5.715" y2="3.048" width="0.1524" layer="21"/>
<wire x1="6.35" y1="-2.413" x2="6.35" y2="2.413" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="-2.413" x2="-6.35" y2="2.413" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="-3.048" x2="5.715" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="-6.35" y1="2.413" x2="-5.715" y2="3.048" width="0.1524" layer="21" curve="-90"/>
<wire x1="5.715" y1="3.048" x2="6.35" y2="2.413" width="0.1524" layer="21" curve="-90"/>
<wire x1="5.715" y1="-3.048" x2="6.35" y2="-2.413" width="0.1524" layer="21" curve="90"/>
<wire x1="-6.35" y1="-2.413" x2="-5.715" y2="-3.048" width="0.1524" layer="21" curve="90"/>
<circle x="-5.08" y="-1.27" radius="0.127" width="0.4064" layer="51"/>
<circle x="-5.08" y="1.27" radius="0.127" width="0.4064" layer="51"/>
<circle x="-2.54" y="-1.27" radius="0.127" width="0.4064" layer="51"/>
<circle x="-2.54" y="1.27" radius="0.127" width="0.4064" layer="51"/>
<circle x="0" y="-1.27" radius="0.127" width="0.4064" layer="51"/>
<circle x="0" y="1.27" radius="0.127" width="0.4064" layer="51"/>
<circle x="2.54" y="-1.27" radius="0.127" width="0.4064" layer="51"/>
<circle x="2.54" y="1.27" radius="0.127" width="0.4064" layer="51"/>
<circle x="5.08" y="-1.27" radius="0.127" width="0.4064" layer="51"/>
<circle x="5.08" y="1.27" radius="0.127" width="0.4064" layer="51"/>
<circle x="-5.08" y="-1.27" radius="0.889" width="0.1524" layer="51"/>
<circle x="-5.08" y="1.27" radius="0.889" width="0.1524" layer="51"/>
<circle x="-2.54" y="1.27" radius="0.889" width="0.1524" layer="51"/>
<circle x="0" y="1.27" radius="0.889" width="0.1524" layer="51"/>
<circle x="2.54" y="1.27" radius="0.889" width="0.1524" layer="51"/>
<circle x="5.08" y="1.27" radius="0.889" width="0.1524" layer="51"/>
<circle x="-2.54" y="-1.27" radius="0.889" width="0.1524" layer="51"/>
<circle x="0" y="-1.27" radius="0.889" width="0.1524" layer="51"/>
<circle x="2.54" y="-1.27" radius="0.889" width="0.1524" layer="51"/>
<circle x="5.08" y="-1.27" radius="0.889" width="0.1524" layer="51"/>
<pad name="1" x="-5.08" y="1.27" drill="0.9144"/>
<pad name="2" x="-5.08" y="-1.27" drill="0.9144" shape="octagon"/>
<pad name="3" x="-2.54" y="1.27" drill="0.9144" shape="octagon"/>
<pad name="4" x="-2.54" y="-1.27" drill="0.9144" shape="octagon"/>
<pad name="5" x="0" y="1.27" drill="0.9144" shape="octagon"/>
<pad name="6" x="0" y="-1.27" drill="0.9144" shape="octagon"/>
<pad name="7" x="2.54" y="1.27" drill="0.9144" shape="octagon"/>
<pad name="8" x="2.54" y="-1.27" drill="0.9144" shape="octagon"/>
<pad name="9" x="5.08" y="1.27" drill="0.9144" shape="octagon"/>
<pad name="10" x="5.08" y="-1.27" drill="0.9144" shape="octagon"/>
<text x="-2.54" y="3.429" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.461" y="3.429" size="1.27" layer="21" ratio="10">1</text>
<text x="-6.35" y="-4.699" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="4.191" y="-4.699" size="1.27" layer="21" ratio="10">10</text>
</package>
</packages>
<packages3d>
<package3d name="FE05-2" urn="urn:adsk.eagle:package:8170/1" type="box" library_version="2">
<description>FEMALE HEADER</description>
<packageinstances>
<packageinstance name="FE05-2"/>
</packageinstances>
</package3d>
</packages3d>
<symbols>
<symbol name="FE05-2" urn="urn:adsk.eagle:symbol:8098/1" library_version="2">
<wire x1="3.81" y1="-7.62" x2="-3.81" y2="-7.62" width="0.4064" layer="94"/>
<wire x1="-1.905" y1="-0.635" x2="-1.905" y2="0.635" width="0.254" layer="94" curve="-180" cap="flat"/>
<wire x1="-1.905" y1="-3.175" x2="-1.905" y2="-1.905" width="0.254" layer="94" curve="-180" cap="flat"/>
<wire x1="-1.905" y1="-5.715" x2="-1.905" y2="-4.445" width="0.254" layer="94" curve="-180" cap="flat"/>
<wire x1="1.905" y1="0.635" x2="1.905" y2="-0.635" width="0.254" layer="94" curve="-180" cap="flat"/>
<wire x1="1.905" y1="-1.905" x2="1.905" y2="-3.175" width="0.254" layer="94" curve="-180" cap="flat"/>
<wire x1="1.905" y1="-4.445" x2="1.905" y2="-5.715" width="0.254" layer="94" curve="-180" cap="flat"/>
<wire x1="-3.81" y1="7.62" x2="-3.81" y2="-7.62" width="0.4064" layer="94"/>
<wire x1="3.81" y1="-7.62" x2="3.81" y2="7.62" width="0.4064" layer="94"/>
<wire x1="-3.81" y1="7.62" x2="3.81" y2="7.62" width="0.4064" layer="94"/>
<wire x1="-1.905" y1="4.445" x2="-1.905" y2="5.715" width="0.254" layer="94" curve="-180" cap="flat"/>
<wire x1="-1.905" y1="1.905" x2="-1.905" y2="3.175" width="0.254" layer="94" curve="-180" cap="flat"/>
<wire x1="1.905" y1="5.715" x2="1.905" y2="4.445" width="0.254" layer="94" curve="-180" cap="flat"/>
<wire x1="1.905" y1="3.175" x2="1.905" y2="1.905" width="0.254" layer="94" curve="-180" cap="flat"/>
<text x="-3.81" y="-10.16" size="1.778" layer="96">&gt;VALUE</text>
<text x="-3.81" y="8.382" size="1.778" layer="95">&gt;NAME</text>
<pin name="1" x="-7.62" y="-5.08" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="3" x="-7.62" y="-2.54" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="5" x="-7.62" y="0" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="2" x="7.62" y="-5.08" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="4" x="7.62" y="-2.54" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="6" x="7.62" y="0" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="7" x="-7.62" y="2.54" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="9" x="-7.62" y="5.08" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="8" x="7.62" y="2.54" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="10" x="7.62" y="5.08" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="FE05-2" urn="urn:adsk.eagle:component:8211/2" prefix="SV" uservalue="yes" library_version="2">
<description>&lt;b&gt;FEMALE HEADER&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="FE05-2" x="0" y="0"/>
</gates>
<devices>
<device name="" package="FE05-2">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="10" pad="10"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
<connect gate="G$1" pin="7" pad="7"/>
<connect gate="G$1" pin="8" pad="8"/>
<connect gate="G$1" pin="9" pad="9"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:8170/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
<attribute name="POPULARITY" value="3" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="TL3305AF260QG">
<packages>
<package name="SW_TL3305AF260QG">
<text x="-2.37845" y="4.975859375" size="1.016" layer="25">&gt;NAME</text>
<text x="-2.209990625" y="-5.062390625" size="1.016" layer="27" align="top-left">&gt;VALUE</text>
<circle x="-2.7" y="3.6" radius="0.1" width="0.2" layer="51"/>
<circle x="-2.7" y="3.6" radius="0.1" width="0.2" layer="21"/>
<wire x1="-2.5" y1="4.65" x2="-2.5" y2="-4.65" width="0.05" layer="39"/>
<wire x1="-2.5" y1="4.65" x2="2.5" y2="4.65" width="0.05" layer="39"/>
<wire x1="2.5" y1="-4.65" x2="2.5" y2="4.65" width="0.05" layer="39"/>
<wire x1="2.5" y1="-4.65" x2="-2.5" y2="-4.65" width="0.05" layer="39" style="longdash"/>
<wire x1="-2.25" y1="2.25" x2="-2.25" y2="-2.25" width="0.127" layer="51"/>
<wire x1="-2.25" y1="2.25" x2="2.25" y2="2.25" width="0.127" layer="51"/>
<wire x1="2.25" y1="-2.25" x2="2.25" y2="2.25" width="0.127" layer="51"/>
<wire x1="2.25" y1="-2.25" x2="-2.25" y2="-2.25" width="0.127" layer="51"/>
<wire x1="-2.25" y1="2.25" x2="-2.25" y2="-2.25" width="0.127" layer="21"/>
<wire x1="-2.25" y1="2.25" x2="2.25" y2="2.25" width="0.127" layer="21"/>
<wire x1="2.25" y1="-2.25" x2="2.25" y2="2.25" width="0.127" layer="21"/>
<wire x1="2.25" y1="-2.25" x2="-2.25" y2="-2.25" width="0.127" layer="21"/>
<smd name="1" x="-1.5" y="3.6" dx="1.4" dy="1.6" layer="1"/>
<smd name="2" x="-1.5" y="-3.6" dx="1.4" dy="1.6" layer="1"/>
<smd name="3" x="1.5" y="3.6" dx="1.4" dy="1.6" layer="1"/>
<smd name="4" x="1.5" y="-3.6" dx="1.4" dy="1.6" layer="1"/>
</package>
</packages>
<symbols>
<symbol name="TL3305AF260QG">
<text x="-5.08" y="5.08" size="1.778" layer="95">&gt;NAME</text>
<text x="-5.08" y="-5.08" size="1.778" layer="96">&gt;VALUE</text>
<wire x1="-5.08" y1="0" x2="-2.54" y2="0" width="0.1524" layer="94"/>
<circle x="-2.54" y="0" radius="0.254" width="0.508" layer="94"/>
<wire x1="5.08" y1="0" x2="2.54" y2="0" width="0.1524" layer="94"/>
<circle x="2.54" y="0" radius="0.254" width="0.508" layer="94"/>
<wire x1="-2.54" y1="1.524" x2="0" y2="1.524" width="0.1524" layer="94"/>
<wire x1="0" y1="1.524" x2="2.54" y2="1.524" width="0.1524" layer="94"/>
<wire x1="0" y1="2.54" x2="0" y2="1.524" width="0.1524" layer="94"/>
<wire x1="-5.08" y1="2.54" x2="-5.08" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="5.08" y1="2.54" x2="5.08" y2="-2.54" width="0.1524" layer="94"/>
<pin name="1" x="-10.16" y="2.54" visible="pad" length="middle" direction="pas"/>
<pin name="2" x="-10.16" y="-2.54" visible="pad" length="middle" direction="pas"/>
<pin name="3" x="10.16" y="2.54" visible="pad" length="middle" direction="pas" rot="R180"/>
<pin name="4" x="10.16" y="-2.54" visible="pad" length="middle" direction="pas" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="TL3305AF260QG" prefix="U">
<description>Switch Tactile Spst-No 50ma 12v &lt;a href="https://pricing.snapeda.com/parts/TL3305AF260QG/E-Switch/view-part?ref=eda"&gt;Check prices&lt;/a&gt;</description>
<gates>
<gate name="G$1" symbol="TL3305AF260QG" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SW_TL3305AF260QG">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
</connects>
<technologies>
<technology name="">
<attribute name="AVAILABILITY" value="Warning"/>
<attribute name="DESCRIPTION" value=" Tactile Switch SPST-NO Top Actuated Surface Mount "/>
<attribute name="MF" value="E-Switch"/>
<attribute name="MP" value="TL3305AF260QG"/>
<attribute name="PACKAGE" value="SMD-4 E-Switch"/>
<attribute name="PRICE" value="None"/>
<attribute name="PURCHASE-URL" value="https://pricing.snapeda.com/search/part/TL3305AF260QG/?ref=eda"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="frames" urn="urn:adsk.eagle:library:229">
<description>&lt;b&gt;Frames for Sheet and Layout&lt;/b&gt;</description>
<packages>
</packages>
<symbols>
<symbol name="TABL_L" urn="urn:adsk.eagle:symbol:13872/1" library_version="1">
<wire x1="0" y1="0" x2="401.32" y2="0" width="0.4064" layer="94"/>
<wire x1="401.32" y1="0" x2="401.32" y2="266.7" width="0.4064" layer="94"/>
<wire x1="401.32" y1="266.7" x2="0" y2="266.7" width="0.4064" layer="94"/>
<wire x1="0" y1="266.7" x2="0" y2="0" width="0.4064" layer="94"/>
</symbol>
<symbol name="DOCFIELD" urn="urn:adsk.eagle:symbol:13864/1" library_version="1">
<wire x1="0" y1="0" x2="71.12" y2="0" width="0.1016" layer="94"/>
<wire x1="101.6" y1="15.24" x2="87.63" y2="15.24" width="0.1016" layer="94"/>
<wire x1="0" y1="0" x2="0" y2="5.08" width="0.1016" layer="94"/>
<wire x1="0" y1="5.08" x2="71.12" y2="5.08" width="0.1016" layer="94"/>
<wire x1="0" y1="5.08" x2="0" y2="15.24" width="0.1016" layer="94"/>
<wire x1="101.6" y1="15.24" x2="101.6" y2="5.08" width="0.1016" layer="94"/>
<wire x1="71.12" y1="5.08" x2="71.12" y2="0" width="0.1016" layer="94"/>
<wire x1="71.12" y1="5.08" x2="87.63" y2="5.08" width="0.1016" layer="94"/>
<wire x1="71.12" y1="0" x2="101.6" y2="0" width="0.1016" layer="94"/>
<wire x1="87.63" y1="15.24" x2="87.63" y2="5.08" width="0.1016" layer="94"/>
<wire x1="87.63" y1="15.24" x2="0" y2="15.24" width="0.1016" layer="94"/>
<wire x1="87.63" y1="5.08" x2="101.6" y2="5.08" width="0.1016" layer="94"/>
<wire x1="101.6" y1="5.08" x2="101.6" y2="0" width="0.1016" layer="94"/>
<wire x1="0" y1="15.24" x2="0" y2="22.86" width="0.1016" layer="94"/>
<wire x1="101.6" y1="35.56" x2="0" y2="35.56" width="0.1016" layer="94"/>
<wire x1="101.6" y1="35.56" x2="101.6" y2="22.86" width="0.1016" layer="94"/>
<wire x1="0" y1="22.86" x2="101.6" y2="22.86" width="0.1016" layer="94"/>
<wire x1="0" y1="22.86" x2="0" y2="35.56" width="0.1016" layer="94"/>
<wire x1="101.6" y1="22.86" x2="101.6" y2="15.24" width="0.1016" layer="94"/>
<text x="1.27" y="1.27" size="2.54" layer="94">Date:</text>
<text x="12.7" y="1.27" size="2.54" layer="94">&gt;LAST_DATE_TIME</text>
<text x="72.39" y="1.27" size="2.54" layer="94">Sheet:</text>
<text x="86.36" y="1.27" size="2.54" layer="94">&gt;SHEET</text>
<text x="88.9" y="11.43" size="2.54" layer="94">REV:</text>
<text x="1.27" y="19.05" size="2.54" layer="94">TITLE:</text>
<text x="1.27" y="11.43" size="2.54" layer="94">Document Number:</text>
<text x="17.78" y="19.05" size="2.54" layer="94">&gt;DRAWING_NAME</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="TABL_L" urn="urn:adsk.eagle:component:13924/1" prefix="FRAME" uservalue="yes" library_version="1">
<description>&lt;b&gt;FRAME&lt;/b&gt;&lt;p&gt;
401 x 266 mm, landscape</description>
<gates>
<gate name="G$1" symbol="TABL_L" x="0" y="0"/>
<gate name="G$2" symbol="DOCFIELD" x="299.72" y="0" addlevel="must"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="ERJ-P06D2001V">
<packages>
<package name="RESC2012X70N">
<text x="-1.71" y="-1.02" size="0.5" layer="27" align="top-left">&gt;VALUE</text>
<text x="-1.71" y="1.02" size="0.5" layer="25">&gt;NAME</text>
<wire x1="1.1" y1="-0.68" x2="-1.1" y2="-0.68" width="0.127" layer="51"/>
<wire x1="1.1" y1="0.68" x2="-1.1" y2="0.68" width="0.127" layer="51"/>
<wire x1="1.1" y1="-0.68" x2="1.1" y2="0.68" width="0.127" layer="51"/>
<wire x1="-1.1" y1="-0.68" x2="-1.1" y2="0.68" width="0.127" layer="51"/>
<wire x1="-0.1" y1="0.68" x2="0.1" y2="0.68" width="0.127" layer="21"/>
<wire x1="-0.1" y1="-0.68" x2="0.1" y2="-0.68" width="0.127" layer="21"/>
<wire x1="-1.708" y1="-0.94" x2="1.708" y2="-0.94" width="0.05" layer="39"/>
<wire x1="-1.708" y1="0.94" x2="1.708" y2="0.94" width="0.05" layer="39"/>
<wire x1="-1.708" y1="-0.94" x2="-1.708" y2="0.94" width="0.05" layer="39"/>
<wire x1="1.708" y1="-0.94" x2="1.708" y2="0.94" width="0.05" layer="39"/>
<smd name="1" x="-0.94" y="0" dx="1.04" dy="1.38" layer="1"/>
<smd name="2" x="0.94" y="0" dx="1.04" dy="1.38" layer="1"/>
</package>
</packages>
<symbols>
<symbol name="ERJ-P06D2001V">
<text x="-7.624440625" y="2.54148125" size="2.54148125" layer="95">&gt;NAME</text>
<text x="-7.62996875" y="-5.086640625" size="2.54331875" layer="96">&gt;VALUE</text>
<pin name="1" x="-5.08" y="0" visible="off" length="middle" direction="pas"/>
<pin name="2" x="5.08" y="0" visible="off" length="middle" direction="pas" rot="R180"/>
<wire x1="-2.2225" y1="0.9525" x2="2.2225" y2="0.9525" width="0.254" layer="94"/>
<wire x1="2.2225" y1="0.9525" x2="2.2225" y2="-0.9525" width="0.254" layer="94"/>
<wire x1="2.2225" y1="-0.9525" x2="-2.2225" y2="-0.9525" width="0.254" layer="94"/>
<wire x1="-2.2225" y1="-0.9525" x2="-2.2225" y2="0.9525" width="0.254" layer="94"/>
<rectangle x1="-2.2225" y1="-0.9525" x2="2.2225" y2="0.9525" layer="94"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="ERJ-P06D2001V" prefix="R">
<gates>
<gate name="G$1" symbol="ERJ-P06D2001V" x="0" y="0"/>
</gates>
<devices>
<device name="" package="RESC2012X70N">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="DESCRIPTION" value=" Res Thick Film 0805 2K Ohm 0.5% 0.5W(1/2W) ±100ppm/°C Pad SMD Automotive T/R "/>
<attribute name="DIGI-KEY_PART_NUMBER" value="P16044CT-ND"/>
<attribute name="MF" value="Panasonic Electronic"/>
<attribute name="MP" value="ERJ-P06D2001V"/>
<attribute name="PACKAGE" value="2012 Panasonic Electronic Components"/>
<attribute name="PURCHASE-URL" value="https://pricing.snapeda.com/search/part/ERJ-P06D2001V/?ref=eda"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="ERJ-P06F1002V">
<packages>
<package name="RESC2012X70N">
<text x="-1.71" y="-1.02" size="0.5" layer="27" align="top-left">&gt;VALUE</text>
<text x="-1.71" y="1.02" size="0.5" layer="25">&gt;NAME</text>
<wire x1="1.1" y1="-0.68" x2="-1.1" y2="-0.68" width="0.127" layer="51"/>
<wire x1="1.1" y1="0.68" x2="-1.1" y2="0.68" width="0.127" layer="51"/>
<wire x1="1.1" y1="-0.68" x2="1.1" y2="0.68" width="0.127" layer="51"/>
<wire x1="-1.1" y1="-0.68" x2="-1.1" y2="0.68" width="0.127" layer="51"/>
<wire x1="-0.1" y1="0.68" x2="0.1" y2="0.68" width="0.127" layer="21"/>
<wire x1="-0.1" y1="-0.68" x2="0.1" y2="-0.68" width="0.127" layer="21"/>
<wire x1="-1.708" y1="-0.94" x2="1.708" y2="-0.94" width="0.05" layer="39"/>
<wire x1="-1.708" y1="0.94" x2="1.708" y2="0.94" width="0.05" layer="39"/>
<wire x1="-1.708" y1="-0.94" x2="-1.708" y2="0.94" width="0.05" layer="39"/>
<wire x1="1.708" y1="-0.94" x2="1.708" y2="0.94" width="0.05" layer="39"/>
<smd name="1" x="-0.94" y="0" dx="1.04" dy="1.38" layer="1"/>
<smd name="2" x="0.94" y="0" dx="1.04" dy="1.38" layer="1"/>
</package>
</packages>
<symbols>
<symbol name="ERJ-P06F1002V">
<text x="-7.624440625" y="2.54148125" size="2.54148125" layer="95">&gt;NAME</text>
<text x="-7.62996875" y="-5.086640625" size="2.54331875" layer="96">&gt;VALUE</text>
<pin name="1" x="-5.08" y="0" visible="off" length="middle" direction="pas"/>
<pin name="2" x="5.08" y="0" visible="off" length="middle" direction="pas" rot="R180"/>
<wire x1="-2.2225" y1="0.9525" x2="2.2225" y2="0.9525" width="0.254" layer="94"/>
<wire x1="2.2225" y1="0.9525" x2="2.2225" y2="-0.9525" width="0.254" layer="94"/>
<wire x1="2.2225" y1="-0.9525" x2="-2.2225" y2="-0.9525" width="0.254" layer="94"/>
<wire x1="-2.2225" y1="-0.9525" x2="-2.2225" y2="0.9525" width="0.254" layer="94"/>
<rectangle x1="-2.2225" y1="-0.9525" x2="2.2225" y2="0.9525" layer="94"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="ERJ-P06F1002V" prefix="R">
<description>Surface Mount Chip Resistor, Thick Film, AEC-Q200 ERJ Series, 10 kohm, 500 mW, 1%, 400 V </description>
<gates>
<gate name="G$1" symbol="ERJ-P06F1002V" x="0" y="0"/>
</gates>
<devices>
<device name="" package="RESC2012X70N">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="DESCRIPTION" value=" 10 kOhms ±1% 0.5W, 1/2W Chip Resistor 0805 (2012 Metric) Automotive AEC-Q200, Pulse Withstanding Thick Film "/>
<attribute name="DIGI-KEY_PART_NUMBER" value="P16059CT-ND"/>
<attribute name="MF" value="Panasonic"/>
<attribute name="MP" value="ERJ-P06F1002V"/>
<attribute name="PACKAGE" value="2012 Panasonic Electronic Components"/>
<attribute name="PURCHASE-URL" value="https://pricing.snapeda.com/search/part/ERJ-P06F1002V/?ref=eda"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="ERJ-P06F3301V">
<packages>
<package name="RESC2012X70N">
<text x="-1.71" y="-1.02" size="0.5" layer="27" align="top-left">&gt;VALUE</text>
<text x="-1.71" y="1.02" size="0.5" layer="25">&gt;NAME</text>
<wire x1="1.1" y1="-0.68" x2="-1.1" y2="-0.68" width="0.127" layer="51"/>
<wire x1="1.1" y1="0.68" x2="-1.1" y2="0.68" width="0.127" layer="51"/>
<wire x1="1.1" y1="-0.68" x2="1.1" y2="0.68" width="0.127" layer="51"/>
<wire x1="-1.1" y1="-0.68" x2="-1.1" y2="0.68" width="0.127" layer="51"/>
<wire x1="-0.1" y1="0.68" x2="0.1" y2="0.68" width="0.127" layer="21"/>
<wire x1="-0.1" y1="-0.68" x2="0.1" y2="-0.68" width="0.127" layer="21"/>
<wire x1="-1.708" y1="-0.94" x2="1.708" y2="-0.94" width="0.05" layer="39"/>
<wire x1="-1.708" y1="0.94" x2="1.708" y2="0.94" width="0.05" layer="39"/>
<wire x1="-1.708" y1="-0.94" x2="-1.708" y2="0.94" width="0.05" layer="39"/>
<wire x1="1.708" y1="-0.94" x2="1.708" y2="0.94" width="0.05" layer="39"/>
<smd name="1" x="-0.94" y="0" dx="1.04" dy="1.38" layer="1"/>
<smd name="2" x="0.94" y="0" dx="1.04" dy="1.38" layer="1"/>
</package>
</packages>
<symbols>
<symbol name="ERJ-P06F3301V">
<text x="-7.624440625" y="2.54148125" size="2.54148125" layer="95">&gt;NAME</text>
<text x="-7.62996875" y="-5.086640625" size="2.54331875" layer="96">&gt;VALUE</text>
<pin name="1" x="-5.08" y="0" visible="off" length="middle" direction="pas"/>
<pin name="2" x="5.08" y="0" visible="off" length="middle" direction="pas" rot="R180"/>
<wire x1="-2.2225" y1="0.9525" x2="2.2225" y2="0.9525" width="0.254" layer="94"/>
<wire x1="2.2225" y1="0.9525" x2="2.2225" y2="-0.9525" width="0.254" layer="94"/>
<wire x1="2.2225" y1="-0.9525" x2="-2.2225" y2="-0.9525" width="0.254" layer="94"/>
<wire x1="-2.2225" y1="-0.9525" x2="-2.2225" y2="0.9525" width="0.254" layer="94"/>
<rectangle x1="-2.2225" y1="-0.9525" x2="2.2225" y2="0.9525" layer="94"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="ERJ-P06F3301V" prefix="R">
<description>Anti-Surge Chip Resistor, 0805 3.3 K ohms, 1.0%, 0 </description>
<gates>
<gate name="G$1" symbol="ERJ-P06F3301V" x="0" y="0"/>
</gates>
<devices>
<device name="" package="RESC2012X70N">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="DESCRIPTION" value=" 3.3 kOhms ±1% 0.5W, 1/2W Chip Resistor 0805 (2012 Metric) Automotive AEC-Q200, Pulse Withstanding Thick Film "/>
<attribute name="DIGI-KEY_PART_NUMBER" value="P16070CT-ND"/>
<attribute name="MF" value="Panasonic"/>
<attribute name="MP" value="ERJ-P06F3301V"/>
<attribute name="PACKAGE" value="2012 Panasonic Electronic Components"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="ERJ-P6WF1202V">
<packages>
<package name="RESC2012X75N">
<text x="-1.71" y="-1.07" size="0.5" layer="27" align="top-left">&gt;VALUE</text>
<text x="-1.71" y="1.07" size="0.5" layer="25">&gt;NAME</text>
<wire x1="1.1" y1="-0.72" x2="-1.1" y2="-0.72" width="0.127" layer="51"/>
<wire x1="1.1" y1="0.72" x2="-1.1" y2="0.72" width="0.127" layer="51"/>
<wire x1="1.1" y1="-0.72" x2="1.1" y2="0.72" width="0.127" layer="51"/>
<wire x1="-1.1" y1="-0.72" x2="-1.1" y2="0.72" width="0.127" layer="51"/>
<wire x1="-0.15" y1="0.72" x2="0.15" y2="0.72" width="0.127" layer="21"/>
<wire x1="-0.15" y1="-0.72" x2="0.15" y2="-0.72" width="0.127" layer="21"/>
<wire x1="-1.708" y1="-0.983" x2="1.708" y2="-0.983" width="0.05" layer="39"/>
<wire x1="-1.708" y1="0.983" x2="1.708" y2="0.983" width="0.05" layer="39"/>
<wire x1="-1.708" y1="-0.983" x2="-1.708" y2="0.983" width="0.05" layer="39"/>
<wire x1="1.708" y1="-0.983" x2="1.708" y2="0.983" width="0.05" layer="39"/>
<smd name="1" x="-0.965" y="0" dx="0.99" dy="1.47" layer="1"/>
<smd name="2" x="0.965" y="0" dx="0.99" dy="1.47" layer="1"/>
</package>
</packages>
<symbols>
<symbol name="ERJ-P6WF1202V">
<text x="-7.624440625" y="2.54148125" size="2.54148125" layer="95">&gt;NAME</text>
<text x="-7.62996875" y="-5.086640625" size="2.54331875" layer="96">&gt;VALUE</text>
<pin name="1" x="-5.08" y="0" visible="off" length="middle" direction="pas"/>
<pin name="2" x="5.08" y="0" visible="off" length="middle" direction="pas" rot="R180"/>
<wire x1="-2.2225" y1="0.9525" x2="2.2225" y2="0.9525" width="0.254" layer="94"/>
<wire x1="2.2225" y1="0.9525" x2="2.2225" y2="-0.9525" width="0.254" layer="94"/>
<wire x1="2.2225" y1="-0.9525" x2="-2.2225" y2="-0.9525" width="0.254" layer="94"/>
<wire x1="-2.2225" y1="-0.9525" x2="-2.2225" y2="0.9525" width="0.254" layer="94"/>
<rectangle x1="-2.2225" y1="-0.9525" x2="2.2225" y2="0.9525" layer="94"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="ERJ-P6WF1202V" prefix="R">
<gates>
<gate name="G$1" symbol="ERJ-P6WF1202V" x="0" y="0"/>
</gates>
<devices>
<device name="" package="RESC2012X75N">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="DESCRIPTION" value=" RES SMD 12K OHM 1% 1/2W 0805 "/>
<attribute name="DIGI-KEY_PART_NUMBER" value="P16898CT-ND"/>
<attribute name="MF" value="Panasonic"/>
<attribute name="MP" value="ERJ-P6WF1202V"/>
<attribute name="PACKAGE" value="2012 Panasonic Electronic Components"/>
<attribute name="PURCHASE-URL" value="https://pricing.snapeda.com/search/part/ERJ-P6WF1202V/?ref=eda"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="ERJ-P14J471U">
<packages>
<package name="RESC3225X70N">
<text x="-2.31" y="-1.7" size="0.5" layer="27" align="top-left">&gt;VALUE</text>
<text x="-2.31" y="1.7" size="0.5" layer="25">&gt;NAME</text>
<wire x1="1.7" y1="-1.35" x2="-1.7" y2="-1.35" width="0.127" layer="51"/>
<wire x1="1.7" y1="1.35" x2="-1.7" y2="1.35" width="0.127" layer="51"/>
<wire x1="1.7" y1="-1.35" x2="1.7" y2="1.35" width="0.127" layer="51"/>
<wire x1="-1.7" y1="-1.35" x2="-1.7" y2="1.35" width="0.127" layer="51"/>
<wire x1="-0.6" y1="1.35" x2="0.6" y2="1.35" width="0.127" layer="21"/>
<wire x1="-0.6" y1="-1.35" x2="0.6" y2="-1.35" width="0.127" layer="21"/>
<wire x1="-2.308" y1="-1.608" x2="2.308" y2="-1.608" width="0.05" layer="39"/>
<wire x1="-2.308" y1="1.608" x2="2.308" y2="1.608" width="0.05" layer="39"/>
<wire x1="-2.308" y1="-1.608" x2="-2.308" y2="1.608" width="0.05" layer="39"/>
<wire x1="2.308" y1="-1.608" x2="2.308" y2="1.608" width="0.05" layer="39"/>
<smd name="1" x="-1.49" y="0" dx="1.14" dy="2.72" layer="1"/>
<smd name="2" x="1.49" y="0" dx="1.14" dy="2.72" layer="1"/>
</package>
</packages>
<symbols>
<symbol name="ERJ-P14J471U">
<text x="-7.624440625" y="2.54148125" size="2.54148125" layer="95">&gt;NAME</text>
<text x="-7.62996875" y="-5.086640625" size="2.54331875" layer="96">&gt;VALUE</text>
<pin name="1" x="-5.08" y="0" visible="off" length="middle" direction="pas"/>
<pin name="2" x="5.08" y="0" visible="off" length="middle" direction="pas" rot="R180"/>
<wire x1="-2.2225" y1="0.9525" x2="2.2225" y2="0.9525" width="0.254" layer="94"/>
<wire x1="2.2225" y1="0.9525" x2="2.2225" y2="-0.9525" width="0.254" layer="94"/>
<wire x1="2.2225" y1="-0.9525" x2="-2.2225" y2="-0.9525" width="0.254" layer="94"/>
<wire x1="-2.2225" y1="-0.9525" x2="-2.2225" y2="0.9525" width="0.254" layer="94"/>
<rectangle x1="-2.2225" y1="-0.9525" x2="2.2225" y2="0.9525" layer="94"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="ERJ-P14J471U" prefix="R">
<gates>
<gate name="G$1" symbol="ERJ-P14J471U" x="0" y="0"/>
</gates>
<devices>
<device name="" package="RESC3225X70N">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="DESCRIPTION" value=" 470 Ohms ±5% 0.5W, 1/2W Chip Resistor 1210 (3225 Metric) Automotive AEC-Q200, Pulse Withstanding Thick Film "/>
<attribute name="DIGI-KEY_PART_NUMBER" value="P470ASCT-ND"/>
<attribute name="MF" value="Panasonic Electronic Components"/>
<attribute name="MP" value="ERJ-P14J471U"/>
<attribute name="PACKAGE" value="3225 Panasonic Electronic Components"/>
<attribute name="PURCHASE-URL" value="https://pricing.snapeda.com/search/part/ERJ-P14J471U/?ref=eda"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="CL05A104KA5NNNC">
<packages>
<package name="CAPC1005X55N">
<wire x1="0.53" y1="0.28" x2="-0.53" y2="0.28" width="0.127" layer="51"/>
<wire x1="-0.53" y1="0.28" x2="-0.53" y2="-0.28" width="0.127" layer="51"/>
<wire x1="-0.53" y1="-0.28" x2="0.53" y2="-0.28" width="0.127" layer="51"/>
<wire x1="0.53" y1="-0.28" x2="0.53" y2="0.28" width="0.127" layer="51"/>
<wire x1="0.5" y1="0.48" x2="-0.5" y2="0.48" width="0.127" layer="21"/>
<wire x1="-0.5" y1="-0.48" x2="0.5" y2="-0.48" width="0.127" layer="21"/>
<wire x1="0.85" y1="0.54" x2="-0.85" y2="0.54" width="0.05" layer="39"/>
<wire x1="-0.85" y1="0.54" x2="-0.85" y2="-0.54" width="0.05" layer="39"/>
<wire x1="-0.85" y1="-0.54" x2="0.85" y2="-0.54" width="0.05" layer="39"/>
<wire x1="0.85" y1="-0.54" x2="0.85" y2="0.54" width="0.05" layer="39"/>
<text x="-0.80619375" y="0.60464375" size="0.30715625" layer="25">&gt;NAME</text>
<text x="-0.80610625" y="-1.007640625" size="0.307128125" layer="27">&gt;VALUE</text>
<smd name="1" x="-0.43" y="0" dx="0.6" dy="0.54" layer="1" roundness="53" rot="R90"/>
<smd name="2" x="0.43" y="0" dx="0.6" dy="0.54" layer="1" roundness="53" rot="R90"/>
</package>
</packages>
<symbols>
<symbol name="CL05A104KA5NNNC">
<text x="0" y="3.81" size="1.778" layer="95">&gt;NAME</text>
<text x="0" y="-5.08" size="1.778" layer="96">&gt;VALUE</text>
<rectangle x1="0" y1="-1.905" x2="0.635" y2="1.905" layer="94"/>
<rectangle x1="1.905" y1="-1.905" x2="2.54" y2="1.905" layer="94"/>
<pin name="1" x="5.08" y="0" visible="pad" length="short" direction="pas" rot="R180"/>
<pin name="2" x="-2.54" y="0" visible="pad" length="short" direction="pas"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="CL05A104KA5NNNC" prefix="C">
<description>Capacitor [Samsung] CL05A104KA5NNNC Capacitor </description>
<gates>
<gate name="G$1" symbol="CL05A104KA5NNNC" x="0" y="0"/>
</gates>
<devices>
<device name="" package="CAPC1005X55N">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="DESCRIPTION" value=" 0.1µF ±10% 25V Ceramic Capacitor X5R 0402 (1005 Metric) "/>
<attribute name="DIGI-KEY_PART_NUMBER" value="1276-1043-1-ND"/>
<attribute name="MF" value="Samsung Electro-Mechanics"/>
<attribute name="MP" value="CL05A104KA5NNNC"/>
<attribute name="PACKAGE" value="0402 Samsung"/>
<attribute name="PURCHASE-URL" value="https://pricing.snapeda.com/search/part/CL05A104KA5NNNC/?ref=eda"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="CL10B102KB8NNNC">
<packages>
<package name="CAPC1608X90N">
<text x="-1.46" y="-0.8" size="0.5" layer="27" align="top-left">&gt;VALUE</text>
<text x="-1.46" y="0.8" size="0.5" layer="25">&gt;NAME</text>
<wire x1="0.85" y1="-0.45" x2="-0.85" y2="-0.45" width="0.127" layer="51"/>
<wire x1="0.85" y1="0.45" x2="-0.85" y2="0.45" width="0.127" layer="51"/>
<wire x1="0.85" y1="-0.45" x2="0.85" y2="0.45" width="0.127" layer="51"/>
<wire x1="-0.85" y1="-0.45" x2="-0.85" y2="0.45" width="0.127" layer="51"/>
<wire x1="-1.465" y1="-0.715" x2="1.465" y2="-0.715" width="0.05" layer="39"/>
<wire x1="-1.465" y1="0.715" x2="1.465" y2="0.715" width="0.05" layer="39"/>
<wire x1="-1.465" y1="-0.715" x2="-1.465" y2="0.715" width="0.05" layer="39"/>
<wire x1="1.465" y1="-0.715" x2="1.465" y2="0.715" width="0.05" layer="39"/>
<smd name="1" x="-0.78" y="0" dx="0.87" dy="0.93" layer="1"/>
<smd name="2" x="0.78" y="0" dx="0.87" dy="0.93" layer="1"/>
</package>
</packages>
<symbols>
<symbol name="CL10B102KB8NNNC">
<text x="0" y="3.81093125" size="1.77843125" layer="95">&gt;NAME</text>
<text x="0" y="-5.08848125" size="1.78096875" layer="96">&gt;VALUE</text>
<rectangle x1="0" y1="-1.906859375" x2="0.635" y2="1.905" layer="94"/>
<rectangle x1="1.90685" y1="-1.90685" x2="2.54" y2="1.905" layer="94"/>
<pin name="2" x="5.08" y="0" visible="pad" length="short" direction="pas" rot="R180"/>
<pin name="1" x="-2.54" y="0" visible="pad" length="short" direction="pas"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="CL10B102KB8NNNC" prefix="C">
<description>Capacitor: ceramic; MLCC; 1nF; 50V; X7R; ±10%; SMD; 0603; -55÷125°C </description>
<gates>
<gate name="G$1" symbol="CL10B102KB8NNNC" x="0" y="0"/>
</gates>
<devices>
<device name="" package="CAPC1608X90N">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="DESCRIPTION" value=" 1000pF ±10% 50V Ceramic Capacitor X7R 0603 (1608 Metric) "/>
<attribute name="DIGI-KEY_PART_NUMBER" value="1276-1018-1-ND"/>
<attribute name="MF" value="Samsung"/>
<attribute name="MP" value="CL10B102KB8NNNC"/>
<attribute name="PACKAGE" value="0603 Samsung"/>
<attribute name="PURCHASE-URL" value="https://pricing.snapeda.com/search/part/CL10B102KB8NNNC/?ref=eda"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="CL21A106KAYNNNE">
<packages>
<package name="CAPC2012X135N">
<text x="-1.66" y="-1.02" size="0.5" layer="27" align="top-left">&gt;VALUE</text>
<text x="-1.66" y="1.02" size="0.5" layer="25">&gt;NAME</text>
<wire x1="1.05" y1="-0.68" x2="-1.05" y2="-0.68" width="0.127" layer="51"/>
<wire x1="1.05" y1="0.68" x2="-1.05" y2="0.68" width="0.127" layer="51"/>
<wire x1="1.05" y1="-0.68" x2="1.05" y2="0.68" width="0.127" layer="51"/>
<wire x1="-1.05" y1="-0.68" x2="-1.05" y2="0.68" width="0.127" layer="51"/>
<wire x1="-1.665" y1="-0.94" x2="1.665" y2="-0.94" width="0.05" layer="39"/>
<wire x1="-1.665" y1="0.94" x2="1.665" y2="0.94" width="0.05" layer="39"/>
<wire x1="-1.665" y1="-0.94" x2="-1.665" y2="0.94" width="0.05" layer="39"/>
<wire x1="1.665" y1="-0.94" x2="1.665" y2="0.94" width="0.05" layer="39"/>
<smd name="1" x="-0.863" y="0" dx="1.1" dy="1.38" layer="1"/>
<smd name="2" x="0.863" y="0" dx="1.1" dy="1.38" layer="1"/>
</package>
</packages>
<symbols>
<symbol name="CL21A106KAYNNNE">
<text x="0" y="3.81093125" size="1.77843125" layer="95">&gt;NAME</text>
<text x="0" y="-5.08848125" size="1.78096875" layer="96">&gt;VALUE</text>
<rectangle x1="0" y1="-1.906859375" x2="0.635" y2="1.905" layer="94"/>
<rectangle x1="1.90685" y1="-1.90685" x2="2.54" y2="1.905" layer="94"/>
<pin name="2" x="5.08" y="0" visible="pad" length="short" direction="pas" rot="R180"/>
<pin name="1" x="-2.54" y="0" visible="pad" length="short" direction="pas"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="CL21A106KAYNNNE" prefix="C">
<description>Cap Ceramic 10uF 25V X5R 10% SMD 0805 85°C Embossed T/R </description>
<gates>
<gate name="G$1" symbol="CL21A106KAYNNNE" x="0" y="0"/>
</gates>
<devices>
<device name="" package="CAPC2012X135N">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="DESCRIPTION" value=" 10µF ±10% 25V Ceramic Capacitor X5R 0805 (2012 Metric) "/>
<attribute name="DIGI-KEY_PART_NUMBER" value="1276-2891-1-ND"/>
<attribute name="MF" value="Samsung Electro-Mechanics"/>
<attribute name="MP" value="CL21A106KAYNNNE"/>
<attribute name="PACKAGE" value="0805 Samsung"/>
<attribute name="PURCHASE-URL" value="https://pricing.snapeda.com/search/part/CL21A106KAYNNNE/?ref=eda"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="ERJ-1GE0R00C">
<packages>
<package name="RESC0603X26N">
<text x="-0.72" y="-0.51" size="0.5" layer="27" align="top-left">&gt;VALUE</text>
<text x="-0.72" y="0.51" size="0.5" layer="25">&gt;NAME</text>
<wire x1="0.32" y1="-0.16" x2="-0.32" y2="-0.16" width="0.127" layer="51"/>
<wire x1="0.32" y1="0.16" x2="-0.32" y2="0.16" width="0.127" layer="51"/>
<wire x1="0.32" y1="-0.16" x2="0.32" y2="0.16" width="0.127" layer="51"/>
<wire x1="-0.32" y1="-0.16" x2="-0.32" y2="0.16" width="0.127" layer="51"/>
<wire x1="-0.718" y1="-0.448" x2="0.718" y2="-0.448" width="0.05" layer="39"/>
<wire x1="-0.718" y1="0.448" x2="0.718" y2="0.448" width="0.05" layer="39"/>
<wire x1="-0.718" y1="-0.448" x2="-0.718" y2="0.448" width="0.05" layer="39"/>
<wire x1="0.718" y1="-0.448" x2="0.718" y2="0.448" width="0.05" layer="39"/>
<smd name="1" x="-0.281" y="0" dx="0.38" dy="0.4" layer="1"/>
<smd name="2" x="0.281" y="0" dx="0.38" dy="0.4" layer="1"/>
</package>
</packages>
<symbols>
<symbol name="ERJ-1GE0R00C">
<text x="-6.671940625" y="1.58898125" size="2.54148125" layer="95">&gt;NAME</text>
<text x="-7.31246875" y="-4.134140625" size="2.54331875" layer="96">&gt;VALUE</text>
<pin name="1" x="-5.08" y="0" visible="off" length="middle" direction="pas"/>
<pin name="2" x="5.08" y="0" visible="off" length="middle" direction="pas" rot="R180"/>
<wire x1="-2.2225" y1="-0.9525" x2="2.2225" y2="-0.9525" width="0.254" layer="94"/>
<wire x1="2.2225" y1="-0.9525" x2="2.2225" y2="0.9525" width="0.254" layer="94"/>
<wire x1="2.2225" y1="0.9525" x2="-2.2225" y2="0.9525" width="0.254" layer="94"/>
<wire x1="-2.2225" y1="0.9525" x2="-2.2225" y2="-0.9525" width="0.254" layer="94"/>
<rectangle x1="-2.2225" y1="-0.9525" x2="2.2225" y2="0.9525" layer="94"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="ERJ-1GE0R00C" prefix="R">
<description>Res Thick Film 0201 0 Ohm Molded SMD Pressed Carrier T/R </description>
<gates>
<gate name="G$1" symbol="ERJ-1GE0R00C" x="0" y="0"/>
</gates>
<devices>
<device name="" package="RESC0603X26N">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="DESCRIPTION" value=" 0 Ohms Jumper 0.05W, 1/20W Chip Resistor 0201 (0603 Metric) Thick Film "/>
<attribute name="DIGI-KEY_PART_NUMBER" value="P0.0AGCT-ND"/>
<attribute name="MF" value="Panasonic Electronic"/>
<attribute name="MP" value="ERJ-1GE0R00C"/>
<attribute name="PACKAGE" value="0603 Rohm Semiconductor"/>
<attribute name="PURCHASE-URL" value="https://pricing.snapeda.com/search/part/ERJ-1GE0R00C/?ref=eda"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="CL10A226MQ8NRNC">
<packages>
<package name="CAPC1608X90N">
<text x="-1.46" y="-0.8" size="0.5" layer="27" align="top-left">&gt;VALUE</text>
<text x="-1.46" y="0.8" size="0.5" layer="25">&gt;NAME</text>
<wire x1="0.85" y1="-0.45" x2="-0.85" y2="-0.45" width="0.127" layer="51"/>
<wire x1="0.85" y1="0.45" x2="-0.85" y2="0.45" width="0.127" layer="51"/>
<wire x1="0.85" y1="-0.45" x2="0.85" y2="0.45" width="0.127" layer="51"/>
<wire x1="-0.85" y1="-0.45" x2="-0.85" y2="0.45" width="0.127" layer="51"/>
<wire x1="-1.465" y1="-0.7" x2="1.465" y2="-0.7" width="0.05" layer="39"/>
<wire x1="-1.465" y1="0.7" x2="1.465" y2="0.7" width="0.05" layer="39"/>
<wire x1="-1.465" y1="-0.7" x2="-1.465" y2="0.7" width="0.05" layer="39"/>
<wire x1="1.465" y1="-0.7" x2="1.465" y2="0.7" width="0.05" layer="39"/>
<smd name="1" x="-0.78" y="0" dx="0.87" dy="0.93" layer="1"/>
<smd name="2" x="0.78" y="0" dx="0.87" dy="0.93" layer="1"/>
</package>
</packages>
<symbols>
<symbol name="CL10A226MQ8NRNC">
<text x="0" y="3.81" size="1.778" layer="95">&gt;NAME</text>
<text x="0" y="-5.08" size="1.778" layer="96">&gt;VALUE</text>
<rectangle x1="0" y1="-1.905" x2="0.635" y2="1.905" layer="94"/>
<rectangle x1="1.905" y1="-1.905" x2="2.54" y2="1.905" layer="94"/>
<pin name="1" x="5.08" y="0" visible="pad" length="short" direction="pas" rot="R180"/>
<pin name="2" x="-2.54" y="0" visible="pad" length="short" direction="pas"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="CL10A226MQ8NRNC" prefix="C">
<description>Cap Ceramic 22uF 6.3V X5R 20% SMD 0603 85°C Cardboard T/R </description>
<gates>
<gate name="G$1" symbol="CL10A226MQ8NRNC" x="0" y="0"/>
</gates>
<devices>
<device name="" package="CAPC1608X90N">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="DESCRIPTION" value=" 22µF ±20% 6.3V Ceramic Capacitor X5R 0603 (1608 Metric) "/>
<attribute name="DIGI-KEY_PART_NUMBER" value="1276-1193-1-ND"/>
<attribute name="MF" value="Samsung Electro-Mechanics"/>
<attribute name="MP" value="CL10A226MQ8NRNC"/>
<attribute name="PACKAGE" value="0603 Samsung"/>
<attribute name="PURCHASE-URL" value="https://pricing.snapeda.com/search/part/CL10A226MQ8NRNC/?ref=eda"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="ERA-3AEB472V">
<packages>
<package name="RESC1608X55N">
<text x="-1.51" y="-0.85" size="0.5" layer="27" align="top-left">&gt;VALUE</text>
<text x="-1.51" y="0.85" size="0.5" layer="25">&gt;NAME</text>
<wire x1="0.9" y1="-0.5" x2="-0.9" y2="-0.5" width="0.127" layer="51"/>
<wire x1="0.9" y1="0.5" x2="-0.9" y2="0.5" width="0.127" layer="51"/>
<wire x1="0.9" y1="-0.5" x2="0.9" y2="0.5" width="0.127" layer="51"/>
<wire x1="-0.9" y1="-0.5" x2="-0.9" y2="0.5" width="0.127" layer="51"/>
<wire x1="-1.508" y1="-0.758" x2="1.508" y2="-0.758" width="0.05" layer="39"/>
<wire x1="-1.508" y1="0.758" x2="1.508" y2="0.758" width="0.05" layer="39"/>
<wire x1="-1.508" y1="-0.758" x2="-1.508" y2="0.758" width="0.05" layer="39"/>
<wire x1="1.508" y1="-0.758" x2="1.508" y2="0.758" width="0.05" layer="39"/>
<smd name="1" x="-0.79" y="0" dx="0.94" dy="1.02" layer="1"/>
<smd name="2" x="0.79" y="0" dx="0.94" dy="1.02" layer="1"/>
</package>
</packages>
<symbols>
<symbol name="ERA-3AEB472V">
<text x="-6.354440625" y="2.54148125" size="1.778" layer="95">&gt;NAME</text>
<text x="-5.08996875" y="-3.816640625" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-5.08" y="0" visible="off" length="middle" direction="pas"/>
<pin name="2" x="5.08" y="0" visible="off" length="middle" direction="pas" rot="R180"/>
<wire x1="-2.2225" y1="0.9525" x2="2.2225" y2="0.9525" width="0.254" layer="94"/>
<wire x1="2.2225" y1="0.9525" x2="2.2225" y2="-0.9525" width="0.254" layer="94"/>
<wire x1="2.2225" y1="-0.9525" x2="-2.2225" y2="-0.9525" width="0.254" layer="94"/>
<wire x1="-2.2225" y1="-0.9525" x2="-2.2225" y2="0.9525" width="0.254" layer="94"/>
<rectangle x1="-2.2225" y1="-0.9525" x2="2.2225" y2="0.9525" layer="94"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="ERA-3AEB472V" prefix="R">
<description>Resistor;Metal Film;Res 4.7 Kilohms;Pwr-Rtg 0.1 W;Tol 0.1%;SMT;0603;Tape &amp; Reel </description>
<gates>
<gate name="G$1" symbol="ERA-3AEB472V" x="0" y="0"/>
</gates>
<devices>
<device name="" package="RESC1608X55N">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="DESCRIPTION" value=" 4.7 kOhms ±0.1% 0.1W, 1/10W Chip Resistor 0603 (1608 Metric) Automotive AEC-Q200 Thin Film "/>
<attribute name="DIGI-KEY_PART_NUMBER" value="P4.7KDBCT-ND"/>
<attribute name="MF" value="Panasonic"/>
<attribute name="MP" value="ERA-3AEB472V"/>
<attribute name="PACKAGE" value="1608 Panasonic Electronic Components"/>
<attribute name="PURCHASE-URL" value="https://pricing.snapeda.com/search/part/ERA-3AEB472V/?ref=eda"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="MIC5504-1.8YM5-TR">
<packages>
<package name="SOT23-5P95_280X145XL45X37N">
<wire x1="-0.8" y1="1.45" x2="-0.8" y2="-1.45" width="0.127" layer="51"/>
<wire x1="0.8" y1="-1.45" x2="0.8" y2="1.45" width="0.127" layer="51"/>
<wire x1="1.91" y1="1.7" x2="-1.91" y2="1.7" width="0.05" layer="39"/>
<wire x1="-1.91" y1="1.7" x2="-1.91" y2="-1.7" width="0.05" layer="39"/>
<wire x1="-1.91" y1="-1.7" x2="1.91" y2="-1.7" width="0.05" layer="39"/>
<wire x1="1.91" y1="-1.7" x2="1.91" y2="1.7" width="0.05" layer="39"/>
<circle x="-1.7" y="1.5" radius="0.13" width="0" layer="21"/>
<text x="-1.350540625" y="1.80071875" size="0.60984375" layer="25">&gt;NAME</text>
<text x="-1.55005" y="-2.50008125" size="0.60961875" layer="27">&gt;VALUE</text>
<smd name="1" x="-1.14" y="0.95" dx="0.6" dy="1.14" layer="1" roundness="53" rot="R90"/>
<smd name="2" x="-1.14" y="0" dx="0.6" dy="1.14" layer="1" roundness="53" rot="R90"/>
<smd name="3" x="-1.14" y="-0.95" dx="0.6" dy="1.14" layer="1" roundness="53" rot="R90"/>
<smd name="4" x="1.14" y="-0.95" dx="0.6" dy="1.14" layer="1" roundness="53" rot="R90"/>
<smd name="5" x="1.14" y="0.95" dx="0.6" dy="1.14" layer="1" roundness="53" rot="R90"/>
</package>
</packages>
<symbols>
<symbol name="MIC5504-1.8YM5-TR">
<wire x1="-7.62" y1="7.62" x2="-7.62" y2="-7.62" width="0.254" layer="94"/>
<wire x1="-7.62" y1="-7.62" x2="7.62" y2="-7.62" width="0.254" layer="94"/>
<wire x1="7.62" y1="-7.62" x2="7.62" y2="7.62" width="0.254" layer="94"/>
<wire x1="7.62" y1="7.62" x2="-7.62" y2="7.62" width="0.254" layer="94"/>
<text x="-7.6301" y="8.13876875" size="1.780359375" layer="95">&gt;NAME</text>
<text x="-7.62083125" y="-10.1611" size="1.778190625" layer="96">&gt;VALUE</text>
<pin name="VIN" x="10.16" y="5.08" length="short" direction="pwr" rot="R180"/>
<pin name="GND" x="10.16" y="-5.08" length="short" direction="pwr" rot="R180"/>
<pin name="EN" x="-10.16" y="5.08" length="short" direction="in"/>
<pin name="VOUT" x="10.16" y="0" length="short" direction="out" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="MIC5504-1.8YM5-TR" prefix="U">
<description>Single 300mA LDO with Enable Pull-Down &amp; Auto Discharge, 5 SOT-23 T/R &lt;a href="https://pricing.snapeda.com/parts/MIC5504-1.8YM5-TR/Microchip%20Technology%20/%20Micrel/view-part?ref=eda"&gt;Check prices&lt;/a&gt;</description>
<gates>
<gate name="G$1" symbol="MIC5504-1.8YM5-TR" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SOT23-5P95_280X145XL45X37N">
<connects>
<connect gate="G$1" pin="EN" pad="3"/>
<connect gate="G$1" pin="GND" pad="2"/>
<connect gate="G$1" pin="VIN" pad="1"/>
<connect gate="G$1" pin="VOUT" pad="5"/>
</connects>
<technologies>
<technology name="">
<attribute name="AVAILABILITY" value="Good"/>
<attribute name="DESCRIPTION" value=" LDO Voltage Regulators Single 300mA LDO with Enable Pull-Down &amp; Auto Discharge "/>
<attribute name="MF" value="Microchip Technology / Micrel"/>
<attribute name="MP" value="MIC5504-1.8YM5-TR"/>
<attribute name="PACKAGE" value="None"/>
<attribute name="PRICE" value="None"/>
<attribute name="PURCHASE-URL" value="https://pricing.snapeda.com/search/part/MIC5504-1.8YM5-TR/?ref=eda"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="PCA9306USG">
<packages>
<package name="SOP50P310X90-8N">
<circle x="-2.525" y="1.02" radius="0.1" width="0.2" layer="21"/>
<circle x="-2.525" y="1.02" radius="0.1" width="0.2" layer="51"/>
<wire x1="-1.15" y1="1" x2="1.15" y2="1" width="0.127" layer="51"/>
<wire x1="-1.15" y1="-1" x2="1.15" y2="-1" width="0.127" layer="51"/>
<wire x1="-1.15" y1="1.205" x2="1.15" y2="1.205" width="0.127" layer="21"/>
<wire x1="-1.15" y1="-1.205" x2="1.15" y2="-1.205" width="0.127" layer="21"/>
<wire x1="-1.15" y1="1" x2="-1.15" y2="-1" width="0.127" layer="51"/>
<wire x1="1.15" y1="1" x2="1.15" y2="-1" width="0.127" layer="51"/>
<wire x1="-2.215" y1="1.25" x2="2.215" y2="1.25" width="0.05" layer="39"/>
<wire x1="-2.215" y1="-1.25" x2="2.215" y2="-1.25" width="0.05" layer="39"/>
<wire x1="-2.215" y1="1.25" x2="-2.215" y2="-1.25" width="0.05" layer="39"/>
<wire x1="2.215" y1="1.25" x2="2.215" y2="-1.25" width="0.05" layer="39"/>
<text x="-2.32" y="-1.382" size="1.016" layer="27" align="top-left">&gt;VALUE</text>
<text x="-2.32" y="1.382" size="1.016" layer="25">&gt;NAME</text>
<smd name="1" x="-1.405" y="0.75" dx="1.12" dy="0.27" layer="1" roundness="25"/>
<smd name="2" x="-1.405" y="0.25" dx="1.12" dy="0.27" layer="1" roundness="25"/>
<smd name="3" x="-1.405" y="-0.25" dx="1.12" dy="0.27" layer="1" roundness="25"/>
<smd name="4" x="-1.405" y="-0.75" dx="1.12" dy="0.27" layer="1" roundness="25"/>
<smd name="5" x="1.405" y="-0.75" dx="1.12" dy="0.27" layer="1" roundness="25"/>
<smd name="6" x="1.405" y="-0.25" dx="1.12" dy="0.27" layer="1" roundness="25"/>
<smd name="7" x="1.405" y="0.25" dx="1.12" dy="0.27" layer="1" roundness="25"/>
<smd name="8" x="1.405" y="0.75" dx="1.12" dy="0.27" layer="1" roundness="25"/>
</package>
</packages>
<symbols>
<symbol name="PCA9306USG">
<text x="-10.16" y="13.97" size="1.778" layer="95">&gt;NAME</text>
<text x="-10.16" y="-13.97" size="1.778" layer="96" align="top-left">&gt;VALUE</text>
<wire x1="-10.16" y1="12.7" x2="-10.16" y2="-12.7" width="0.254" layer="94"/>
<wire x1="-10.16" y1="-12.7" x2="10.16" y2="-12.7" width="0.254" layer="94"/>
<wire x1="10.16" y1="-12.7" x2="10.16" y2="12.7" width="0.254" layer="94"/>
<wire x1="10.16" y1="12.7" x2="-10.16" y2="12.7" width="0.254" layer="94"/>
<pin name="GND" x="15.24" y="-10.16" length="middle" direction="pwr" rot="R180"/>
<pin name="VREF1" x="-15.24" y="10.16" length="middle" direction="in"/>
<pin name="SDA1" x="-15.24" y="-5.08" length="middle"/>
<pin name="SCL1" x="-15.24" y="-2.54" length="middle" direction="in" function="clk"/>
<pin name="SDA2" x="15.24" y="-5.08" length="middle" rot="R180"/>
<pin name="SCL2" x="15.24" y="-2.54" length="middle" direction="in" function="clk" rot="R180"/>
<pin name="VREF2" x="-15.24" y="7.62" length="middle" direction="in"/>
<pin name="EN" x="-15.24" y="2.54" length="middle" direction="in"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="PCA9306USG" prefix="U">
<description>Voltage Level Translator Bidirectional 1 Circuit 2 Channel US8  </description>
<gates>
<gate name="G$1" symbol="PCA9306USG" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SOP50P310X90-8N">
<connects>
<connect gate="G$1" pin="EN" pad="8"/>
<connect gate="G$1" pin="GND" pad="1"/>
<connect gate="G$1" pin="SCL1" pad="3"/>
<connect gate="G$1" pin="SCL2" pad="6"/>
<connect gate="G$1" pin="SDA1" pad="4"/>
<connect gate="G$1" pin="SDA2" pad="5"/>
<connect gate="G$1" pin="VREF1" pad="2"/>
<connect gate="G$1" pin="VREF2" pad="7"/>
</connects>
<technologies>
<technology name="">
<attribute name="DESCRIPTION" value=" Voltage Level Translator Bidirectional 1 Circuit 2 Channel US8 "/>
<attribute name="DIGI-KEY_PART_NUMBER" value="PCA9306USGOSCT-ND"/>
<attribute name="MF" value="ON Semiconductor"/>
<attribute name="MP" value="PCA9306USG"/>
<attribute name="PACKAGE" value="VFSOP-8 ON Semiconductor"/>
<attribute name="PURCHASE-URL" value="https://pricing.snapeda.com/search/part/PCA9306USG/?ref=eda"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="SGP30">
<packages>
<package name="SGP30">
<wire x1="-1.225" y1="1.225" x2="-1.225" y2="-1.225" width="0.127" layer="21"/>
<wire x1="-1.225" y1="-1.225" x2="1.225" y2="-1.225" width="0.127" layer="21"/>
<wire x1="1.225" y1="-1.225" x2="1.225" y2="1.225" width="0.127" layer="21"/>
<wire x1="1.225" y1="1.225" x2="-1.225" y2="1.225" width="0.127" layer="21"/>
<text x="-1.225" y="-2.54" size="0.6096" layer="25">&gt;NAME</text>
<circle x="-1.5" y="1.5" radius="0.15" width="0" layer="21"/>
<smd name="1" x="-1.26" y="0.8" dx="0.55" dy="0.4" layer="1"/>
<smd name="2" x="-1.26" y="0" dx="0.55" dy="0.4" layer="1"/>
<smd name="3" x="-1.26" y="-0.8" dx="0.55" dy="0.4" layer="1"/>
<smd name="4" x="1.26" y="-0.8" dx="0.55" dy="0.4" layer="1"/>
<smd name="5" x="1.26" y="0" dx="0.55" dy="0.4" layer="1"/>
<smd name="6" x="1.26" y="0.8" dx="0.55" dy="0.4" layer="1"/>
<smd name="P$7" x="0" y="0" dx="0.9" dy="1.4" layer="1"/>
</package>
</packages>
<symbols>
<symbol name="SGP30">
<wire x1="-2.54" y1="17.78" x2="-2.54" y2="-5.08" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-5.08" x2="7.62" y2="-5.08" width="0.254" layer="94"/>
<wire x1="7.62" y1="-5.08" x2="7.62" y2="17.78" width="0.254" layer="94"/>
<wire x1="7.62" y1="17.78" x2="-2.54" y2="17.78" width="0.254" layer="94"/>
<text x="-2.54" y="-7.62" size="1.6764" layer="125">&gt;NAME</text>
<text x="-2.54" y="-10.16" size="1.6764" layer="96">&gt;VALUE</text>
<pin name="VDD" x="-7.62" y="12.7" length="middle"/>
<pin name="GND" x="-7.62" y="10.16" length="middle"/>
<pin name="SDA" x="-7.62" y="7.62" length="middle"/>
<pin name="R" x="-7.62" y="5.08" length="middle"/>
<pin name="VDDH" x="-7.62" y="2.54" length="middle"/>
<pin name="SCL" x="-7.62" y="0" length="middle"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="SGP30">
<description> &lt;a href="https://pricing.snapeda.com/parts/SGP30/Sensirion%20AG/view-part?ref=eda"&gt;Check prices&lt;/a&gt;</description>
<gates>
<gate name="G$1" symbol="SGP30" x="0" y="-7.62"/>
</gates>
<devices>
<device name="SGP30" package="SGP30">
<connects>
<connect gate="G$1" pin="GND" pad="2"/>
<connect gate="G$1" pin="R" pad="4"/>
<connect gate="G$1" pin="SCL" pad="6"/>
<connect gate="G$1" pin="SDA" pad="3"/>
<connect gate="G$1" pin="VDD" pad="1"/>
<connect gate="G$1" pin="VDDH" pad="5"/>
</connects>
<technologies>
<technology name="">
<attribute name="AVAILABILITY" value="In Stock"/>
<attribute name="DESCRIPTION" value=" AIR QUALITY GAS SENSOR FOR VOC'S "/>
<attribute name="MF" value="Sensirion AG"/>
<attribute name="MP" value="SGP30"/>
<attribute name="PACKAGE" value="None"/>
<attribute name="PRICE" value="None"/>
<attribute name="PURCHASE-URL" value="https://pricing.snapeda.com/search/part/SGP30/?ref=eda"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="DPS310XTSA1">
<packages>
<package name="XDCR_DPS310XTSA1">
<wire x1="1" y1="1.47" x2="-1" y2="1.47" width="0.127" layer="21"/>
<wire x1="-1" y1="1.25" x2="-1" y2="-1.25" width="0.127" layer="51"/>
<wire x1="-1" y1="-1.47" x2="1" y2="-1.47" width="0.127" layer="21"/>
<wire x1="1" y1="-1.25" x2="1" y2="1.25" width="0.127" layer="51"/>
<wire x1="1.25" y1="1.5" x2="-1.25" y2="1.5" width="0.05" layer="39"/>
<wire x1="-1.25" y1="1.5" x2="-1.25" y2="-1.5" width="0.05" layer="39"/>
<wire x1="-1.25" y1="-1.5" x2="1.25" y2="-1.5" width="0.05" layer="39"/>
<wire x1="1.25" y1="-1.5" x2="1.25" y2="1.5" width="0.05" layer="39"/>
<circle x="1.52" y="1.1" radius="0.08" width="0.16" layer="21"/>
<text x="-2" y="1.7" size="0.8128" layer="25">&gt;NAME</text>
<text x="-2" y="-1.7" size="0.8128" layer="27" align="top-left">&gt;VALUE</text>
<wire x1="1" y1="-1.25" x2="-1" y2="-1.25" width="0.127" layer="51"/>
<wire x1="-1" y1="1.25" x2="1" y2="1.25" width="0.127" layer="51"/>
<circle x="1.52" y="1.1" radius="0.08" width="0.16" layer="51"/>
<circle x="-0.725" y="0.975" radius="0.0875" width="0.175" layer="31"/>
<circle x="-0.725" y="0.325" radius="0.0875" width="0.175" layer="31"/>
<circle x="-0.725" y="-0.325" radius="0.0875" width="0.175" layer="31"/>
<circle x="-0.725" y="-0.975" radius="0.0875" width="0.175" layer="31"/>
<circle x="0.725" y="0.975" radius="0.0875" width="0.175" layer="31"/>
<circle x="0.725" y="0.325" radius="0.0875" width="0.175" layer="31"/>
<circle x="0.725" y="-0.325" radius="0.0875" width="0.175" layer="31"/>
<circle x="0.725" y="-0.975" radius="0.0875" width="0.175" layer="31"/>
<smd name="1" x="0.725" y="0.975" dx="0.35" dy="0.35" layer="1" cream="no"/>
<smd name="2" x="0.725" y="0.325" dx="0.35" dy="0.35" layer="1" cream="no"/>
<smd name="3" x="0.725" y="-0.325" dx="0.35" dy="0.35" layer="1" cream="no"/>
<smd name="4" x="0.725" y="-0.975" dx="0.35" dy="0.35" layer="1" cream="no"/>
<smd name="5" x="-0.725" y="-0.975" dx="0.35" dy="0.35" layer="1" cream="no"/>
<smd name="6" x="-0.725" y="-0.325" dx="0.35" dy="0.35" layer="1" cream="no"/>
<smd name="7" x="-0.725" y="0.325" dx="0.35" dy="0.35" layer="1" cream="no"/>
<smd name="8" x="-0.725" y="0.975" dx="0.35" dy="0.35" layer="1" cream="no"/>
</package>
</packages>
<symbols>
<symbol name="DPS310XTSA1">
<wire x1="-10.16" y1="12.7" x2="-10.16" y2="-12.7" width="0.254" layer="94"/>
<wire x1="-10.16" y1="-12.7" x2="10.16" y2="-12.7" width="0.254" layer="94"/>
<wire x1="10.16" y1="-12.7" x2="10.16" y2="12.7" width="0.254" layer="94"/>
<wire x1="10.16" y1="12.7" x2="-10.16" y2="12.7" width="0.254" layer="94"/>
<text x="-10.16" y="13.97" size="1.778" layer="95">&gt;NAME</text>
<text x="-10.16" y="-13.97" size="1.778" layer="96" align="top-left">&gt;VALUE</text>
<pin name="GND" x="15.24" y="-10.16" length="middle" direction="pwr" rot="R180"/>
<pin name="!CSB" x="-15.24" y="2.54" length="middle" direction="in"/>
<pin name="SDI" x="-15.24" y="-2.54" length="middle"/>
<pin name="SCK" x="-15.24" y="0" length="middle" direction="in" function="clk"/>
<pin name="SDO" x="-15.24" y="-5.08" length="middle" direction="out"/>
<pin name="VDDIO" x="15.24" y="7.62" length="middle" direction="pwr" rot="R180"/>
<pin name="VDD" x="15.24" y="10.16" length="middle" direction="pwr" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="DPS310XTSA1" prefix="U">
<description>Pressure Sensor 0.3kPa to 1.2kPa Absolute 8-Pin LGA </description>
<gates>
<gate name="G$1" symbol="DPS310XTSA1" x="0" y="0"/>
</gates>
<devices>
<device name="" package="XDCR_DPS310XTSA1">
<connects>
<connect gate="G$1" pin="!CSB" pad="2"/>
<connect gate="G$1" pin="GND" pad="1 7"/>
<connect gate="G$1" pin="SCK" pad="4"/>
<connect gate="G$1" pin="SDI" pad="3"/>
<connect gate="G$1" pin="SDO" pad="5"/>
<connect gate="G$1" pin="VDD" pad="8"/>
<connect gate="G$1" pin="VDDIO" pad="6"/>
</connects>
<technologies>
<technology name="">
<attribute name="DESCRIPTION" value=" Supply voltage range 1.7V to 3.6V | Operation range 300hPa 1200hPa | Sensors precision 0.005hPa | Relative accuracy 0.06hPa | Pressure temperature sensitivity of 0.5Pa/K | Temperature accuracy 0.5C "/>
<attribute name="DIGI-KEY_PART_NUMBER" value="DPS310XTSA1CT-ND"/>
<attribute name="MF" value="Infineon"/>
<attribute name="MP" value="DPS310XTSA1"/>
<attribute name="PACKAGE" value="LGA-8 Infineon"/>
<attribute name="PURCHASE-URL" value="https://pricing.snapeda.com/search/part/DPS310XTSA1/?ref=eda"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="SHTC1">
<packages>
<package name="XDCR_SHTC1">
<circle x="-1.78" y="0.5" radius="0.1" width="0.2" layer="21"/>
<circle x="-1.78" y="0.5" radius="0.1" width="0.2" layer="51"/>
<wire x1="-1" y1="1" x2="1" y2="1" width="0.1" layer="51"/>
<wire x1="-1" y1="-1" x2="1" y2="-1" width="0.1" layer="51"/>
<wire x1="-1" y1="1" x2="1" y2="1" width="0.1" layer="21"/>
<wire x1="-1" y1="-1" x2="1" y2="-1" width="0.1" layer="21"/>
<wire x1="-1" y1="1" x2="-1" y2="-1" width="0.1" layer="51"/>
<wire x1="1" y1="1" x2="1" y2="-1" width="0.1" layer="51"/>
<wire x1="-1.45" y1="1.25" x2="1.45" y2="1.25" width="0.05" layer="39"/>
<wire x1="-1.45" y1="-1.25" x2="1.45" y2="-1.25" width="0.05" layer="39"/>
<wire x1="-1.45" y1="1.25" x2="-1.45" y2="-1.25" width="0.05" layer="39"/>
<wire x1="1.45" y1="1.25" x2="1.45" y2="-1.25" width="0.05" layer="39"/>
<text x="-1.77" y="-1.5" size="1.016" layer="27" align="top-left">&gt;VALUE</text>
<text x="-1.77" y="1.5" size="1.016" layer="25">&gt;NAME</text>
<rectangle x1="-0.25" y1="-0.7" x2="0.25" y2="0.7" layer="31"/>
<rectangle x1="-1.2" y1="0.325" x2="-0.75" y2="0.675" layer="31"/>
<rectangle x1="-1.2" y1="-0.675" x2="-0.75" y2="-0.325" layer="31"/>
<rectangle x1="0.75" y1="0.325" x2="1.2" y2="0.675" layer="31"/>
<rectangle x1="0.75" y1="-0.675" x2="1.2" y2="-0.325" layer="31"/>
<rectangle x1="-1.25" y1="0.275" x2="-0.6" y2="0.725" layer="29"/>
<rectangle x1="-1.25" y1="-0.725" x2="-0.6" y2="-0.275" layer="29"/>
<rectangle x1="0.6" y1="0.275" x2="1.25" y2="0.725" layer="29"/>
<rectangle x1="0.6" y1="-0.725" x2="1.25" y2="-0.275" layer="29"/>
<rectangle x1="-0.4" y1="-0.85" x2="0.4" y2="0.85" layer="29"/>
<smd name="1" x="-0.925" y="0.5" dx="0.55" dy="0.35" layer="1" stop="no" cream="no"/>
<smd name="2" x="-0.925" y="-0.5" dx="0.55" dy="0.35" layer="1" stop="no" cream="no"/>
<smd name="3" x="0.925" y="-0.5" dx="0.55" dy="0.35" layer="1" stop="no" cream="no"/>
<smd name="4" x="0.925" y="0.5" dx="0.55" dy="0.35" layer="1" stop="no" cream="no"/>
<smd name="5" x="0" y="0" dx="0.7" dy="1.6" layer="1" stop="no" cream="no"/>
</package>
</packages>
<symbols>
<symbol name="SHTC1">
<wire x1="-10.16" y1="7.62" x2="10.16" y2="7.62" width="0.254" layer="94"/>
<wire x1="10.16" y1="7.62" x2="10.16" y2="-7.62" width="0.254" layer="94"/>
<wire x1="10.16" y1="-7.62" x2="-10.16" y2="-7.62" width="0.254" layer="94"/>
<wire x1="-10.16" y1="-7.62" x2="-10.16" y2="7.62" width="0.254" layer="94"/>
<text x="-10.16" y="8.255" size="2.54" layer="95">&gt;NAME</text>
<text x="-10.16" y="-8.255" size="2.54" layer="96" rot="MR180">&gt;VALUE</text>
<pin name="VDD" x="15.24" y="5.08" length="middle" direction="pwr" rot="R180"/>
<pin name="SDA" x="-15.24" y="0" length="middle"/>
<pin name="SCL" x="-15.24" y="5.08" length="middle" function="clk"/>
<pin name="VSS" x="15.24" y="-5.08" length="middle" direction="pwr" rot="R180"/>
<pin name="EXP" x="15.24" y="-2.54" length="middle" direction="pas" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="SHTC1" prefix="U">
<description>SENSOR HUMI/TEMP 1.8V I2C 3% SMD </description>
<gates>
<gate name="G$1" symbol="SHTC1" x="0" y="0"/>
</gates>
<devices>
<device name="" package="XDCR_SHTC1">
<connects>
<connect gate="G$1" pin="EXP" pad="5"/>
<connect gate="G$1" pin="SCL" pad="2"/>
<connect gate="G$1" pin="SDA" pad="3"/>
<connect gate="G$1" pin="VDD" pad="1"/>
<connect gate="G$1" pin="VSS" pad="4"/>
</connects>
<technologies>
<technology name="">
<attribute name="DESCRIPTION" value=" SENSOR HUMI/TEMP 1.8V I2C 3% SMD "/>
<attribute name="DIGI-KEY_PART_NUMBER" value="1649-1015-1-ND"/>
<attribute name="MF" value="Sensirion AG"/>
<attribute name="MP" value="SHTC1"/>
<attribute name="PACKAGE" value="DFN-4 Sensirion"/>
<attribute name="PURCHASE-URL" value="https://pricing.snapeda.com/search/part/SHTC1/?ref=eda"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="ERJ-P6WF2202V">
<packages>
<package name="RESC2012X75N">
<text x="-1.71" y="-1.07" size="0.5" layer="27" align="top-left">&gt;VALUE</text>
<text x="-1.71" y="1.07" size="0.5" layer="25">&gt;NAME</text>
<wire x1="1.1" y1="-0.72" x2="-1.1" y2="-0.72" width="0.127" layer="51"/>
<wire x1="1.1" y1="0.72" x2="-1.1" y2="0.72" width="0.127" layer="51"/>
<wire x1="1.1" y1="-0.72" x2="1.1" y2="0.72" width="0.127" layer="51"/>
<wire x1="-1.1" y1="-0.72" x2="-1.1" y2="0.72" width="0.127" layer="51"/>
<wire x1="-0.15" y1="0.72" x2="0.15" y2="0.72" width="0.127" layer="21"/>
<wire x1="-0.15" y1="-0.72" x2="0.15" y2="-0.72" width="0.127" layer="21"/>
<wire x1="-1.708" y1="-0.983" x2="1.708" y2="-0.983" width="0.05" layer="39"/>
<wire x1="-1.708" y1="0.983" x2="1.708" y2="0.983" width="0.05" layer="39"/>
<wire x1="-1.708" y1="-0.983" x2="-1.708" y2="0.983" width="0.05" layer="39"/>
<wire x1="1.708" y1="-0.983" x2="1.708" y2="0.983" width="0.05" layer="39"/>
<smd name="1" x="-0.965" y="0" dx="0.99" dy="1.47" layer="1"/>
<smd name="2" x="0.965" y="0" dx="0.99" dy="1.47" layer="1"/>
</package>
</packages>
<symbols>
<symbol name="ERJ-P6WF2202V">
<text x="-7.624440625" y="2.54148125" size="2.54148125" layer="95">&gt;NAME</text>
<text x="-7.62996875" y="-5.086640625" size="2.54331875" layer="96">&gt;VALUE</text>
<pin name="1" x="-5.08" y="0" visible="off" length="middle" direction="pas"/>
<pin name="2" x="5.08" y="0" visible="off" length="middle" direction="pas" rot="R180"/>
<wire x1="-2.2225" y1="0.9525" x2="2.2225" y2="0.9525" width="0.254" layer="94"/>
<wire x1="2.2225" y1="0.9525" x2="2.2225" y2="-0.9525" width="0.254" layer="94"/>
<wire x1="2.2225" y1="-0.9525" x2="-2.2225" y2="-0.9525" width="0.254" layer="94"/>
<wire x1="-2.2225" y1="-0.9525" x2="-2.2225" y2="0.9525" width="0.254" layer="94"/>
<rectangle x1="-2.2225" y1="-0.9525" x2="2.2225" y2="0.9525" layer="94"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="ERJ-P6WF2202V" prefix="R">
<gates>
<gate name="G$1" symbol="ERJ-P6WF2202V" x="0" y="0"/>
</gates>
<devices>
<device name="" package="RESC2012X75N">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="DESCRIPTION" value=" RES SMD 22K OHM 1% 1/2W 0805 "/>
<attribute name="DIGI-KEY_PART_NUMBER" value="P16901CT-ND"/>
<attribute name="MF" value="Panasonic"/>
<attribute name="MP" value="ERJ-P6WF2202V"/>
<attribute name="PACKAGE" value="2012 Panasonic Electronic Components"/>
<attribute name="PURCHASE-URL" value="https://pricing.snapeda.com/search/part/ERJ-P6WF2202V/?ref=eda"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="U$1" library="ESP32" deviceset="ESP32-WROOM" device=""/>
<part name="Q1" library="SS8050-G" deviceset="SS8050-G" device=""/>
<part name="Q2" library="SS8050-G" deviceset="SS8050-G" device=""/>
<part name="U1" library="NCP1117LPST33T3G" deviceset="NCP1117LPST33T3G" device=""/>
<part name="J1" library="micro usb 10118192-0002LF" deviceset="10118192-0002LF" device="" value="10118192"/>
<part name="U2" library="PESD5V0L4UG_115" deviceset="PESD5V0L4UG,115" device="" value="PESD5V0L4UG"/>
<part name="U3" library="CP2102N-A02-GQFN24R" deviceset="CP2102N-A02-GQFN24R" device="" value="CP2102N"/>
<part name="U$2" library="1N5819" deviceset="1N5819" device=""/>
<part name="P+1" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="+5V" device=""/>
<part name="GND1" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="GND2" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="P+2" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="+5V" device=""/>
<part name="D1" library="APT2012SRCPRV" deviceset="APT2012SRCPRV" device=""/>
<part name="GND3" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="GND4" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="GND5" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="GND6" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="+3V1" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="+3V3" device=""/>
<part name="GND7" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="+3V2" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="+3V3" device=""/>
<part name="P+3" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="+5V" device=""/>
<part name="GND8" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="GND9" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="C8" library="CL10A475KQ8NNNC" deviceset="CL10A475KQ8NNNC" device=""/>
<part name="C9" library="CL10A475KQ8NNNC" deviceset="CL10A475KQ8NNNC" device="" value="100uF 6.3V 20%"/>
<part name="GND10" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="+3V3" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="+3V3" device=""/>
<part name="GND11" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="SV2" library="con-lsta" library_urn="urn:adsk.eagle:library:161" deviceset="FE05-2" device="" package3d_urn="urn:adsk.eagle:package:8170/1"/>
<part name="U5" library="TL3305AF260QG" deviceset="TL3305AF260QG" device=""/>
<part name="U6" library="TL3305AF260QG" deviceset="TL3305AF260QG" device=""/>
<part name="GND20" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="GND21" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="FRAME1" library="frames" library_urn="urn:adsk.eagle:library:229" deviceset="TABL_L" device=""/>
<part name="R22" library="ERJ-P06D2001V" deviceset="ERJ-P06D2001V" device="" value="2K"/>
<part name="R24" library="ERJ-P06F3301V" deviceset="ERJ-P06F3301V" device="" value="3.3K"/>
<part name="R26" library="ERJ-P6WF1202V" deviceset="ERJ-P6WF1202V" device="" value="12K"/>
<part name="R28" library="ERJ-P14J471U" deviceset="ERJ-P14J471U" device="" value="470"/>
<part name="C18" library="CL05A104KA5NNNC" deviceset="CL05A104KA5NNNC" device="" value="0.1uF"/>
<part name="C21" library="CL21A106KAYNNNE" deviceset="CL21A106KAYNNNE" device="" value="10uF"/>
<part name="R3" library="ERJ-1GE0R00C" deviceset="ERJ-1GE0R00C" device="" value="0"/>
<part name="R1" library="ERJ-1GE0R00C" deviceset="ERJ-1GE0R00C" device="" value="0"/>
<part name="R6" library="ERJ-1GE0R00C" deviceset="ERJ-1GE0R00C" device="" value="0"/>
<part name="R7" library="ERJ-1GE0R00C" deviceset="ERJ-1GE0R00C" device="" value="0"/>
<part name="R4" library="ERJ-P6WF1202V" deviceset="ERJ-P6WF1202V" device="" value="12K"/>
<part name="R15" library="ERJ-P06F1002V" deviceset="ERJ-P06F1002V" device="" value="10K"/>
<part name="R16" library="ERJ-P06F1002V" deviceset="ERJ-P06F1002V" device="" value="10K"/>
<part name="R2" library="ERJ-1GE0R00C" deviceset="ERJ-1GE0R00C" device="" value="0"/>
<part name="C1" library="CL21A106KAYNNNE" deviceset="CL21A106KAYNNNE" device="" value="10uF"/>
<part name="C3" library="CL10A226MQ8NRNC" deviceset="CL10A226MQ8NRNC" device="" value="22uF"/>
<part name="C2" library="CL10B102KB8NNNC" deviceset="CL10B102KB8NNNC" device="" value="1nF"/>
<part name="C10" library="CL10B102KB8NNNC" deviceset="CL10B102KB8NNNC" device="" value="1nF"/>
<part name="R17" library="ERA-3AEB472V" deviceset="ERA-3AEB472V" device="" value="4.7K"/>
<part name="R9" library="ERA-3AEB472V" deviceset="ERA-3AEB472V" device="" value="4.7K"/>
<part name="C12" library="CL05A104KA5NNNC" deviceset="CL05A104KA5NNNC" device="" value="0.1uF"/>
<part name="C4" library="CL05A104KA5NNNC" deviceset="CL05A104KA5NNNC" device="" value="0.1uF"/>
<part name="C5" library="CL21A106KAYNNNE" deviceset="CL21A106KAYNNNE" device="" value="10uF"/>
<part name="C6" library="CL05A104KA5NNNC" deviceset="CL05A104KA5NNNC" device="" value="0.1uF"/>
<part name="C7" library="CL21A106KAYNNNE" deviceset="CL21A106KAYNNNE" device="" value="10uF"/>
<part name="U7" library="MIC5504-1.8YM5-TR" deviceset="MIC5504-1.8YM5-TR" device=""/>
<part name="U9" library="PCA9306USG" deviceset="PCA9306USG" device=""/>
<part name="U13" library="SGP30" deviceset="SGP30" device="SGP30"/>
<part name="U10" library="DPS310XTSA1" deviceset="DPS310XTSA1" device=""/>
<part name="U11" library="SHTC1" deviceset="SHTC1" device=""/>
<part name="GND16" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="+3V5" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="+3V3" device=""/>
<part name="P+4" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="VCC" device=""/>
<part name="C14" library="CL10A226MQ8NRNC" deviceset="CL10A226MQ8NRNC" device="" value="100nF"/>
<part name="P+5" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="VCC" device="" value="1.8V"/>
<part name="+3V6" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="+3V3" device=""/>
<part name="R5" library="ERJ-P6WF2202V" deviceset="ERJ-P6WF2202V" device="" value="200K"/>
<part name="GND17" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="C15" library="CL10A226MQ8NRNC" deviceset="CL10A226MQ8NRNC" device="" value="100nF"/>
<part name="GND18" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="GND" device=""/>
<part name="P+6" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="VCC" device="" value="1.8V"/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="U$1" gate="G$1" x="-45.72" y="-48.26" smashed="yes"/>
<instance part="Q1" gate="G$1" x="-124.46" y="-17.78" smashed="yes">
<attribute name="NAME" x="-110.49" y="-16.51" size="1.778" layer="95" align="center-left"/>
<attribute name="VALUE" x="-110.49" y="-19.05" size="1.778" layer="96" align="center-left"/>
</instance>
<instance part="Q2" gate="G$1" x="-124.46" y="-40.64" smashed="yes" rot="MR180">
<attribute name="NAME" x="-110.49" y="-41.91" size="1.778" layer="95" rot="MR180" align="center-left"/>
<attribute name="VALUE" x="-110.49" y="-39.37" size="1.778" layer="96" rot="MR180" align="center-left"/>
</instance>
<instance part="U1" gate="G$1" x="-101.6" y="137.16" smashed="yes">
<attribute name="NAME" x="-114.3214" y="148.327509375" size="2.08536875" layer="95" ratio="10" rot="SR0"/>
<attribute name="VALUE" x="-114.3" y="143.313640625" size="2.08426875" layer="96" ratio="10" rot="SR0"/>
</instance>
<instance part="J1" gate="G$1" x="-127" y="66.04" smashed="yes" rot="R180">
<attribute name="NAME" x="-124.46" y="52.07" size="1.778" layer="95"/>
<attribute name="VALUE" x="-134.62" y="78.74" size="1.778" layer="96"/>
</instance>
<instance part="U2" gate="G$1" x="-99.06" y="48.26" smashed="yes">
<attribute name="NAME" x="-104.14" y="56.134" size="1.778" layer="95"/>
<attribute name="VALUE" x="-104.14" y="38.354" size="1.778" layer="96"/>
</instance>
<instance part="U3" gate="G$1" x="-27.94" y="55.88" smashed="yes">
<attribute name="NAME" x="-45.72" y="79.74" size="1.778" layer="95" ratio="10" rot="SR0"/>
<attribute name="VALUE" x="-45.72" y="30.48" size="1.778" layer="96" ratio="10" rot="SR0"/>
</instance>
<instance part="U$2" gate="G$1" x="-114.3" y="40.64" smashed="yes" rot="R270">
<attribute name="NAME" x="-119.388409375" y="40.64" size="1.2721" layer="95" rot="R270"/>
<attribute name="VALUE" x="-111.75495" y="40.64" size="1.27251875" layer="96" rot="R270"/>
</instance>
<instance part="P+1" gate="1" x="-114.3" y="27.94" smashed="yes" rot="R180">
<attribute name="VALUE" x="-111.76" y="33.02" size="1.778" layer="96" rot="R270"/>
</instance>
<instance part="GND1" gate="1" x="-81.28" y="48.26" smashed="yes" rot="R90">
<attribute name="VALUE" x="-78.74" y="45.72" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="GND2" gate="1" x="-104.14" y="73.66" smashed="yes" rot="R180">
<attribute name="VALUE" x="-101.6" y="76.2" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="P+2" gate="1" x="-127" y="149.86" smashed="yes">
<attribute name="VALUE" x="-124.46" y="152.4" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="D1" gate="G$1" x="-137.16" y="106.68" smashed="yes" rot="R90">
<attribute name="NAME" x="-141.23026875" y="104.64486875" size="1.780740625" layer="95" rot="R90"/>
<attribute name="VALUE" x="-133.34685" y="104.64631875" size="1.77946875" layer="96" rot="R90"/>
</instance>
<instance part="GND3" gate="1" x="-137.16" y="96.52" smashed="yes">
<attribute name="VALUE" x="-139.7" y="93.98" size="1.778" layer="96"/>
</instance>
<instance part="GND4" gate="1" x="-101.6" y="96.52" smashed="yes">
<attribute name="VALUE" x="-104.14" y="93.98" size="1.778" layer="96"/>
</instance>
<instance part="GND5" gate="1" x="-66.04" y="96.52" smashed="yes">
<attribute name="VALUE" x="-68.58" y="93.98" size="1.778" layer="96"/>
</instance>
<instance part="GND6" gate="1" x="-81.28" y="96.52" smashed="yes">
<attribute name="VALUE" x="-83.82" y="93.98" size="1.778" layer="96"/>
</instance>
<instance part="+3V1" gate="G$1" x="-73.66" y="149.86" smashed="yes">
<attribute name="VALUE" x="-71.12" y="152.4" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="GND7" gate="1" x="-93.98" y="68.58" smashed="yes">
<attribute name="VALUE" x="-96.52" y="66.04" size="1.778" layer="96"/>
</instance>
<instance part="+3V2" gate="G$1" x="-81.28" y="86.36" smashed="yes">
<attribute name="VALUE" x="-83.82" y="81.28" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="P+3" gate="1" x="-81.28" y="25.4" smashed="yes">
<attribute name="VALUE" x="-78.74" y="27.94" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="GND8" gate="1" x="-104.14" y="5.08" smashed="yes">
<attribute name="VALUE" x="-106.68" y="2.54" size="1.778" layer="96"/>
</instance>
<instance part="GND9" gate="1" x="0" y="30.48" smashed="yes">
<attribute name="VALUE" x="-2.54" y="27.94" size="1.778" layer="96"/>
</instance>
<instance part="C8" gate="G$1" x="-63.5" y="-12.7" smashed="yes" rot="R270">
<attribute name="NAME" x="-59.68906875" y="-12.7" size="1.77843125" layer="95" rot="R270"/>
</instance>
<instance part="C9" gate="G$1" x="-73.66" y="-12.7" smashed="yes" rot="R270">
<attribute name="NAME" x="-71.12" y="-12.7" size="1.77843125" layer="95" rot="R270"/>
</instance>
<instance part="GND10" gate="1" x="-68.58" y="-25.4" smashed="yes">
<attribute name="VALUE" x="-71.12" y="-27.94" size="1.778" layer="96"/>
</instance>
<instance part="+3V3" gate="G$1" x="-68.58" y="7.62" smashed="yes">
<attribute name="VALUE" x="-66.04" y="10.16" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="GND11" gate="1" x="-30.48" y="-58.42" smashed="yes">
<attribute name="VALUE" x="-33.02" y="-60.96" size="1.778" layer="96"/>
</instance>
<instance part="SV2" gate="G$1" x="38.1" y="73.66" smashed="yes" rot="R90">
<attribute name="VALUE" x="48.26" y="69.85" size="1.778" layer="96" rot="R90"/>
<attribute name="NAME" x="29.718" y="69.85" size="1.778" layer="95" rot="R90"/>
</instance>
<instance part="U5" gate="G$1" x="73.66" y="88.9" smashed="yes">
<attribute name="NAME" x="68.58" y="93.98" size="1.778" layer="95"/>
<attribute name="VALUE" x="68.58" y="83.82" size="1.778" layer="96"/>
</instance>
<instance part="U6" gate="G$1" x="73.66" y="111.76" smashed="yes">
<attribute name="NAME" x="68.58" y="116.84" size="1.778" layer="95"/>
<attribute name="VALUE" x="68.58" y="106.68" size="1.778" layer="96"/>
</instance>
<instance part="GND20" gate="1" x="55.88" y="76.2" smashed="yes">
<attribute name="VALUE" x="53.34" y="73.66" size="1.778" layer="96"/>
</instance>
<instance part="GND21" gate="1" x="55.88" y="99.06" smashed="yes">
<attribute name="VALUE" x="53.34" y="96.52" size="1.778" layer="96"/>
</instance>
<instance part="FRAME1" gate="G$1" x="-175.26" y="-68.58" smashed="yes"/>
<instance part="FRAME1" gate="G$2" x="124.46" y="-68.58" smashed="yes">
<attribute name="LAST_DATE_TIME" x="137.16" y="-67.31" size="2.54" layer="94"/>
<attribute name="SHEET" x="210.82" y="-67.31" size="2.54" layer="94"/>
<attribute name="DRAWING_NAME" x="142.24" y="-49.53" size="2.54" layer="94"/>
</instance>
<instance part="R22" gate="G$1" x="-137.16" y="127" smashed="yes" rot="R90">
<attribute name="NAME" x="-139.70148125" y="124.455559375" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="-132.07003125" y="127.006640625" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="R24" gate="G$1" x="-81.28" y="127" smashed="yes" rot="R90">
<attribute name="NAME" x="-83.82148125" y="124.455559375" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="-73.65003125" y="127.006640625" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="R26" gate="G$1" x="-134.62" y="-17.78" smashed="yes">
<attribute name="NAME" x="-142.244440625" y="-15.23851875" size="2.54148125" layer="95"/>
<attribute name="VALUE" x="-142.24996875" y="-22.866640625" size="2.54331875" layer="96"/>
</instance>
<instance part="R28" gate="G$1" x="-60.96" y="38.1" smashed="yes">
<attribute name="NAME" x="-68.584440625" y="40.64148125" size="2.54148125" layer="95"/>
<attribute name="VALUE" x="-68.58996875" y="33.013359375" size="2.54331875" layer="96"/>
</instance>
<instance part="C18" gate="G$1" x="88.9" y="43.18" smashed="yes" rot="R90">
<attribute name="NAME" x="87.63" y="47.625" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="91.44" y="46.355" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="C21" gate="G$1" x="-121.92" y="127" smashed="yes" rot="R90">
<attribute name="NAME" x="-125.73093125" y="127" size="1.77843125" layer="95" rot="R90"/>
<attribute name="VALUE" x="-116.83151875" y="127" size="1.78096875" layer="96" rot="R90"/>
</instance>
<instance part="R3" gate="G$1" x="-139.7" y="30.48" smashed="yes">
<attribute name="NAME" x="-146.371940625" y="32.06898125" size="2.54148125" layer="95"/>
<attribute name="VALUE" x="-139.39246875" y="26.345859375" size="2.54331875" layer="96"/>
</instance>
<instance part="R1" gate="G$1" x="-139.7" y="22.86" smashed="yes">
<attribute name="NAME" x="-146.371940625" y="24.44898125" size="2.54148125" layer="95"/>
<attribute name="VALUE" x="-139.39246875" y="18.725859375" size="2.54331875" layer="96"/>
</instance>
<instance part="R6" gate="G$1" x="-139.7" y="15.24" smashed="yes">
<attribute name="NAME" x="-146.371940625" y="16.82898125" size="2.54148125" layer="95"/>
<attribute name="VALUE" x="-139.39246875" y="11.105859375" size="2.54331875" layer="96"/>
</instance>
<instance part="R7" gate="G$1" x="-139.7" y="7.62" smashed="yes">
<attribute name="NAME" x="-146.371940625" y="9.20898125" size="2.54148125" layer="95"/>
<attribute name="VALUE" x="-139.39246875" y="3.485859375" size="2.54331875" layer="96"/>
</instance>
<instance part="R4" gate="G$1" x="-134.62" y="-40.64" smashed="yes">
<attribute name="NAME" x="-142.244440625" y="-38.09851875" size="2.54148125" layer="95"/>
<attribute name="VALUE" x="-142.24996875" y="-45.726640625" size="2.54331875" layer="96"/>
</instance>
<instance part="R15" gate="G$1" x="99.06" y="86.36" smashed="yes" rot="R180">
<attribute name="NAME" x="102.239440625" y="85.08851875" size="2.54148125" layer="95" rot="R180"/>
<attribute name="VALUE" x="102.24496875" y="90.176640625" size="2.54331875" layer="96" rot="R180"/>
</instance>
<instance part="R16" gate="G$1" x="99.06" y="109.22" smashed="yes" rot="R180">
<attribute name="NAME" x="102.239440625" y="107.94851875" size="2.54148125" layer="95" rot="R180"/>
<attribute name="VALUE" x="102.24496875" y="113.036640625" size="2.54331875" layer="96" rot="R180"/>
</instance>
<instance part="R2" gate="G$1" x="-101.6" y="109.22" smashed="yes" rot="R90">
<attribute name="NAME" x="-103.18898125" y="102.548059375" size="2.54148125" layer="95" rot="R90"/>
<attribute name="VALUE" x="-97.465859375" y="109.52753125" size="2.54331875" layer="96" rot="R90"/>
</instance>
<instance part="C1" gate="G$1" x="-81.28" y="109.22" smashed="yes" rot="R90">
<attribute name="NAME" x="-85.09093125" y="109.22" size="1.77843125" layer="95" rot="R90"/>
<attribute name="VALUE" x="-76.19151875" y="109.22" size="1.78096875" layer="96" rot="R90"/>
</instance>
<instance part="C3" gate="G$1" x="-66.04" y="127" smashed="yes" rot="R90">
<attribute name="NAME" x="-69.85" y="127" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="-60.96" y="127" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="C2" gate="G$1" x="73.66" y="101.6" smashed="yes">
<attribute name="NAME" x="73.66" y="105.41093125" size="1.77843125" layer="95"/>
<attribute name="VALUE" x="73.66" y="96.51151875" size="1.78096875" layer="96"/>
</instance>
<instance part="C10" gate="G$1" x="73.66" y="78.74" smashed="yes">
<attribute name="NAME" x="66.04" y="80.01093125" size="1.77843125" layer="95"/>
<attribute name="VALUE" x="73.66" y="73.65151875" size="1.78096875" layer="96"/>
</instance>
<instance part="R17" gate="G$1" x="38.1" y="48.26" smashed="yes" rot="R90">
<attribute name="NAME" x="37.46351875" y="50.795559375" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="41.916640625" y="46.34503125" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="R9" gate="G$1" x="45.72" y="50.8" smashed="yes" rot="R90">
<attribute name="NAME" x="44.44851875" y="49.525559375" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="48.901640625" y="48.25003125" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="C12" gate="G$1" x="96.52" y="43.18" smashed="yes" rot="R90">
<attribute name="NAME" x="95.25" y="47.625" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="99.06" y="46.355" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="C4" gate="G$1" x="-86.36" y="71.12" smashed="yes" rot="R180">
<attribute name="NAME" x="-88.9" y="67.31" size="1.778" layer="95"/>
<attribute name="VALUE" x="-83.82" y="74.93" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="C5" gate="G$1" x="-86.36" y="78.74" smashed="yes" rot="R180">
<attribute name="NAME" x="-89.535" y="78.10406875" size="1.77843125" layer="95" rot="R180"/>
<attribute name="VALUE" x="-87.63" y="83.19348125" size="1.78096875" layer="96" rot="R180"/>
</instance>
<instance part="C6" gate="G$1" x="-91.44" y="10.16" smashed="yes" rot="R180">
<attribute name="NAME" x="-93.98" y="6.35" size="1.778" layer="95"/>
<attribute name="VALUE" x="-88.9" y="13.97" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="C7" gate="G$1" x="-91.44" y="20.32" smashed="yes" rot="R180">
<attribute name="NAME" x="-94.615" y="19.68406875" size="1.77843125" layer="95" rot="R180"/>
<attribute name="VALUE" x="-92.71" y="24.77348125" size="1.78096875" layer="96" rot="R180"/>
</instance>
<instance part="U7" gate="G$1" x="-106.68" y="177.8" smashed="yes" rot="R270">
<attribute name="NAME" x="-116.8501" y="193.55876875" size="1.780359375" layer="95"/>
<attribute name="VALUE" x="-116.84083125" y="190.4989" size="1.778190625" layer="96"/>
</instance>
<instance part="U9" gate="G$1" x="50.8" y="-10.16" smashed="yes">
<attribute name="NAME" x="40.64" y="3.81" size="1.778" layer="95"/>
<attribute name="VALUE" x="40.64" y="-24.13" size="1.778" layer="96" align="top-left"/>
</instance>
<instance part="U13" gate="G$1" x="124.46" y="40.64" smashed="yes">
<attribute name="NAME" x="121.92" y="33.02" size="1.6764" layer="125"/>
<attribute name="VALUE" x="121.92" y="30.48" size="1.6764" layer="96"/>
</instance>
<instance part="U10" gate="G$1" x="73.66" y="45.72" smashed="yes">
<attribute name="NAME" x="63.5" y="59.69" size="1.778" layer="95"/>
<attribute name="VALUE" x="63.5" y="31.75" size="1.778" layer="96" align="top-left"/>
</instance>
<instance part="U11" gate="G$1" x="106.68" y="-15.24" smashed="yes">
<attribute name="NAME" x="96.52" y="-6.985" size="2.54" layer="95"/>
<attribute name="VALUE" x="96.52" y="-23.495" size="2.54" layer="96" rot="MR180"/>
</instance>
<instance part="GND16" gate="1" x="-137.16" y="167.64" smashed="yes" rot="R180">
<attribute name="VALUE" x="-134.62" y="170.18" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="+3V5" gate="G$1" x="-137.16" y="157.48" smashed="yes">
<attribute name="VALUE" x="-134.62" y="160.02" size="1.778" layer="96" rot="R180"/>
</instance>
<instance part="P+4" gate="VCC" x="-66.04" y="162.56" smashed="yes"/>
<instance part="C14" gate="G$1" x="104.14" y="43.18" smashed="yes" rot="R90">
<attribute name="NAME" x="102.87" y="35.56" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="106.68" y="35.56" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="P+5" gate="VCC" x="30.48" y="12.7" smashed="yes"/>
<instance part="+3V6" gate="G$1" x="25.4" y="12.7" smashed="yes">
<attribute name="VALUE" x="22.86" y="7.62" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="R5" gate="G$1" x="20.32" y="0" smashed="yes" rot="R90">
<attribute name="NAME" x="17.77851875" y="-7.624440625" size="2.54148125" layer="95" rot="R90"/>
<attribute name="VALUE" x="17.786640625" y="-0.00996875" size="2.54331875" layer="96" rot="R90"/>
</instance>
<instance part="GND17" gate="1" x="71.12" y="-27.94" smashed="yes">
<attribute name="VALUE" x="68.58" y="-30.48" size="1.778" layer="96"/>
</instance>
<instance part="C15" gate="G$1" x="137.16" y="-17.78" smashed="yes" rot="R90">
<attribute name="NAME" x="135.89" y="-25.4" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="139.7" y="-25.4" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="GND18" gate="1" x="127" y="-25.4" smashed="yes">
<attribute name="VALUE" x="124.46" y="-27.94" size="1.778" layer="96"/>
</instance>
<instance part="P+6" gate="VCC" x="127" y="-2.54" smashed="yes"/>
</instances>
<busses>
</busses>
<nets>
<net name="N$1" class="0">
<segment>
<pinref part="J1" gate="G$1" pin="D-"/>
<wire x1="-116.84" y1="60.96" x2="-111.76" y2="60.96" width="0.1524" layer="91"/>
<pinref part="U3" gate="G$1" pin="D-"/>
<junction x="-111.76" y="60.96"/>
<wire x1="-111.76" y1="60.96" x2="-50.8" y2="60.96" width="0.1524" layer="91"/>
<pinref part="U2" gate="G$1" pin="3"/>
<wire x1="-111.76" y1="60.96" x2="-111.76" y2="43.18" width="0.1524" layer="91"/>
<wire x1="-111.76" y1="43.18" x2="-106.68" y2="43.18" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="J1" gate="G$1" pin="D+"/>
<pinref part="U3" gate="G$1" pin="D+"/>
<wire x1="-116.84" y1="63.5" x2="-109.22" y2="63.5" width="0.1524" layer="91"/>
<pinref part="U2" gate="G$1" pin="1"/>
<wire x1="-109.22" y1="63.5" x2="-50.8" y2="63.5" width="0.1524" layer="91"/>
<wire x1="-106.68" y1="53.34" x2="-109.22" y2="53.34" width="0.1524" layer="91"/>
<wire x1="-109.22" y1="53.34" x2="-109.22" y2="63.5" width="0.1524" layer="91"/>
<junction x="-109.22" y="63.5"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="A"/>
<pinref part="J1" gate="G$1" pin="VCC"/>
<wire x1="-114.3" y1="43.18" x2="-114.3" y2="58.42" width="0.1524" layer="91"/>
<wire x1="-114.3" y1="58.42" x2="-116.84" y2="58.42" width="0.1524" layer="91"/>
</segment>
</net>
<net name="+5V" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="K"/>
<pinref part="P+1" gate="1" pin="+5V"/>
<wire x1="-114.3" y1="35.56" x2="-114.3" y2="30.48" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="INPUT"/>
<wire x1="-119.38" y1="139.7" x2="-121.92" y2="139.7" width="0.1524" layer="91"/>
<wire x1="-121.92" y1="139.7" x2="-127" y2="139.7" width="0.1524" layer="91"/>
<wire x1="-127" y1="139.7" x2="-137.16" y2="139.7" width="0.1524" layer="91"/>
<wire x1="-137.16" y1="139.7" x2="-137.16" y2="132.08" width="0.1524" layer="91"/>
<wire x1="-121.92" y1="132.08" x2="-121.92" y2="139.7" width="0.1524" layer="91"/>
<junction x="-121.92" y="139.7"/>
<pinref part="P+2" gate="1" pin="+5V"/>
<wire x1="-127" y1="147.32" x2="-127" y2="139.7" width="0.1524" layer="91"/>
<junction x="-127" y="139.7"/>
<pinref part="R22" gate="G$1" pin="2"/>
<pinref part="C21" gate="G$1" pin="2"/>
</segment>
</net>
<net name="GND" class="0">
<segment>
<pinref part="U2" gate="G$1" pin="5"/>
<wire x1="-91.44" y1="53.34" x2="-88.9" y2="53.34" width="0.1524" layer="91"/>
<wire x1="-88.9" y1="53.34" x2="-88.9" y2="48.26" width="0.1524" layer="91"/>
<pinref part="GND1" gate="1" pin="GND"/>
<wire x1="-88.9" y1="48.26" x2="-83.82" y2="48.26" width="0.1524" layer="91"/>
<pinref part="U2" gate="G$1" pin="4"/>
<wire x1="-91.44" y1="43.18" x2="-88.9" y2="43.18" width="0.1524" layer="91"/>
<wire x1="-88.9" y1="43.18" x2="-88.9" y2="48.26" width="0.1524" layer="91"/>
<junction x="-88.9" y="48.26"/>
</segment>
<segment>
<pinref part="J1" gate="G$1" pin="GND"/>
<pinref part="GND2" gate="1" pin="GND"/>
<wire x1="-116.84" y1="68.58" x2="-111.76" y2="68.58" width="0.1524" layer="91"/>
<wire x1="-111.76" y1="68.58" x2="-104.14" y2="68.58" width="0.1524" layer="91"/>
<wire x1="-104.14" y1="68.58" x2="-104.14" y2="71.12" width="0.1524" layer="91"/>
<pinref part="J1" gate="G$1" pin="SHIELD"/>
<wire x1="-116.84" y1="73.66" x2="-111.76" y2="73.66" width="0.1524" layer="91"/>
<wire x1="-111.76" y1="73.66" x2="-111.76" y2="68.58" width="0.1524" layer="91"/>
<junction x="-111.76" y="68.58"/>
</segment>
<segment>
<pinref part="D1" gate="G$1" pin="C"/>
<pinref part="GND3" gate="1" pin="GND"/>
<wire x1="-121.92" y1="124.46" x2="-121.92" y2="99.06" width="0.1524" layer="91"/>
<wire x1="-121.92" y1="99.06" x2="-137.16" y2="99.06" width="0.1524" layer="91"/>
<junction x="-137.16" y="99.06"/>
<pinref part="C21" gate="G$1" pin="1"/>
</segment>
<segment>
<pinref part="GND4" gate="1" pin="GND"/>
<wire x1="-101.6" y1="104.14" x2="-101.6" y2="99.06" width="0.1524" layer="91"/>
<pinref part="R2" gate="G$1" pin="1"/>
</segment>
<segment>
<pinref part="GND5" gate="1" pin="GND"/>
<wire x1="-66.04" y1="124.46" x2="-66.04" y2="99.06" width="0.1524" layer="91"/>
<pinref part="C3" gate="G$1" pin="2"/>
</segment>
<segment>
<pinref part="GND6" gate="1" pin="GND"/>
<wire x1="-81.28" y1="106.68" x2="-81.28" y2="99.06" width="0.1524" layer="91"/>
<pinref part="C1" gate="G$1" pin="1"/>
</segment>
<segment>
<wire x1="-91.44" y1="78.74" x2="-93.98" y2="78.74" width="0.1524" layer="91"/>
<wire x1="-93.98" y1="78.74" x2="-93.98" y2="71.12" width="0.1524" layer="91"/>
<wire x1="-93.98" y1="71.12" x2="-91.44" y2="71.12" width="0.1524" layer="91"/>
<pinref part="GND7" gate="1" pin="GND"/>
<junction x="-93.98" y="71.12"/>
<pinref part="C4" gate="G$1" pin="1"/>
<pinref part="C5" gate="G$1" pin="2"/>
</segment>
<segment>
<wire x1="-96.52" y1="20.32" x2="-104.14" y2="20.32" width="0.1524" layer="91"/>
<pinref part="GND8" gate="1" pin="GND"/>
<wire x1="-104.14" y1="20.32" x2="-104.14" y2="10.16" width="0.1524" layer="91"/>
<wire x1="-104.14" y1="10.16" x2="-104.14" y2="7.62" width="0.1524" layer="91"/>
<wire x1="-96.52" y1="10.16" x2="-104.14" y2="10.16" width="0.1524" layer="91"/>
<junction x="-104.14" y="10.16"/>
<pinref part="C6" gate="G$1" pin="1"/>
<pinref part="C7" gate="G$1" pin="2"/>
</segment>
<segment>
<pinref part="U3" gate="G$1" pin="GND"/>
<wire x1="-5.08" y1="35.56" x2="0" y2="35.56" width="0.1524" layer="91"/>
<pinref part="GND9" gate="1" pin="GND"/>
<wire x1="0" y1="35.56" x2="0" y2="33.02" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="C9" gate="G$1" pin="2"/>
<wire x1="-73.66" y1="-17.78" x2="-73.66" y2="-20.32" width="0.1524" layer="91"/>
<wire x1="-73.66" y1="-20.32" x2="-68.58" y2="-20.32" width="0.1524" layer="91"/>
<pinref part="C8" gate="G$1" pin="2"/>
<wire x1="-68.58" y1="-20.32" x2="-63.5" y2="-20.32" width="0.1524" layer="91"/>
<wire x1="-63.5" y1="-20.32" x2="-63.5" y2="-17.78" width="0.1524" layer="91"/>
<pinref part="GND10" gate="1" pin="GND"/>
<wire x1="-68.58" y1="-22.86" x2="-68.58" y2="-20.32" width="0.1524" layer="91"/>
<junction x="-68.58" y="-20.32"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="GND1"/>
<wire x1="-45.72" y1="-33.02" x2="-55.88" y2="-33.02" width="0.1524" layer="91"/>
<label x="-55.88" y="-33.02" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="GND5"/>
<wire x1="-30.48" y1="-50.8" x2="-30.48" y2="-55.88" width="0.1524" layer="91"/>
<pinref part="GND11" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="GND3"/>
<wire x1="-15.24" y1="-15.24" x2="-5.08" y2="-15.24" width="0.1524" layer="91"/>
<label x="-10.16" y="-15.24" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="GND4"/>
<wire x1="-45.72" y1="-45.72" x2="-55.88" y2="-45.72" width="0.1524" layer="91"/>
<label x="-55.88" y="-45.72" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="GND2"/>
<wire x1="-15.24" y1="0" x2="-5.08" y2="0" width="0.1524" layer="91"/>
<label x="-10.16" y="0" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="50.8" y1="25.4" x2="50.8" y2="33.02" width="0.1524" layer="91"/>
<wire x1="50.8" y1="33.02" x2="50.8" y2="40.64" width="0.1524" layer="91"/>
<wire x1="50.8" y1="40.64" x2="58.42" y2="40.64" width="0.1524" layer="91"/>
<wire x1="50.8" y1="33.02" x2="25.4" y2="33.02" width="0.1524" layer="91"/>
<junction x="50.8" y="33.02"/>
<wire x1="25.4" y1="33.02" x2="25.4" y2="55.88" width="0.1524" layer="91"/>
<wire x1="25.4" y1="55.88" x2="25.4" y2="91.44" width="0.1524" layer="91"/>
<wire x1="25.4" y1="91.44" x2="43.18" y2="91.44" width="0.1524" layer="91"/>
<pinref part="SV2" gate="G$1" pin="2"/>
<wire x1="43.18" y1="91.44" x2="43.18" y2="81.28" width="0.1524" layer="91"/>
<wire x1="25.4" y1="55.88" x2="17.78" y2="55.88" width="0.1524" layer="91"/>
<junction x="25.4" y="55.88"/>
<label x="17.78" y="55.88" size="1.778" layer="95"/>
<wire x1="50.8" y1="25.4" x2="99.06" y2="25.4" width="0.1524" layer="91"/>
<wire x1="96.52" y1="35.56" x2="99.06" y2="35.56" width="0.1524" layer="91"/>
<wire x1="96.52" y1="40.64" x2="96.52" y2="35.56" width="0.1524" layer="91"/>
<junction x="96.52" y="35.56"/>
<wire x1="88.9" y1="35.56" x2="96.52" y2="35.56" width="0.1524" layer="91"/>
<wire x1="88.9" y1="40.64" x2="88.9" y2="35.56" width="0.1524" layer="91"/>
<wire x1="99.06" y1="35.56" x2="99.06" y2="30.48" width="0.1524" layer="91"/>
<pinref part="C18" gate="G$1" pin="2"/>
<pinref part="C12" gate="G$1" pin="2"/>
<pinref part="U10" gate="G$1" pin="GND"/>
<junction x="88.9" y="35.56"/>
<pinref part="U10" gate="G$1" pin="SDO"/>
<pinref part="U13" gate="G$1" pin="GND"/>
<wire x1="99.06" y1="30.48" x2="99.06" y2="25.4" width="0.1524" layer="91"/>
<wire x1="116.84" y1="50.8" x2="109.22" y2="50.8" width="0.1524" layer="91"/>
<wire x1="109.22" y1="50.8" x2="109.22" y2="30.48" width="0.1524" layer="91"/>
<wire x1="109.22" y1="30.48" x2="104.14" y2="30.48" width="0.1524" layer="91"/>
<junction x="99.06" y="30.48"/>
<pinref part="C14" gate="G$1" pin="2"/>
<wire x1="104.14" y1="30.48" x2="99.06" y2="30.48" width="0.1524" layer="91"/>
<wire x1="104.14" y1="40.64" x2="104.14" y2="30.48" width="0.1524" layer="91"/>
<junction x="104.14" y="30.48"/>
</segment>
<segment>
<pinref part="U5" gate="G$1" pin="2"/>
<wire x1="63.5" y1="86.36" x2="55.88" y2="86.36" width="0.1524" layer="91"/>
<wire x1="55.88" y1="86.36" x2="55.88" y2="78.74" width="0.1524" layer="91"/>
<wire x1="55.88" y1="78.74" x2="71.12" y2="78.74" width="0.1524" layer="91"/>
<pinref part="GND20" gate="1" pin="GND"/>
<junction x="55.88" y="78.74"/>
<pinref part="C10" gate="G$1" pin="1"/>
</segment>
<segment>
<pinref part="U6" gate="G$1" pin="2"/>
<wire x1="63.5" y1="109.22" x2="55.88" y2="109.22" width="0.1524" layer="91"/>
<wire x1="55.88" y1="109.22" x2="55.88" y2="101.6" width="0.1524" layer="91"/>
<wire x1="55.88" y1="101.6" x2="71.12" y2="101.6" width="0.1524" layer="91"/>
<pinref part="GND21" gate="1" pin="GND"/>
<junction x="55.88" y="101.6"/>
<pinref part="C2" gate="G$1" pin="1"/>
</segment>
<segment>
<pinref part="U7" gate="G$1" pin="GND"/>
<wire x1="-111.76" y1="167.64" x2="-111.76" y2="165.1" width="0.1524" layer="91"/>
<wire x1="-111.76" y1="165.1" x2="-137.16" y2="165.1" width="0.1524" layer="91"/>
<pinref part="GND16" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="U9" gate="G$1" pin="GND"/>
<wire x1="66.04" y1="-20.32" x2="71.12" y2="-20.32" width="0.1524" layer="91"/>
<pinref part="GND17" gate="1" pin="GND"/>
<wire x1="71.12" y1="-20.32" x2="71.12" y2="-25.4" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U11" gate="G$1" pin="VSS"/>
<wire x1="121.92" y1="-20.32" x2="127" y2="-20.32" width="0.1524" layer="91"/>
<pinref part="GND18" gate="1" pin="GND"/>
<wire x1="127" y1="-20.32" x2="127" y2="-22.86" width="0.1524" layer="91"/>
<pinref part="C15" gate="G$1" pin="2"/>
<wire x1="127" y1="-20.32" x2="137.16" y2="-20.32" width="0.1524" layer="91"/>
<junction x="127" y="-20.32"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<wire x1="-81.28" y1="121.92" x2="-81.28" y2="116.84" width="0.1524" layer="91"/>
<pinref part="U1" gate="G$1" pin="GND"/>
<wire x1="-81.28" y1="116.84" x2="-81.28" y2="114.3" width="0.1524" layer="91"/>
<wire x1="-101.6" y1="114.3" x2="-101.6" y2="116.84" width="0.1524" layer="91"/>
<wire x1="-101.6" y1="116.84" x2="-101.6" y2="127" width="0.1524" layer="91"/>
<wire x1="-81.28" y1="116.84" x2="-101.6" y2="116.84" width="0.1524" layer="91"/>
<junction x="-81.28" y="116.84"/>
<junction x="-101.6" y="116.84"/>
<pinref part="R24" gate="G$1" pin="1"/>
<pinref part="R2" gate="G$1" pin="2"/>
<pinref part="C1" gate="G$1" pin="2"/>
</segment>
</net>
<net name="+3V3" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="OUTPUT"/>
<wire x1="-66.04" y1="132.08" x2="-66.04" y2="139.7" width="0.1524" layer="91"/>
<wire x1="-66.04" y1="139.7" x2="-73.66" y2="139.7" width="0.1524" layer="91"/>
<wire x1="-73.66" y1="139.7" x2="-81.28" y2="139.7" width="0.1524" layer="91"/>
<wire x1="-81.28" y1="139.7" x2="-83.82" y2="139.7" width="0.1524" layer="91"/>
<wire x1="-81.28" y1="132.08" x2="-81.28" y2="139.7" width="0.1524" layer="91"/>
<junction x="-81.28" y="139.7"/>
<pinref part="+3V1" gate="G$1" pin="+3V3"/>
<wire x1="-73.66" y1="147.32" x2="-73.66" y2="139.7" width="0.1524" layer="91"/>
<junction x="-73.66" y="139.7"/>
<pinref part="R24" gate="G$1" pin="2"/>
<pinref part="C3" gate="G$1" pin="1"/>
</segment>
<segment>
<pinref part="U3" gate="G$1" pin="VREGIN"/>
<wire x1="-81.28" y1="71.12" x2="-55.88" y2="71.12" width="0.1524" layer="91"/>
<wire x1="-55.88" y1="71.12" x2="-50.8" y2="71.12" width="0.1524" layer="91"/>
<wire x1="-83.82" y1="78.74" x2="-81.28" y2="78.74" width="0.1524" layer="91"/>
<pinref part="+3V2" gate="G$1" pin="+3V3"/>
<wire x1="-81.28" y1="83.82" x2="-81.28" y2="78.74" width="0.1524" layer="91"/>
<junction x="-81.28" y="78.74"/>
<wire x1="-81.28" y1="78.74" x2="-81.28" y2="71.12" width="0.1524" layer="91"/>
<junction x="-81.28" y="71.12"/>
<wire x1="-81.28" y1="71.12" x2="-83.82" y2="71.12" width="0.1524" layer="91"/>
<wire x1="-55.88" y1="71.12" x2="-55.88" y2="86.36" width="0.1524" layer="91"/>
<junction x="-55.88" y="71.12"/>
<wire x1="-55.88" y1="86.36" x2="0" y2="86.36" width="0.1524" layer="91"/>
<pinref part="U3" gate="G$1" pin="VDD"/>
<wire x1="-5.08" y1="76.2" x2="0" y2="76.2" width="0.1524" layer="91"/>
<wire x1="0" y1="86.36" x2="0" y2="76.2" width="0.1524" layer="91"/>
<pinref part="C4" gate="G$1" pin="2"/>
<pinref part="C5" gate="G$1" pin="1"/>
<wire x1="0" y1="76.2" x2="0" y2="73.66" width="0.1524" layer="91"/>
<junction x="0" y="76.2"/>
<pinref part="U3" gate="G$1" pin="VIO"/>
<wire x1="0" y1="73.66" x2="-5.08" y2="73.66" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="3.3V"/>
<wire x1="-45.72" y1="0" x2="-63.5" y2="0" width="0.1524" layer="91"/>
<pinref part="C9" gate="G$1" pin="1"/>
<wire x1="-63.5" y1="0" x2="-68.58" y2="0" width="0.1524" layer="91"/>
<wire x1="-68.58" y1="0" x2="-73.66" y2="0" width="0.1524" layer="91"/>
<wire x1="-73.66" y1="0" x2="-73.66" y2="-10.16" width="0.1524" layer="91"/>
<pinref part="C8" gate="G$1" pin="1"/>
<wire x1="-63.5" y1="-10.16" x2="-63.5" y2="0" width="0.1524" layer="91"/>
<junction x="-63.5" y="0"/>
<pinref part="+3V3" gate="G$1" pin="+3V3"/>
<wire x1="-68.58" y1="5.08" x2="-68.58" y2="0" width="0.1524" layer="91"/>
<junction x="-68.58" y="0"/>
</segment>
<segment>
<wire x1="38.1" y1="53.34" x2="38.1" y2="55.88" width="0.1524" layer="91"/>
<wire x1="38.1" y1="55.88" x2="40.64" y2="55.88" width="0.1524" layer="91"/>
<wire x1="99.06" y1="53.34" x2="99.06" y2="55.88" width="0.1524" layer="91"/>
<wire x1="99.06" y1="55.88" x2="96.52" y2="55.88" width="0.1524" layer="91"/>
<wire x1="96.52" y1="55.88" x2="88.9" y2="55.88" width="0.1524" layer="91"/>
<wire x1="99.06" y1="55.88" x2="99.06" y2="60.96" width="0.1524" layer="91"/>
<wire x1="99.06" y1="60.96" x2="99.06" y2="63.5" width="0.1524" layer="91"/>
<wire x1="99.06" y1="63.5" x2="50.8" y2="63.5" width="0.1524" layer="91"/>
<junction x="99.06" y="55.88"/>
<wire x1="50.8" y1="63.5" x2="50.8" y2="55.88" width="0.1524" layer="91"/>
<wire x1="50.8" y1="55.88" x2="50.8" y2="48.26" width="0.1524" layer="91"/>
<wire x1="50.8" y1="48.26" x2="58.42" y2="48.26" width="0.1524" layer="91"/>
<junction x="50.8" y="55.88"/>
<pinref part="SV2" gate="G$1" pin="3"/>
<wire x1="40.64" y1="55.88" x2="45.72" y2="55.88" width="0.1524" layer="91"/>
<wire x1="45.72" y1="55.88" x2="50.8" y2="55.88" width="0.1524" layer="91"/>
<wire x1="40.64" y1="55.88" x2="40.64" y2="58.42" width="0.1524" layer="91"/>
<junction x="40.64" y="55.88"/>
<wire x1="40.64" y1="58.42" x2="40.64" y2="66.04" width="0.1524" layer="91"/>
<wire x1="40.64" y1="58.42" x2="17.78" y2="58.42" width="0.1524" layer="91"/>
<junction x="40.64" y="58.42"/>
<label x="17.78" y="58.42" size="1.778" layer="95"/>
<pinref part="R17" gate="G$1" pin="2"/>
<pinref part="R9" gate="G$1" pin="2"/>
<junction x="45.72" y="55.88"/>
<pinref part="U10" gate="G$1" pin="!CSB"/>
<pinref part="U10" gate="G$1" pin="VDD"/>
<pinref part="C12" gate="G$1" pin="1"/>
<wire x1="96.52" y1="48.26" x2="96.52" y2="53.34" width="0.1524" layer="91"/>
<junction x="96.52" y="55.88"/>
<pinref part="C18" gate="G$1" pin="1"/>
<pinref part="U10" gate="G$1" pin="VDDIO"/>
<wire x1="96.52" y1="53.34" x2="96.52" y2="55.88" width="0.1524" layer="91"/>
<wire x1="88.9" y1="48.26" x2="88.9" y2="53.34" width="0.1524" layer="91"/>
<wire x1="88.9" y1="53.34" x2="96.52" y2="53.34" width="0.1524" layer="91"/>
<junction x="88.9" y="53.34"/>
<junction x="96.52" y="53.34"/>
<wire x1="99.06" y1="53.34" x2="96.52" y2="53.34" width="0.1524" layer="91"/>
<pinref part="U13" gate="G$1" pin="VDD"/>
<wire x1="116.84" y1="53.34" x2="116.84" y2="60.96" width="0.1524" layer="91"/>
<wire x1="116.84" y1="60.96" x2="99.06" y2="60.96" width="0.1524" layer="91"/>
<junction x="99.06" y="60.96"/>
<pinref part="C14" gate="G$1" pin="1"/>
<wire x1="116.84" y1="53.34" x2="104.14" y2="53.34" width="0.1524" layer="91"/>
<wire x1="104.14" y1="53.34" x2="104.14" y2="48.26" width="0.1524" layer="91"/>
<junction x="116.84" y="53.34"/>
</segment>
<segment>
<pinref part="SV2" gate="G$1" pin="8"/>
<wire x1="35.56" y1="81.28" x2="35.56" y2="83.82" width="0.1524" layer="91"/>
<wire x1="35.56" y1="83.82" x2="17.78" y2="83.82" width="0.1524" layer="91"/>
<label x="17.78" y="83.82" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="U7" gate="G$1" pin="VIN"/>
<wire x1="-101.6" y1="167.64" x2="-101.6" y2="154.94" width="0.1524" layer="91"/>
<wire x1="-101.6" y1="154.94" x2="-137.16" y2="154.94" width="0.1524" layer="91"/>
<pinref part="+3V5" gate="G$1" pin="+3V3"/>
</segment>
<segment>
<pinref part="U9" gate="G$1" pin="VREF2"/>
<wire x1="35.56" y1="-2.54" x2="30.48" y2="-2.54" width="0.1524" layer="91"/>
<wire x1="30.48" y1="-2.54" x2="25.4" y2="-2.54" width="0.1524" layer="91"/>
<wire x1="25.4" y1="-2.54" x2="25.4" y2="10.16" width="0.1524" layer="91"/>
<pinref part="+3V6" gate="G$1" pin="+3V3"/>
<pinref part="U9" gate="G$1" pin="EN"/>
<wire x1="30.48" y1="-2.54" x2="30.48" y2="-7.62" width="0.1524" layer="91"/>
<wire x1="30.48" y1="-7.62" x2="35.56" y2="-7.62" width="0.1524" layer="91"/>
<junction x="30.48" y="-2.54"/>
<pinref part="R5" gate="G$1" pin="1"/>
<wire x1="20.32" y1="-5.08" x2="20.32" y2="-7.62" width="0.1524" layer="91"/>
<wire x1="20.32" y1="-7.62" x2="30.48" y2="-7.62" width="0.1524" layer="91"/>
<junction x="30.48" y="-7.62"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<pinref part="Q1" gate="G$1" pin="B"/>
<wire x1="-124.46" y1="-17.78" x2="-129.54" y2="-17.78" width="0.1524" layer="91"/>
<pinref part="R26" gate="G$1" pin="2"/>
</segment>
</net>
<net name="N$11" class="0">
<segment>
<pinref part="Q2" gate="G$1" pin="B"/>
<wire x1="-124.46" y1="-40.64" x2="-129.54" y2="-40.64" width="0.1524" layer="91"/>
<pinref part="R4" gate="G$1" pin="2"/>
</segment>
</net>
<net name="EN" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="EN"/>
<wire x1="-45.72" y1="-2.54" x2="-55.88" y2="-2.54" width="0.1524" layer="91"/>
<label x="-55.88" y="-2.54" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="Q1" gate="G$1" pin="C"/>
<wire x1="-114.3" y1="-10.16" x2="-114.3" y2="-7.62" width="0.1524" layer="91"/>
<wire x1="-114.3" y1="-7.62" x2="-96.52" y2="-7.62" width="0.1524" layer="91"/>
<label x="-99.06" y="-7.62" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="104.14" y1="109.22" x2="109.22" y2="109.22" width="0.1524" layer="91"/>
<label x="106.68" y="109.22" size="1.778" layer="95"/>
<pinref part="R16" gate="G$1" pin="1"/>
</segment>
</net>
<net name="IO0" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="GPIO0"/>
<wire x1="-15.24" y1="-33.02" x2="-5.08" y2="-33.02" width="0.1524" layer="91"/>
<label x="-7.62" y="-33.02" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="Q2" gate="G$1" pin="C"/>
<wire x1="-114.3" y1="-48.26" x2="-114.3" y2="-50.8" width="0.1524" layer="91"/>
<wire x1="-114.3" y1="-50.8" x2="-96.52" y2="-50.8" width="0.1524" layer="91"/>
<label x="-99.06" y="-50.8" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="104.14" y1="86.36" x2="109.22" y2="86.36" width="0.1524" layer="91"/>
<label x="104.14" y="86.36" size="1.778" layer="95"/>
<pinref part="R15" gate="G$1" pin="1"/>
</segment>
</net>
<net name="RTS" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="!RTS"/>
<wire x1="-50.8" y1="53.34" x2="-58.42" y2="53.34" width="0.1524" layer="91"/>
<label x="-58.42" y="53.34" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="-139.7" y1="-40.64" x2="-144.78" y2="-40.64" width="0.1524" layer="91"/>
<pinref part="Q1" gate="G$1" pin="E"/>
<wire x1="-144.78" y1="-40.64" x2="-160.02" y2="-40.64" width="0.1524" layer="91"/>
<wire x1="-114.3" y1="-25.4" x2="-114.3" y2="-27.94" width="0.1524" layer="91"/>
<wire x1="-114.3" y1="-27.94" x2="-144.78" y2="-27.94" width="0.1524" layer="91"/>
<wire x1="-144.78" y1="-27.94" x2="-144.78" y2="-40.64" width="0.1524" layer="91"/>
<junction x="-144.78" y="-40.64"/>
<label x="-160.02" y="-40.64" size="1.778" layer="95"/>
<pinref part="R4" gate="G$1" pin="1"/>
</segment>
<segment>
<wire x1="-134.62" y1="15.24" x2="-121.92" y2="15.24" width="0.1524" layer="91"/>
<label x="-127" y="15.24" size="1.778" layer="95"/>
<pinref part="R6" gate="G$1" pin="2"/>
</segment>
</net>
<net name="DTR" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="!DTR"/>
<wire x1="-50.8" y1="45.72" x2="-58.42" y2="45.72" width="0.1524" layer="91"/>
<label x="-58.42" y="45.72" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="-139.7" y1="-17.78" x2="-147.32" y2="-17.78" width="0.1524" layer="91"/>
<pinref part="Q2" gate="G$1" pin="E"/>
<wire x1="-147.32" y1="-17.78" x2="-160.02" y2="-17.78" width="0.1524" layer="91"/>
<wire x1="-114.3" y1="-33.02" x2="-114.3" y2="-30.48" width="0.1524" layer="91"/>
<wire x1="-114.3" y1="-30.48" x2="-147.32" y2="-30.48" width="0.1524" layer="91"/>
<wire x1="-147.32" y1="-30.48" x2="-147.32" y2="-17.78" width="0.1524" layer="91"/>
<junction x="-147.32" y="-17.78"/>
<label x="-160.02" y="-17.78" size="1.778" layer="95"/>
<label x="-160.02" y="-17.78" size="1.778" layer="95"/>
<label x="-160.02" y="-17.78" size="1.778" layer="95"/>
<label x="-160.02" y="-17.78" size="1.778" layer="95"/>
<pinref part="R26" gate="G$1" pin="1"/>
</segment>
</net>
<net name="VBUS" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="VBUS"/>
<wire x1="-50.8" y1="66.04" x2="-58.42" y2="66.04" width="0.1524" layer="91"/>
<label x="-58.42" y="66.04" size="1.778" layer="95"/>
</segment>
<segment>
<wire x1="-88.9" y1="20.32" x2="-81.28" y2="20.32" width="0.1524" layer="91"/>
<wire x1="-81.28" y1="20.32" x2="-81.28" y2="15.24" width="0.1524" layer="91"/>
<wire x1="-81.28" y1="15.24" x2="-81.28" y2="10.16" width="0.1524" layer="91"/>
<wire x1="-81.28" y1="10.16" x2="-88.9" y2="10.16" width="0.1524" layer="91"/>
<label x="-78.74" y="15.24" size="1.778" layer="95"/>
<wire x1="-81.28" y1="15.24" x2="-71.12" y2="15.24" width="0.1524" layer="91"/>
<junction x="-81.28" y="15.24"/>
<pinref part="P+3" gate="1" pin="+5V"/>
<wire x1="-81.28" y1="22.86" x2="-81.28" y2="20.32" width="0.1524" layer="91"/>
<pinref part="C6" gate="G$1" pin="2"/>
<pinref part="C7" gate="G$1" pin="1"/>
</segment>
</net>
<net name="RXD" class="0">
<segment>
<wire x1="-134.62" y1="30.48" x2="-121.92" y2="30.48" width="0.1524" layer="91"/>
<label x="-127" y="30.48" size="1.778" layer="95"/>
<pinref part="R3" gate="G$1" pin="2"/>
</segment>
<segment>
<pinref part="U3" gate="G$1" pin="RXD"/>
<wire x1="-50.8" y1="40.64" x2="-58.42" y2="40.64" width="0.1524" layer="91"/>
<label x="-58.42" y="40.64" size="1.778" layer="95"/>
</segment>
</net>
<net name="TXD" class="0">
<segment>
<wire x1="-134.62" y1="22.86" x2="-121.92" y2="22.86" width="0.1524" layer="91"/>
<label x="-127" y="22.86" size="1.778" layer="95"/>
<pinref part="R1" gate="G$1" pin="2"/>
</segment>
<segment>
<wire x1="-66.04" y1="38.1" x2="-71.12" y2="38.1" width="0.1524" layer="91"/>
<label x="-71.12" y="38.1" size="1.778" layer="95"/>
<pinref part="R28" gate="G$1" pin="1"/>
</segment>
</net>
<net name="CTS" class="0">
<segment>
<wire x1="-134.62" y1="7.62" x2="-121.92" y2="7.62" width="0.1524" layer="91"/>
<label x="-127" y="7.62" size="1.778" layer="95"/>
<pinref part="R7" gate="G$1" pin="2"/>
</segment>
<segment>
<pinref part="U3" gate="G$1" pin="!CTS"/>
<wire x1="-50.8" y1="55.88" x2="-58.42" y2="55.88" width="0.1524" layer="91"/>
<label x="-58.42" y="55.88" size="1.778" layer="95"/>
</segment>
</net>
<net name="IO15" class="0">
<segment>
<wire x1="-144.78" y1="7.62" x2="-157.48" y2="7.62" width="0.1524" layer="91"/>
<label x="-157.48" y="7.62" size="1.778" layer="95"/>
<pinref part="R7" gate="G$1" pin="1"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="GPIO5"/>
<wire x1="-15.24" y1="-22.86" x2="-5.08" y2="-22.86" width="0.1524" layer="91"/>
<label x="-10.16" y="-22.86" size="1.778" layer="95"/>
</segment>
</net>
<net name="IO13" class="0">
<segment>
<wire x1="-144.78" y1="15.24" x2="-157.48" y2="15.24" width="0.1524" layer="91"/>
<label x="-157.48" y="15.24" size="1.778" layer="95"/>
<pinref part="R6" gate="G$1" pin="1"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="GPIO13"/>
<wire x1="-45.72" y1="-35.56" x2="-55.88" y2="-35.56" width="0.1524" layer="91"/>
<label x="-55.88" y="-35.56" size="1.778" layer="95"/>
</segment>
</net>
<net name="RXD0" class="0">
<segment>
<wire x1="-144.78" y1="22.86" x2="-157.48" y2="22.86" width="0.1524" layer="91"/>
<label x="-157.48" y="22.86" size="1.778" layer="95"/>
<pinref part="R1" gate="G$1" pin="1"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="RX"/>
<wire x1="-15.24" y1="-10.16" x2="-5.08" y2="-10.16" width="0.1524" layer="91"/>
<label x="-10.16" y="-10.16" size="1.778" layer="95"/>
</segment>
</net>
<net name="TXD0" class="0">
<segment>
<wire x1="-144.78" y1="30.48" x2="-157.48" y2="30.48" width="0.1524" layer="91"/>
<label x="-157.48" y="30.48" size="1.778" layer="95"/>
<pinref part="R3" gate="G$1" pin="1"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="TX"/>
<wire x1="-15.24" y1="-7.62" x2="-5.08" y2="-7.62" width="0.1524" layer="91"/>
<label x="-10.16" y="-7.62" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="TXD"/>
<wire x1="-50.8" y1="38.1" x2="-55.88" y2="38.1" width="0.1524" layer="91"/>
<pinref part="R28" gate="G$1" pin="2"/>
</segment>
</net>
<net name="DSR" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="!DSR"/>
<wire x1="-50.8" y1="50.8" x2="-58.42" y2="50.8" width="0.1524" layer="91"/>
<label x="-58.42" y="50.8" size="1.778" layer="95"/>
</segment>
</net>
<net name="SDA" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="GPIO21"/>
<wire x1="-15.24" y1="-12.7" x2="-5.08" y2="-12.7" width="0.1524" layer="91"/>
<label x="-10.16" y="-12.7" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="SV2" gate="G$1" pin="9"/>
<wire x1="33.02" y1="66.04" x2="33.02" y2="43.18" width="0.1524" layer="91"/>
<wire x1="33.02" y1="43.18" x2="38.1" y2="43.18" width="0.1524" layer="91"/>
<wire x1="38.1" y1="43.18" x2="58.42" y2="43.18" width="0.1524" layer="91"/>
<wire x1="33.02" y1="66.04" x2="17.78" y2="66.04" width="0.1524" layer="91"/>
<junction x="33.02" y="66.04"/>
<label x="17.78" y="66.04" size="1.778" layer="95"/>
<wire x1="38.1" y1="43.815" x2="38.1" y2="43.18" width="0.1524" layer="91"/>
<junction x="38.1" y="43.18"/>
<pinref part="R17" gate="G$1" pin="1"/>
<pinref part="U10" gate="G$1" pin="SDI"/>
</segment>
<segment>
<pinref part="U13" gate="G$1" pin="SDA"/>
<wire x1="116.84" y1="48.26" x2="111.76" y2="48.26" width="0.1524" layer="91"/>
<label x="111.76" y="48.26" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="U9" gate="G$1" pin="SDA2"/>
<wire x1="66.04" y1="-15.24" x2="73.66" y2="-15.24" width="0.1524" layer="91"/>
<label x="68.58" y="-15.24" size="1.778" layer="95"/>
</segment>
</net>
<net name="SCL" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="GPIO22"/>
<wire x1="-15.24" y1="-5.08" x2="-5.08" y2="-5.08" width="0.1524" layer="91"/>
<label x="-10.16" y="-5.08" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="SV2" gate="G$1" pin="7"/>
<wire x1="58.42" y1="45.72" x2="45.72" y2="45.72" width="0.1524" layer="91"/>
<wire x1="45.72" y1="45.72" x2="35.56" y2="45.72" width="0.1524" layer="91"/>
<wire x1="35.56" y1="45.72" x2="35.56" y2="63.5" width="0.1524" layer="91"/>
<wire x1="35.56" y1="63.5" x2="35.56" y2="66.04" width="0.1524" layer="91"/>
<wire x1="35.56" y1="63.5" x2="17.78" y2="63.5" width="0.1524" layer="91"/>
<junction x="35.56" y="63.5"/>
<label x="17.78" y="63.5" size="1.778" layer="95"/>
<pinref part="R9" gate="G$1" pin="1"/>
<junction x="45.72" y="45.72"/>
<pinref part="U10" gate="G$1" pin="SCK"/>
</segment>
<segment>
<pinref part="U13" gate="G$1" pin="SCL"/>
<wire x1="116.84" y1="40.64" x2="111.76" y2="40.64" width="0.1524" layer="91"/>
<label x="111.76" y="40.64" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="U9" gate="G$1" pin="SCL2"/>
<wire x1="66.04" y1="-12.7" x2="73.66" y2="-12.7" width="0.1524" layer="91"/>
<label x="68.58" y="-12.7" size="1.778" layer="95"/>
</segment>
</net>
<net name="INT" class="0">
<segment>
<pinref part="SV2" gate="G$1" pin="5"/>
<wire x1="38.1" y1="66.04" x2="38.1" y2="60.96" width="0.1524" layer="91"/>
<wire x1="38.1" y1="60.96" x2="17.78" y2="60.96" width="0.1524" layer="91"/>
<label x="17.78" y="60.96" size="1.778" layer="95"/>
</segment>
</net>
<net name="IO27" class="0">
<segment>
<pinref part="SV2" gate="G$1" pin="4"/>
<wire x1="40.64" y1="81.28" x2="40.64" y2="88.9" width="0.1524" layer="91"/>
<wire x1="40.64" y1="88.9" x2="17.78" y2="88.9" width="0.1524" layer="91"/>
<label x="17.78" y="88.9" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="GPIO27"/>
<wire x1="-45.72" y1="-25.4" x2="-55.88" y2="-25.4" width="0.1524" layer="91"/>
<label x="-55.88" y="-25.4" size="1.778" layer="95"/>
</segment>
</net>
<net name="IO26" class="0">
<segment>
<pinref part="SV2" gate="G$1" pin="6"/>
<wire x1="38.1" y1="81.28" x2="38.1" y2="86.36" width="0.1524" layer="91"/>
<wire x1="38.1" y1="86.36" x2="17.78" y2="86.36" width="0.1524" layer="91"/>
<label x="17.78" y="86.36" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="GPIO26"/>
<wire x1="-45.72" y1="-22.86" x2="-55.88" y2="-22.86" width="0.1524" layer="91"/>
<label x="-55.88" y="-22.86" size="1.778" layer="95"/>
</segment>
</net>
<net name="IO25" class="0">
<segment>
<pinref part="SV2" gate="G$1" pin="10"/>
<wire x1="33.02" y1="81.28" x2="17.78" y2="81.28" width="0.1524" layer="91"/>
<label x="17.78" y="81.28" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="U$1" gate="G$1" pin="GPIO25"/>
<wire x1="-45.72" y1="-20.32" x2="-55.88" y2="-20.32" width="0.1524" layer="91"/>
<label x="-55.88" y="-20.32" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="GPIO23"/>
<wire x1="-15.24" y1="-2.54" x2="-5.08" y2="-2.54" width="0.1524" layer="91"/>
</segment>
</net>
<net name="IO14" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="GPIO14"/>
<wire x1="-45.72" y1="-27.94" x2="-55.88" y2="-27.94" width="0.1524" layer="91"/>
<label x="-55.88" y="-27.94" size="1.778" layer="95"/>
</segment>
</net>
<net name="IO19" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="GPIO19"/>
<wire x1="-15.24" y1="-17.78" x2="-5.08" y2="-17.78" width="0.1524" layer="91"/>
<label x="-10.16" y="-17.78" size="1.778" layer="95"/>
</segment>
</net>
<net name="N$14" class="0">
<segment>
<wire x1="78.74" y1="101.6" x2="91.44" y2="101.6" width="0.1524" layer="91"/>
<wire x1="91.44" y1="101.6" x2="91.44" y2="109.22" width="0.1524" layer="91"/>
<pinref part="U6" gate="G$1" pin="4"/>
<wire x1="91.44" y1="109.22" x2="83.82" y2="109.22" width="0.1524" layer="91"/>
<wire x1="91.44" y1="109.22" x2="93.98" y2="109.22" width="0.1524" layer="91"/>
<junction x="91.44" y="109.22"/>
<pinref part="R16" gate="G$1" pin="2"/>
<pinref part="C2" gate="G$1" pin="2"/>
</segment>
</net>
<net name="N$19" class="0">
<segment>
<wire x1="78.74" y1="78.74" x2="91.44" y2="78.74" width="0.1524" layer="91"/>
<pinref part="U5" gate="G$1" pin="4"/>
<wire x1="91.44" y1="78.74" x2="91.44" y2="86.36" width="0.1524" layer="91"/>
<wire x1="91.44" y1="86.36" x2="83.82" y2="86.36" width="0.1524" layer="91"/>
<wire x1="91.44" y1="86.36" x2="93.98" y2="86.36" width="0.1524" layer="91"/>
<junction x="91.44" y="86.36"/>
<pinref part="R15" gate="G$1" pin="2"/>
<pinref part="C10" gate="G$1" pin="2"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<pinref part="D1" gate="G$1" pin="A"/>
<pinref part="R22" gate="G$1" pin="1"/>
<wire x1="-137.16" y1="116.84" x2="-137.16" y2="121.92" width="0.1524" layer="91"/>
</segment>
</net>
<net name="1.8V" class="0">
<segment>
<pinref part="U7" gate="G$1" pin="VOUT"/>
<wire x1="-106.68" y1="167.64" x2="-106.68" y2="160.02" width="0.1524" layer="91"/>
<wire x1="-106.68" y1="160.02" x2="-66.04" y2="160.02" width="0.1524" layer="91"/>
<pinref part="P+4" gate="VCC" pin="VCC"/>
<label x="-68.58" y="165.1" size="1.778" layer="95"/>
</segment>
</net>
<net name="VCC" class="0">
<segment>
<pinref part="U9" gate="G$1" pin="VREF1"/>
<wire x1="35.56" y1="0" x2="30.48" y2="0" width="0.1524" layer="91"/>
<wire x1="30.48" y1="0" x2="30.48" y2="5.08" width="0.1524" layer="91"/>
<pinref part="P+5" gate="VCC" pin="VCC"/>
<pinref part="R5" gate="G$1" pin="2"/>
<wire x1="30.48" y1="5.08" x2="30.48" y2="10.16" width="0.1524" layer="91"/>
<wire x1="20.32" y1="5.08" x2="30.48" y2="5.08" width="0.1524" layer="91"/>
<junction x="30.48" y="5.08"/>
</segment>
<segment>
<pinref part="U11" gate="G$1" pin="VDD"/>
<pinref part="C15" gate="G$1" pin="1"/>
<wire x1="121.92" y1="-10.16" x2="127" y2="-10.16" width="0.1524" layer="91"/>
<wire x1="127" y1="-10.16" x2="137.16" y2="-10.16" width="0.1524" layer="91"/>
<wire x1="137.16" y1="-10.16" x2="137.16" y2="-12.7" width="0.1524" layer="91"/>
<wire x1="127" y1="-10.16" x2="127" y2="-5.08" width="0.1524" layer="91"/>
<junction x="127" y="-10.16"/>
<pinref part="P+6" gate="VCC" pin="VCC"/>
</segment>
</net>
<net name="SCL1.8" class="0">
<segment>
<pinref part="U9" gate="G$1" pin="SCL1"/>
<wire x1="35.56" y1="-12.7" x2="22.86" y2="-12.7" width="0.1524" layer="91"/>
<label x="22.86" y="-12.7" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="U11" gate="G$1" pin="SCL"/>
<wire x1="91.44" y1="-10.16" x2="86.36" y2="-10.16" width="0.1524" layer="91"/>
<label x="83.82" y="-10.16" size="1.778" layer="95"/>
</segment>
</net>
<net name="SDA1.8" class="0">
<segment>
<pinref part="U9" gate="G$1" pin="SDA1"/>
<wire x1="35.56" y1="-15.24" x2="22.86" y2="-15.24" width="0.1524" layer="91"/>
<label x="22.86" y="-15.24" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="U11" gate="G$1" pin="SDA"/>
<wire x1="91.44" y1="-15.24" x2="86.36" y2="-15.24" width="0.1524" layer="91"/>
<label x="83.82" y="-15.24" size="1.778" layer="95"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
<compatibility>
<note version="8.2" severity="warning">
Since Version 8.2, EAGLE supports online libraries. The ids
of those online libraries will not be understood (or retained)
with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports URNs for individual library
assets (packages, symbols, and devices). The URNs of those assets
will not be understood (or retained) with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports the association of 3D packages
with devices in libraries, schematics, and board files. Those 3D
packages will not be understood (or retained) with this version.
</note>
</compatibility>
</eagle>
