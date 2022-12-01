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
<library name="AS7341-DLGT">
<description>&lt;Ambient Light Sensors AS7341-DLGT OLGA8 LF T&amp;RDP&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by SamacSys&lt;/author&gt;</description>
<packages>
<package name="AS7341DLGT">
<description>&lt;b&gt;AS7341-DLGT-3&lt;/b&gt;&lt;br&gt;
</description>
<smd name="1" x="-0.638" y="1.2" dx="0.575" dy="0.488" layer="1"/>
<smd name="2" x="-0.638" y="0.4" dx="0.575" dy="0.488" layer="1"/>
<smd name="3" x="-0.638" y="-0.4" dx="0.575" dy="0.488" layer="1"/>
<smd name="4" x="-0.638" y="-1.2" dx="0.575" dy="0.488" layer="1"/>
<smd name="5" x="0.638" y="-1.2" dx="0.575" dy="0.488" layer="1"/>
<smd name="6" x="0.638" y="-0.4" dx="0.575" dy="0.488" layer="1"/>
<smd name="7" x="0.638" y="0.4" dx="0.575" dy="0.488" layer="1"/>
<smd name="8" x="0.638" y="1.2" dx="0.575" dy="0.488" layer="1"/>
<text x="-0.2" y="0" size="1.27" layer="25" align="center">&gt;NAME</text>
<text x="-0.2" y="0" size="1.27" layer="27" align="center">&gt;VALUE</text>
<wire x1="-1" y1="1.55" x2="1" y2="1.55" width="0.2" layer="51"/>
<wire x1="1" y1="1.55" x2="1" y2="-1.55" width="0.2" layer="51"/>
<wire x1="1" y1="-1.55" x2="-1" y2="-1.55" width="0.2" layer="51"/>
<wire x1="-1" y1="-1.55" x2="-1" y2="1.55" width="0.2" layer="51"/>
<wire x1="-1.1" y1="1.6" x2="1.1" y2="1.6" width="0.1" layer="21"/>
<wire x1="1.1" y1="1.6" x2="1.1" y2="-1.6" width="0.1" layer="21"/>
<wire x1="1.1" y1="-1.6" x2="-1.1" y2="-1.6" width="0.1" layer="21"/>
<wire x1="-1.1" y1="-1.6" x2="-1.1" y2="1.6" width="0.1" layer="21"/>
<wire x1="-2.5" y1="2.6" x2="2.1" y2="2.6" width="0.1" layer="51"/>
<wire x1="2.1" y1="2.6" x2="2.1" y2="-2.6" width="0.1" layer="51"/>
<wire x1="2.1" y1="-2.6" x2="-2.5" y2="-2.6" width="0.1" layer="51"/>
<wire x1="-2.5" y1="-2.6" x2="-2.5" y2="2.6" width="0.1" layer="51"/>
<wire x1="-1.4" y1="1.2" x2="-1.4" y2="1.2" width="0.1" layer="21"/>
<wire x1="-1.4" y1="1.2" x2="-1.5" y2="1.2" width="0.1" layer="21" curve="180"/>
<wire x1="-1.5" y1="1.2" x2="-1.5" y2="1.2" width="0.1" layer="21"/>
<wire x1="-1.5" y1="1.2" x2="-1.4" y2="1.2" width="0.1" layer="21" curve="180"/>
</package>
</packages>
<symbols>
<symbol name="AS7341-DLGT">
<wire x1="5.08" y1="2.54" x2="22.86" y2="2.54" width="0.254" layer="94"/>
<wire x1="22.86" y1="-10.16" x2="22.86" y2="2.54" width="0.254" layer="94"/>
<wire x1="22.86" y1="-10.16" x2="5.08" y2="-10.16" width="0.254" layer="94"/>
<wire x1="5.08" y1="2.54" x2="5.08" y2="-10.16" width="0.254" layer="94"/>
<text x="24.13" y="7.62" size="1.778" layer="95" align="center-left">&gt;NAME</text>
<text x="24.13" y="5.08" size="1.778" layer="96" align="center-left">&gt;VALUE</text>
<pin name="VDD" x="0" y="0" length="middle"/>
<pin name="SCL" x="0" y="-2.54" length="middle"/>
<pin name="GND" x="0" y="-5.08" length="middle"/>
<pin name="LDR" x="0" y="-7.62" length="middle"/>
<pin name="PGND" x="27.94" y="-7.62" length="middle" rot="R180"/>
<pin name="GPIO" x="27.94" y="-5.08" length="middle" rot="R180"/>
<pin name="INT" x="27.94" y="-2.54" length="middle" rot="R180"/>
<pin name="SDA" x="27.94" y="0" length="middle" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="AS7341-DLGT" prefix="IC">
<description>&lt;b&gt;Ambient Light Sensors AS7341-DLGT OLGA8 LF T&amp;RDP&lt;/b&gt;&lt;p&gt;
Source: &lt;a href="https://www.mouser.com/catalog/specsheets/AMS_03152019_AS7341_DS000504_1-00.pdf"&gt; Datasheet &lt;/a&gt;</description>
<gates>
<gate name="G$1" symbol="AS7341-DLGT" x="0" y="0"/>
</gates>
<devices>
<device name="" package="AS7341DLGT">
<connects>
<connect gate="G$1" pin="GND" pad="3"/>
<connect gate="G$1" pin="GPIO" pad="6"/>
<connect gate="G$1" pin="INT" pad="7"/>
<connect gate="G$1" pin="LDR" pad="4"/>
<connect gate="G$1" pin="PGND" pad="5"/>
<connect gate="G$1" pin="SCL" pad="2"/>
<connect gate="G$1" pin="SDA" pad="8"/>
<connect gate="G$1" pin="VDD" pad="1"/>
</connects>
<technologies>
<technology name="">
<attribute name="ARROW_PART_NUMBER" value="AS7341-DLGT" constant="no"/>
<attribute name="ARROW_PRICE-STOCK" value="https://www.arrow.com/en/products/as7341-dlgt/ams-ag" constant="no"/>
<attribute name="DESCRIPTION" value="Ambient Light Sensors AS7341-DLGT OLGA8 LF T&amp;RDP" constant="no"/>
<attribute name="HEIGHT" value="1.1mm" constant="no"/>
<attribute name="MANUFACTURER_NAME" value="ams" constant="no"/>
<attribute name="MANUFACTURER_PART_NUMBER" value="AS7341-DLGT" constant="no"/>
<attribute name="MOUSER_PART_NUMBER" value="985-AS7341-DLGT" constant="no"/>
<attribute name="MOUSER_PRICE-STOCK" value="https://www.mouser.co.uk/ProductDetail/ams/AS7341-DLGT/?qs=byeeYqUIh0Mv1a0BhdN%2FNw%3D%3D" constant="no"/>
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
<library name="SPH0645LM4H-B">
<packages>
<package name="MIC_SPH0645LM4H-B">
<wire x1="1.325" y1="0.7" x2="1.325" y2="-1.04" width="0.127" layer="21"/>
<wire x1="1.325" y1="-1.04" x2="-1.325" y2="-1.04" width="0.127" layer="21"/>
<wire x1="-1.325" y1="-1.04" x2="-1.325" y2="0.7" width="0.127" layer="21"/>
<circle x="-1.578" y="2.232" radius="0.05" width="0.1" layer="21"/>
<wire x1="-1.325" y1="2.46" x2="1.325" y2="2.46" width="0.127" layer="51"/>
<wire x1="1.325" y1="2.46" x2="1.325" y2="-1.04" width="0.127" layer="51"/>
<wire x1="1.325" y1="-1.04" x2="-1.325" y2="-1.04" width="0.127" layer="51"/>
<wire x1="-1.325" y1="-1.04" x2="-1.325" y2="2.46" width="0.127" layer="51"/>
<wire x1="-1.651" y1="2.794" x2="1.651" y2="2.794" width="0.05" layer="39"/>
<wire x1="1.651" y1="2.794" x2="1.651" y2="-1.397" width="0.05" layer="39"/>
<wire x1="1.651" y1="-1.397" x2="-1.651" y2="-1.397" width="0.05" layer="39"/>
<wire x1="-1.651" y1="-1.397" x2="-1.651" y2="2.794" width="0.05" layer="39"/>
<text x="-1.71363125" y="2.78905" size="0.612684375" layer="25">&gt;NAME</text>
<text x="-1.71198125" y="-2.04835" size="0.612096875" layer="27">&gt;VALUE</text>
<circle x="0" y="0" radius="0.456" width="0.912" layer="29"/>
<polygon width="0.001" layer="31">
<vertex x="-0.53" y="-0.385"/>
<vertex x="-0.43" y="-0.285"/>
<vertex x="-0.465" y="-0.23"/>
<vertex x="-0.505" y="-0.12"/>
<vertex x="-0.51" y="-0.12"/>
<vertex x="-0.505" y="-0.11"/>
<vertex x="-0.52" y="-0.005"/>
<vertex x="-0.523603125" y="0.005"/>
<vertex x="-0.52" y="0.005"/>
<vertex x="-0.505" y="0.125"/>
<vertex x="-0.4615375" y="0.224609375"/>
<vertex x="-0.426171875" y="0.292665625"/>
<vertex x="-0.525" y="0.39"/>
<vertex x="-0.635" y="0.505"/>
<vertex x="-0.7" y="0.41"/>
<vertex x="-0.75" y="0.31"/>
<vertex x="-0.78" y="0.22"/>
<vertex x="-0.8" y="0.14"/>
<vertex x="-0.81" y="0"/>
<vertex x="-0.796203125" y="-0.160190625"/>
<vertex x="-0.75" y="-0.31"/>
<vertex x="-0.705" y="-0.4"/>
<vertex x="-0.640309375" y="-0.499765625"/>
</polygon>
<polygon width="0.001" layer="31">
<vertex x="0.38" y="-0.53"/>
<vertex x="0.28" y="-0.425"/>
<vertex x="0.23" y="-0.46"/>
<vertex x="0.12" y="-0.5"/>
<vertex x="0" y="-0.513603125"/>
<vertex x="-0.12" y="-0.5"/>
<vertex x="-0.224609375" y="-0.4615375"/>
<vertex x="-0.287665625" y="-0.426171875"/>
<vertex x="-0.385" y="-0.525"/>
<vertex x="-0.5" y="-0.64"/>
<vertex x="-0.405" y="-0.705"/>
<vertex x="-0.31" y="-0.75"/>
<vertex x="-0.22" y="-0.78"/>
<vertex x="-0.14" y="-0.8"/>
<vertex x="0" y="-0.81"/>
<vertex x="0.160190625" y="-0.796203125"/>
<vertex x="0.31" y="-0.75"/>
<vertex x="0.425" y="-0.69"/>
<vertex x="0.494765625" y="-0.645309375"/>
</polygon>
<polygon width="0.001" layer="31">
<vertex x="0.53" y="0.385"/>
<vertex x="0.425" y="0.28"/>
<vertex x="0.46" y="0.23"/>
<vertex x="0.5" y="0.12"/>
<vertex x="0.513603125" y="0"/>
<vertex x="0.5" y="-0.12"/>
<vertex x="0.4615375" y="-0.224609375"/>
<vertex x="0.421171875" y="-0.282665625"/>
<vertex x="0.52" y="-0.38"/>
<vertex x="0.64" y="-0.5"/>
<vertex x="0.705" y="-0.405"/>
<vertex x="0.75" y="-0.31"/>
<vertex x="0.78" y="-0.23"/>
<vertex x="0.8" y="-0.14"/>
<vertex x="0.81" y="-0.06"/>
<vertex x="0.81" y="0.065"/>
<vertex x="0.796203125" y="0.160190625"/>
<vertex x="0.78" y="0.235"/>
<vertex x="0.75" y="0.31"/>
<vertex x="0.705" y="0.405"/>
<vertex x="0.640309375" y="0.499765625"/>
</polygon>
<polygon width="0.001" layer="31">
<vertex x="-0.375" y="0.53"/>
<vertex x="-0.28" y="0.435"/>
<vertex x="-0.23" y="0.46"/>
<vertex x="-0.175" y="0.485"/>
<vertex x="-0.12" y="0.5"/>
<vertex x="-0.06" y="0.51"/>
<vertex x="0" y="0.513603125"/>
<vertex x="0.12" y="0.5"/>
<vertex x="0.224609375" y="0.4615375"/>
<vertex x="0.282665625" y="0.426171875"/>
<vertex x="0.385" y="0.525"/>
<vertex x="0.5" y="0.64"/>
<vertex x="0.41" y="0.7"/>
<vertex x="0.31" y="0.75"/>
<vertex x="0.23" y="0.78"/>
<vertex x="0.14" y="0.8"/>
<vertex x="0" y="0.81"/>
<vertex x="-0.160190625" y="0.796203125"/>
<vertex x="-0.31" y="0.75"/>
<vertex x="-0.415" y="0.7"/>
<vertex x="-0.489765625" y="0.645309375"/>
</polygon>
<polygon width="0.001" layer="1">
<vertex x="-0.01" y="0.51"/>
<vertex x="-0.01" y="0.81" curve="90"/>
<vertex x="-0.81" y="0.02" curve="90"/>
<vertex x="0.02" y="-0.81"/>
<vertex x="0.03" y="-0.81" curve="90"/>
<vertex x="0.81" y="-0.03"/>
<vertex x="0.81" y="0" curve="90"/>
<vertex x="0" y="0.81"/>
<vertex x="0" y="0.51" curve="-90"/>
<vertex x="0.51" y="0.01" curve="-90"/>
<vertex x="-0.01" y="-0.51"/>
<vertex x="-0.02" y="-0.51" curve="-90"/>
<vertex x="-0.51" y="-0.02"/>
<vertex x="-0.51" y="0.01" curve="-90"/>
</polygon>
<smd name="2" x="-0.9" y="1.252" dx="0.6" dy="0.522" layer="1"/>
<smd name="1" x="-0.9" y="2.074" dx="0.6" dy="0.522" layer="1"/>
<smd name="6" x="0" y="2.074" dx="0.6" dy="0.522" layer="1"/>
<smd name="5" x="0.9" y="2.074" dx="0.6" dy="0.522" layer="1"/>
<smd name="4" x="0.9" y="1.252" dx="0.6" dy="0.522" layer="1"/>
<smd name="3" x="0.65" y="0.02" dx="0.1" dy="0.1" layer="1" stop="no" cream="no"/>
<hole x="0" y="0" drill="0.5"/>
</package>
</packages>
<symbols>
<symbol name="SPH0645LM4H-B">
<wire x1="-12.7" y1="7.62" x2="12.7" y2="7.62" width="0.254" layer="94"/>
<wire x1="12.7" y1="7.62" x2="12.7" y2="-7.62" width="0.254" layer="94"/>
<wire x1="12.7" y1="-7.62" x2="-12.7" y2="-7.62" width="0.254" layer="94"/>
<wire x1="-12.7" y1="-7.62" x2="-12.7" y2="7.62" width="0.254" layer="94"/>
<text x="-12.7399" y="8.1466" size="1.78358125" layer="95">&gt;NAME</text>
<text x="-12.7473" y="-10.1926" size="1.7846" layer="96">&gt;VALUE</text>
<pin name="WS" x="-17.78" y="2.54" length="middle" direction="in"/>
<pin name="SELECT" x="-17.78" y="0" length="middle" direction="in"/>
<pin name="GND" x="17.78" y="-5.08" length="middle" direction="pwr" rot="R180"/>
<pin name="BCLK" x="-17.78" y="-2.54" length="middle" direction="in" function="clk"/>
<pin name="VDD" x="17.78" y="5.08" length="middle" direction="pwr" rot="R180"/>
<pin name="DATA_OUT" x="17.78" y="0" length="middle" direction="out" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="SPH0645LM4H-B" prefix="MK">
<description>Mic Mems Digital I2s Omni -26db </description>
<gates>
<gate name="G$1" symbol="SPH0645LM4H-B" x="0" y="0"/>
</gates>
<devices>
<device name="" package="MIC_SPH0645LM4H-B">
<connects>
<connect gate="G$1" pin="BCLK" pad="4"/>
<connect gate="G$1" pin="DATA_OUT" pad="6"/>
<connect gate="G$1" pin="GND" pad="3"/>
<connect gate="G$1" pin="SELECT" pad="2"/>
<connect gate="G$1" pin="VDD" pad="5"/>
<connect gate="G$1" pin="WS" pad="1"/>
</connects>
<technologies>
<technology name="">
<attribute name="DESCRIPTION" value=" 20Hz ~ 10kHz Digital, I²S Microphone MEMS (Silicon) 1.62V ~ 3.6V Omnidirectional (-26dB ±3dB @ 94dB SPL) Solder Pads "/>
<attribute name="DIGI-KEY_PART_NUMBER" value="423-1405-1-ND"/>
<attribute name="MF" value="Knowles"/>
<attribute name="MP" value="SPH0645LM4H-B"/>
<attribute name="PACKAGE" value="SIP-7 Bourns"/>
<attribute name="PURCHASE-URL" value="https://pricing.snapeda.com/search/part/SPH0645LM4H-B/?ref=eda"/>
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
<library name="VEML7700-TR">
<packages>
<package name="XDCR_VEML7700-TR">
<wire x1="-1.5" y1="3.4" x2="0.85" y2="3.4" width="0.127" layer="51"/>
<wire x1="-1.5" y1="-3.4" x2="0.85" y2="-3.4" width="0.127" layer="51"/>
<wire x1="-1.5" y1="3.4" x2="-1.5" y2="-3.4" width="0.127" layer="51"/>
<circle x="1.81448125" y="1.998109375" radius="0.1" width="0.2" layer="21"/>
<wire x1="0.85" y1="-3.4" x2="0.85" y2="3.4" width="0.127" layer="51"/>
<wire x1="-1.75" y1="-3.65" x2="1.5" y2="-3.65" width="0.05" layer="39"/>
<wire x1="1.5" y1="-3.65" x2="1.5" y2="3.65" width="0.05" layer="39"/>
<wire x1="-1.75" y1="3.65" x2="1.5" y2="3.65" width="0.05" layer="39"/>
<wire x1="-1.75" y1="3.65" x2="-1.75" y2="-3.65" width="0.05" layer="39"/>
<circle x="1.81448125" y="1.998109375" radius="0.1" width="0.2" layer="51"/>
<wire x1="0.85" y1="3.4" x2="-1.5" y2="3.4" width="0.127" layer="21"/>
<wire x1="-1.5" y1="3.4" x2="-1.5" y2="-3.4" width="0.127" layer="21"/>
<wire x1="-1.5" y1="-3.4" x2="0.85" y2="-3.4" width="0.127" layer="21"/>
<wire x1="0.85" y1="-3.4" x2="0.85" y2="-2.7" width="0.127" layer="21"/>
<wire x1="0.85" y1="3.4" x2="0.85" y2="2.7" width="0.127" layer="21"/>
<text x="-2.54" y="3.81" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-5.08" size="1.27" layer="27">&gt;VALUE</text>
<smd name="1" x="0.55" y="1.905" dx="1.4" dy="0.7" layer="1"/>
<smd name="2" x="0.55" y="0.635" dx="1.4" dy="0.7" layer="1"/>
<smd name="3" x="0.55" y="-0.635" dx="1.4" dy="0.7" layer="1"/>
<smd name="4" x="0.55" y="-1.905" dx="1.4" dy="0.7" layer="1"/>
</package>
</packages>
<symbols>
<symbol name="VEML7700-TR">
<wire x1="-12.7" y1="12.7" x2="12.7" y2="12.7" width="0.4064" layer="94"/>
<wire x1="12.7" y1="12.7" x2="12.7" y2="7.62" width="0.4064" layer="94"/>
<wire x1="12.7" y1="7.62" x2="12.7" y2="-7.62" width="0.4064" layer="94"/>
<wire x1="12.7" y1="-7.62" x2="12.7" y2="-12.7" width="0.4064" layer="94"/>
<wire x1="12.7" y1="-12.7" x2="-12.7" y2="-12.7" width="0.4064" layer="94"/>
<wire x1="-12.7" y1="-12.7" x2="-12.7" y2="-7.62" width="0.4064" layer="94"/>
<wire x1="-12.7" y1="-7.62" x2="-12.7" y2="7.62" width="0.4064" layer="94"/>
<wire x1="-12.7" y1="7.62" x2="-12.7" y2="12.7" width="0.4064" layer="94"/>
<wire x1="-11.43" y1="11.43" x2="-11.43" y2="7.62" width="0.254" layer="94"/>
<wire x1="-11.43" y1="7.62" x2="-11.43" y2="-7.62" width="0.254" layer="94"/>
<wire x1="-11.43" y1="-7.62" x2="-11.43" y2="-11.43" width="0.254" layer="94"/>
<wire x1="-11.43" y1="-11.43" x2="11.43" y2="-11.43" width="0.254" layer="94"/>
<wire x1="11.43" y1="-11.43" x2="11.43" y2="-7.62" width="0.254" layer="94"/>
<wire x1="11.43" y1="-7.62" x2="11.43" y2="7.62" width="0.254" layer="94"/>
<wire x1="11.43" y1="7.62" x2="11.43" y2="11.43" width="0.254" layer="94"/>
<wire x1="11.43" y1="11.43" x2="-11.43" y2="11.43" width="0.254" layer="94"/>
<wire x1="-7.366" y1="2.54" x2="-7.366" y2="3.81" width="0.254" layer="94"/>
<wire x1="-7.366" y1="1.27" x2="-7.366" y2="2.54" width="0.254" layer="94"/>
<wire x1="-7.366" y1="2.54" x2="-4.826" y2="3.81" width="0.254" layer="94"/>
<wire x1="-4.826" y1="3.81" x2="-4.826" y2="1.27" width="0.254" layer="94"/>
<wire x1="-4.826" y1="1.27" x2="-7.366" y2="2.54" width="0.254" layer="94"/>
<wire x1="-7.112" y1="4.826" x2="-6.604" y2="4.318" width="0.127" layer="94"/>
<wire x1="-6.604" y1="4.318" x2="-6.9596" y2="4.4704" width="0.127" layer="94"/>
<wire x1="-6.9596" y1="4.4704" x2="-6.7564" y2="4.699" width="0.127" layer="94"/>
<wire x1="-6.7564" y1="4.699" x2="-6.604" y2="4.318" width="0.127" layer="94"/>
<wire x1="-6.604" y1="5.08" x2="-6.096" y2="4.572" width="0.127" layer="94"/>
<wire x1="-6.096" y1="4.572" x2="-6.4516" y2="4.7244" width="0.127" layer="94"/>
<wire x1="-6.4516" y1="4.7244" x2="-6.2484" y2="4.953" width="0.127" layer="94"/>
<wire x1="-6.2484" y1="4.953" x2="-6.096" y2="4.572" width="0.127" layer="94"/>
<circle x="-10.16" y="10.16" radius="0.254" width="0.254" layer="94"/>
<circle x="-10.16" y="10.16" radius="0.127" width="0.254" layer="94"/>
<text x="-12.7" y="13.462" size="1.778" layer="95">&gt;NAME</text>
<text x="-12.7" y="-15.24" size="1.778" layer="96">&gt;VALUE</text>
<wire x1="-7.366" y1="2.54" x2="-8.89" y2="2.54" width="0.1524" layer="94"/>
<wire x1="-8.89" y1="2.54" x2="-8.89" y2="3.81" width="0.254" layer="94"/>
<wire x1="-8.89" y1="2.54" x2="-8.89" y2="1.27" width="0.254" layer="94"/>
<wire x1="-5.08" y1="10.16" x2="-10.16" y2="5.08" width="0.254" layer="94" curve="90"/>
<wire x1="-10.16" y1="5.08" x2="-10.16" y2="-5.08" width="0.254" layer="94"/>
<wire x1="-10.16" y1="-5.08" x2="-5.08" y2="-10.16" width="0.254" layer="94" curve="90"/>
<wire x1="-5.08" y1="-10.16" x2="5.08" y2="-10.16" width="0.254" layer="94"/>
<wire x1="5.08" y1="-10.16" x2="10.16" y2="-5.08" width="0.254" layer="94" curve="90"/>
<wire x1="10.16" y1="-5.08" x2="10.16" y2="5.08" width="0.254" layer="94"/>
<wire x1="10.16" y1="5.08" x2="5.08" y2="10.16" width="0.254" layer="94" curve="90"/>
<wire x1="5.08" y1="10.16" x2="-5.08" y2="10.16" width="0.254" layer="94"/>
<wire x1="-7.366" y1="2.54" x2="-2.8788" y2="2.52973125" width="0.1524" layer="94"/>
<wire x1="-2.91986875" y1="4.07426875" x2="-2.91986875" y2="1.02626875" width="0.254" layer="94"/>
<wire x1="-2.91986875" y1="1.02626875" x2="0" y2="1.016" width="0.254" layer="94"/>
<wire x1="0" y1="1.016" x2="2.54" y2="1.016" width="0.254" layer="94"/>
<wire x1="2.54" y1="1.016" x2="2.54" y2="2.54" width="0.254" layer="94"/>
<wire x1="2.54" y1="2.54" x2="2.54" y2="4.064" width="0.254" layer="94"/>
<wire x1="2.54" y1="4.064" x2="-2.91986875" y2="4.07426875" width="0.254" layer="94"/>
<wire x1="-3.835390625" y1="-1.26753125" x2="-3.835390625" y2="-4.06153125" width="0.254" layer="94"/>
<wire x1="-3.835390625" y1="-4.06153125" x2="0" y2="-4.064" width="0.254" layer="94"/>
<wire x1="0" y1="-4.064" x2="2.54" y2="-4.064" width="0.254" layer="94"/>
<wire x1="2.54" y1="-4.064" x2="2.54" y2="-2.54" width="0.254" layer="94"/>
<wire x1="2.54" y1="-2.54" x2="2.54" y2="-1.27" width="0.254" layer="94"/>
<wire x1="2.54" y1="-1.27" x2="0" y2="-1.27" width="0.254" layer="94"/>
<wire x1="0" y1="-1.27" x2="-3.835390625" y2="-1.26753125" width="0.254" layer="94"/>
<wire x1="-3.749" y1="-6.096" x2="-3.749" y2="-7.62" width="0.254" layer="94"/>
<wire x1="-3.749" y1="-7.62" x2="2.54" y2="-7.62" width="0.254" layer="94"/>
<wire x1="2.54" y1="-7.62" x2="2.54" y2="-6.096" width="0.254" layer="94"/>
<wire x1="2.54" y1="-6.096" x2="0" y2="-6.096" width="0.254" layer="94"/>
<wire x1="0" y1="-6.096" x2="-3.749" y2="-6.096" width="0.254" layer="94"/>
<wire x1="5.08" y1="7.874" x2="8.636" y2="7.874" width="0.254" layer="94"/>
<wire x1="8.636" y1="7.874" x2="8.636" y2="-7.62" width="0.254" layer="94"/>
<wire x1="8.636" y1="-7.62" x2="5.08" y2="-7.62" width="0.254" layer="94"/>
<wire x1="5.08" y1="-7.62" x2="5.08" y2="-2.54" width="0.254" layer="94"/>
<text x="-2.286" y="2.794" size="0.8128" layer="94">Low pass</text>
<text x="-1.016" y="1.524" size="0.8128" layer="94">filter</text>
<text x="-2.379909375" y="-2.525209375" size="0.8128" layer="94">Timing </text>
<text x="-2.94706875" y="-3.70645" size="0.8128" layer="94">controller</text>
<text x="-2.97923125" y="-7.30683125" size="0.8128" layer="94">Oscillator</text>
<text x="6.35" y="-3.048" size="0.8128" layer="94" rot="R90">Output buffer</text>
<text x="7.874" y="-3.048" size="0.8128" layer="94" rot="R90">I²C interface</text>
<text x="-5.588" y="4.318" size="0.6096" layer="94">ALS-PD</text>
<text x="-17.78" y="8.636" size="1.27" layer="94">SCL</text>
<text x="-17.78" y="-6.604" size="1.27" layer="94">VDD</text>
<text x="15.24" y="-6.604" size="1.27" layer="94">GND</text>
<text x="15.24" y="8.636" size="1.27" layer="94">SDA</text>
<wire x1="5.08" y1="-2.54" x2="5.08" y2="2.54" width="0.254" layer="94"/>
<wire x1="5.08" y1="2.54" x2="5.08" y2="7.874" width="0.254" layer="94"/>
<wire x1="2.54" y1="2.54" x2="4.915" y2="2.535" width="0.1524" layer="94"/>
<wire x1="5.08" y1="2.54" x2="4.915" y2="2.535" width="0.254" layer="94"/>
<wire x1="4.915" y1="2.535" x2="4.109" y2="2.804" width="0.254" layer="94"/>
<wire x1="4.109" y1="2.804" x2="4.108" y2="2.291" width="0.254" layer="94"/>
<wire x1="4.108" y1="2.291" x2="4.915" y2="2.535" width="0.254" layer="94"/>
<wire x1="4.915" y1="-2.545" x2="4.109" y2="-2.276" width="0.254" layer="94"/>
<wire x1="4.109" y1="-2.276" x2="4.108" y2="-2.789" width="0.254" layer="94"/>
<wire x1="4.108" y1="-2.789" x2="4.915" y2="-2.545" width="0.254" layer="94"/>
<wire x1="2.54" y1="-2.54" x2="5.08" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="0" y1="-6.096" x2="0" y2="-4.064" width="0.1524" layer="94"/>
<wire x1="0" y1="-1.27" x2="0" y2="1.016" width="0.1524" layer="94"/>
<wire x1="0.005" y1="-4.229" x2="-0.264" y2="-5.035" width="0.254" layer="94"/>
<wire x1="-0.264" y1="-5.035" x2="0.249" y2="-5.036" width="0.254" layer="94"/>
<wire x1="0.249" y1="-5.036" x2="0.005" y2="-4.229" width="0.254" layer="94"/>
<wire x1="0.005" y1="0.851" x2="-0.264" y2="0.045" width="0.254" layer="94"/>
<wire x1="-0.264" y1="0.045" x2="0.249" y2="0.044" width="0.254" layer="94"/>
<wire x1="0.249" y1="0.044" x2="0.005" y2="0.851" width="0.254" layer="94"/>
<wire x1="-12.7" y1="7.62" x2="-11.43" y2="7.62" width="0.1524" layer="94"/>
<wire x1="-12.7" y1="-7.62" x2="-11.43" y2="-7.62" width="0.1524" layer="94"/>
<wire x1="11.43" y1="-7.62" x2="12.7" y2="-7.62" width="0.1524" layer="94"/>
<wire x1="11.43" y1="7.62" x2="12.7" y2="7.62" width="0.1524" layer="94"/>
<wire x1="-11.43" y1="7.62" x2="-9.398" y2="7.62" width="0.1524" layer="94"/>
<wire x1="-11.43" y1="-7.62" x2="-9.398" y2="-7.62" width="0.1524" layer="94"/>
<wire x1="11.43" y1="-7.62" x2="9.398" y2="-7.62" width="0.1524" layer="94"/>
<wire x1="11.43" y1="7.62" x2="9.398" y2="7.62" width="0.1524" layer="94"/>
<wire x1="-5.08" y1="8.89" x2="2.54" y2="8.89" width="0.254" layer="94"/>
<wire x1="2.54" y1="8.89" x2="2.54" y2="5.842" width="0.254" layer="94"/>
<wire x1="2.54" y1="5.842" x2="-5.08" y2="5.842" width="0.254" layer="94"/>
<wire x1="-5.08" y1="5.842" x2="-5.08" y2="8.89" width="0.254" layer="94"/>
<text x="-4.064" y="7.62" size="0.8128" layer="94">Temperature</text>
<text x="-2.794" y="6.35" size="0.8128" layer="94">sensor</text>
<pin name="SCL" x="-17.78" y="7.62" visible="off" length="middle" direction="in"/>
<pin name="SDA" x="17.78" y="7.62" visible="off" length="middle" rot="R180"/>
<pin name="VDD" x="-17.78" y="-7.62" visible="off" length="middle" direction="pwr"/>
<pin name="GND" x="17.78" y="-7.62" visible="off" length="middle" direction="pwr" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="VEML7700-TR" prefix="U">
<description>Light to Digital Ambient Light Sensor Digital 0lux to 167000lux 8-Pin SMD T/R &lt;a href="https://pricing.snapeda.com/parts/VEML7700-TR/Vishay/view-part?ref=eda"&gt;Check prices&lt;/a&gt;</description>
<gates>
<gate name="VEML7700" symbol="VEML7700-TR" x="0" y="0"/>
</gates>
<devices>
<device name="" package="XDCR_VEML7700-TR">
<connects>
<connect gate="VEML7700" pin="GND" pad="3"/>
<connect gate="VEML7700" pin="SCL" pad="1"/>
<connect gate="VEML7700" pin="SDA" pad="4"/>
<connect gate="VEML7700" pin="VDD" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="AVAILABILITY" value="In Stock"/>
<attribute name="DESCRIPTION" value=" Optical Sensor Ambient 545nm I²C 4-SMD, J-Lead "/>
<attribute name="MF" value="Vishay"/>
<attribute name="MP" value="VEML7700-TR"/>
<attribute name="PACKAGE" value="SMD-4 Vishay"/>
<attribute name="PRICE" value="None"/>
<attribute name="PURCHASE-URL" value="https://pricing.snapeda.com/search/part/VEML7700-TR/?ref=eda"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="TCS34725FN">
<packages>
<package name="SON65P200X240X70-6N">
<wire x1="-1" y1="1.2" x2="1" y2="1.2" width="0.127" layer="51"/>
<wire x1="1" y1="1.2" x2="1" y2="-1.2" width="0.127" layer="51"/>
<wire x1="1" y1="-1.2" x2="-1" y2="-1.2" width="0.127" layer="51"/>
<wire x1="-1" y1="-1.2" x2="-1" y2="1.2" width="0.127" layer="51"/>
<wire x1="-1" y1="1.1" x2="-1" y2="1.2" width="0.127" layer="21"/>
<wire x1="-1" y1="1.2" x2="1" y2="1.2" width="0.127" layer="21"/>
<wire x1="1" y1="1.2" x2="1" y2="1.1" width="0.127" layer="21"/>
<wire x1="1" y1="-1.1" x2="1" y2="-1.2" width="0.127" layer="21"/>
<wire x1="1" y1="-1.2" x2="-1" y2="-1.2" width="0.127" layer="21"/>
<wire x1="-1" y1="-1.2" x2="-1" y2="-1.1" width="0.127" layer="21"/>
<circle x="-1.7" y="0.6" radius="0.05" width="0.1" layer="21"/>
<wire x1="-1.5" y1="1.45" x2="1.5" y2="1.45" width="0.05" layer="39"/>
<wire x1="1.5" y1="1.45" x2="1.5" y2="-1.45" width="0.05" layer="39"/>
<wire x1="1.5" y1="-1.45" x2="-1.5" y2="-1.45" width="0.05" layer="39"/>
<wire x1="-1.5" y1="-1.45" x2="-1.5" y2="1.45" width="0.05" layer="39"/>
<text x="-1.50271875" y="1.50271875" size="0.61070625" layer="25">&gt;NAME</text>
<text x="-1.501" y="-1.751159375" size="0.61000625" layer="27" align="top-left">&gt;VALUE</text>
<circle x="-0.45" y="0.6" radius="0.05" width="0.1" layer="51"/>
<smd name="1" x="-0.75" y="0.65" dx="1" dy="0.4" layer="1"/>
<smd name="2" x="-0.75" y="0" dx="1" dy="0.4" layer="1"/>
<smd name="3" x="-0.75" y="-0.65" dx="1" dy="0.4" layer="1"/>
<smd name="6" x="0.75" y="0.65" dx="1" dy="0.4" layer="1"/>
<smd name="4" x="0.75" y="-0.65" dx="1" dy="0.4" layer="1"/>
<smd name="5" x="0.75" y="0" dx="1" dy="0.4" layer="1"/>
</package>
</packages>
<symbols>
<symbol name="TCS34725FN">
<wire x1="-7.62" y1="10.16" x2="7.62" y2="10.16" width="0.254" layer="94"/>
<wire x1="7.62" y1="10.16" x2="7.62" y2="-10.16" width="0.254" layer="94"/>
<wire x1="7.62" y1="-10.16" x2="-7.62" y2="-10.16" width="0.254" layer="94"/>
<wire x1="-7.62" y1="-10.16" x2="-7.62" y2="10.16" width="0.254" layer="94"/>
<text x="-7.63425" y="10.179" size="1.78131875" layer="95">&gt;NAME</text>
<text x="-7.629559375" y="-10.1727" size="1.78023125" layer="96" align="top-left">&gt;VALUE</text>
<pin name="VDD" x="10.16" y="7.62" length="short" direction="pwr" rot="R180"/>
<pin name="GND" x="10.16" y="-7.62" length="short" direction="pwr" rot="R180"/>
<pin name="SCL" x="-10.16" y="2.54" length="short" direction="in" function="clk"/>
<pin name="INT" x="10.16" y="2.54" length="short" direction="out" rot="R180"/>
<pin name="SDA" x="-10.16" y="-2.54" length="short"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="TCS34725FN" prefix="U">
<description>Color Light To Digital with IR Filter &lt;a href="https://pricing.snapeda.com/parts/TCS34725FN/ams/view-part?ref=eda"&gt;Check prices&lt;/a&gt;</description>
<gates>
<gate name="G$1" symbol="TCS34725FN" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SON65P200X240X70-6N">
<connects>
<connect gate="G$1" pin="GND" pad="3"/>
<connect gate="G$1" pin="INT" pad="5"/>
<connect gate="G$1" pin="SCL" pad="2"/>
<connect gate="G$1" pin="SDA" pad="6"/>
<connect gate="G$1" pin="VDD" pad="1"/>
</connects>
<technologies>
<technology name="">
<attribute name="AVAILABILITY" value="In Stock"/>
<attribute name="DESCRIPTION" value=" Color Sensor 16 b Gain Control, Interrupt, Sleep Mode 6-SMD Module "/>
<attribute name="MF" value="ams"/>
<attribute name="MP" value="TCS34725FN"/>
<attribute name="PACKAGE" value="SMD-6 ams"/>
<attribute name="PRICE" value="None"/>
<attribute name="PURCHASE-URL" value="https://pricing.snapeda.com/search/part/TCS34725FN/?ref=eda"/>
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
<part name="IC1" library="AS7341-DLGT" deviceset="AS7341-DLGT" device=""/>
<part name="MK1" library="SPH0645LM4H-B" deviceset="SPH0645LM4H-B" device=""/>
<part name="SV1" library="con-lsta" library_urn="urn:adsk.eagle:library:161" deviceset="FE05-2" device="" package3d_urn="urn:adsk.eagle:package:8170/1"/>
<part name="FRAME1" library="frames" library_urn="urn:adsk.eagle:library:229" deviceset="TABL_L" device=""/>
<part name="R23" library="ERJ-P06F1002V" deviceset="ERJ-P06F1002V" device="" value="10K"/>
<part name="C19" library="CL10A475KQ8NNNC" deviceset="CL10A475KQ8NNNC" device="" value="4.7uF"/>
<part name="R11" library="ERJ-P06F1002V" deviceset="ERJ-P06F1002V" device="" value="10K"/>
<part name="R12" library="ERJ-P06F1002V" deviceset="ERJ-P06F1002V" device="" value="10K"/>
<part name="R13" library="ERJ-P06F1002V" deviceset="ERJ-P06F1002V" device="" value="10K"/>
<part name="R14" library="ERJ-P06F1002V" deviceset="ERJ-P06F1002V" device="" value="10K"/>
<part name="C13" library="CL05A104KA5NNNC" deviceset="CL05A104KA5NNNC" device="" value="0.1uF"/>
<part name="C17" library="CL10B102KB8NNNC" deviceset="CL10B102KB8NNNC" device="" value="200pF"/>
<part name="C11" library="CL10A475KQ8NNNC" deviceset="CL10A475KQ8NNNC" device="" value="4.7uF"/>
<part name="U8" library="VEML7700-TR" deviceset="VEML7700-TR" device=""/>
<part name="U12" library="TCS34725FN" deviceset="TCS34725FN" device=""/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="IC1" gate="G$1" x="-35.56" y="154.94" smashed="yes">
<attribute name="NAME" x="-24.13" y="162.56" size="1.778" layer="95" align="center-left"/>
<attribute name="VALUE" x="-29.21" y="160.02" size="1.778" layer="96" align="center-left"/>
</instance>
<instance part="MK1" gate="G$1" x="2.54" y="124.46" smashed="yes">
<attribute name="NAME" x="-10.1999" y="132.6066" size="1.78358125" layer="95"/>
<attribute name="VALUE" x="-10.2073" y="114.2674" size="1.7846" layer="96"/>
</instance>
<instance part="SV1" gate="G$1" x="-33.02" y="121.92" smashed="yes">
<attribute name="VALUE" x="-36.83" y="111.76" size="1.778" layer="96"/>
<attribute name="NAME" x="-36.83" y="130.302" size="1.778" layer="95"/>
</instance>
<instance part="FRAME1" gate="G$1" x="-175.26" y="-68.58" smashed="yes"/>
<instance part="FRAME1" gate="G$2" x="124.46" y="-68.58" smashed="yes">
<attribute name="LAST_DATE_TIME" x="137.16" y="-67.31" size="2.54" layer="94"/>
<attribute name="SHEET" x="210.82" y="-67.31" size="2.54" layer="94"/>
<attribute name="DRAWING_NAME" x="142.24" y="-49.53" size="2.54" layer="94"/>
</instance>
<instance part="R23" gate="G$1" x="27.94" y="124.46" smashed="yes">
<attribute name="NAME" x="24.760559375" y="125.73148125" size="2.54148125" layer="95"/>
<attribute name="VALUE" x="24.75503125" y="120.643359375" size="2.54331875" layer="96"/>
</instance>
<instance part="C19" gate="G$1" x="40.64" y="160.02" smashed="yes" rot="R90">
<attribute name="NAME" x="38.09906875" y="158.75" size="1.77843125" layer="95" rot="R90"/>
<attribute name="VALUE" x="44.45848125" y="158.75" size="1.78096875" layer="96" rot="R90"/>
</instance>
<instance part="R11" gate="G$1" x="33.02" y="167.64" smashed="yes">
<attribute name="NAME" x="29.840559375" y="168.91148125" size="2.54148125" layer="95"/>
<attribute name="VALUE" x="29.83503125" y="163.823359375" size="2.54331875" layer="96"/>
</instance>
<instance part="R12" gate="G$1" x="22.86" y="160.02" smashed="yes" rot="R90">
<attribute name="NAME" x="21.58851875" y="156.840559375" size="2.54148125" layer="95" rot="R90"/>
<attribute name="VALUE" x="26.676640625" y="156.83503125" size="2.54331875" layer="96" rot="R90"/>
</instance>
<instance part="R13" gate="G$1" x="15.24" y="160.02" smashed="yes" rot="R90">
<attribute name="NAME" x="13.96851875" y="156.840559375" size="2.54148125" layer="95" rot="R90"/>
<attribute name="VALUE" x="19.056640625" y="156.83503125" size="2.54331875" layer="96" rot="R90"/>
</instance>
<instance part="R14" gate="G$1" x="7.62" y="160.02" smashed="yes" rot="R90">
<attribute name="NAME" x="6.34851875" y="156.840559375" size="2.54148125" layer="95" rot="R90"/>
<attribute name="VALUE" x="11.436640625" y="156.83503125" size="2.54331875" layer="96" rot="R90"/>
</instance>
<instance part="C13" gate="G$1" x="50.8" y="124.46" smashed="yes" rot="R90">
<attribute name="NAME" x="55.88" y="128.27" size="1.778" layer="95" rot="R270"/>
<attribute name="VALUE" x="54.61" y="121.92" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="C17" gate="G$1" x="43.18" y="124.46" smashed="yes" rot="R90">
<attribute name="NAME" x="40.63906875" y="123.19" size="1.77843125" layer="95" rot="R90"/>
<attribute name="VALUE" x="46.99848125" y="121.92" size="1.78096875" layer="96" rot="R90"/>
</instance>
<instance part="C11" gate="G$1" x="-5.08" y="160.02" smashed="yes" rot="R90">
<attribute name="NAME" x="-7.62093125" y="158.75" size="1.77843125" layer="95" rot="R90"/>
<attribute name="VALUE" x="-1.26151875" y="158.75" size="1.78096875" layer="96" rot="R90"/>
</instance>
<instance part="U8" gate="VEML7700" x="81.28" y="149.86" smashed="yes">
<attribute name="NAME" x="68.58" y="163.322" size="1.778" layer="95"/>
<attribute name="VALUE" x="68.58" y="134.62" size="1.778" layer="96"/>
</instance>
<instance part="U12" gate="G$1" x="134.62" y="160.02" smashed="yes">
<attribute name="NAME" x="126.98575" y="170.199" size="1.78131875" layer="95"/>
<attribute name="VALUE" x="126.990440625" y="149.8473" size="1.78023125" layer="96" align="top-left"/>
</instance>
</instances>
<busses>
</busses>
<nets>
<net name="N$13" class="0">
<segment>
<wire x1="38.1" y1="124.46" x2="38.1" y2="106.68" width="0.1524" layer="91"/>
<wire x1="38.1" y1="106.68" x2="-17.78" y2="106.68" width="0.1524" layer="91"/>
<wire x1="-17.78" y1="106.68" x2="-17.78" y2="119.38" width="0.1524" layer="91"/>
<pinref part="SV1" gate="G$1" pin="4"/>
<wire x1="-17.78" y1="119.38" x2="-25.4" y2="119.38" width="0.1524" layer="91"/>
<pinref part="R23" gate="G$1" pin="2"/>
<wire x1="38.1" y1="124.46" x2="33.02" y2="124.46" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$15" class="0">
<segment>
<pinref part="MK1" gate="G$1" pin="WS"/>
<pinref part="SV1" gate="G$1" pin="10"/>
<wire x1="-15.24" y1="127" x2="-25.4" y2="127" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$16" class="0">
<segment>
<pinref part="MK1" gate="G$1" pin="SELECT"/>
<pinref part="SV1" gate="G$1" pin="8"/>
<wire x1="-15.24" y1="124.46" x2="-25.4" y2="124.46" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$17" class="0">
<segment>
<pinref part="MK1" gate="G$1" pin="BCLK"/>
<pinref part="SV1" gate="G$1" pin="6"/>
<wire x1="-15.24" y1="121.92" x2="-25.4" y2="121.92" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$22" class="0">
<segment>
<pinref part="SV1" gate="G$1" pin="1"/>
<wire x1="-40.64" y1="116.84" x2="-45.72" y2="116.84" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="R23" gate="G$1" pin="1"/>
<pinref part="MK1" gate="G$1" pin="DATA_OUT"/>
<wire x1="22.86" y1="124.46" x2="20.32" y2="124.46" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$12" class="0">
<segment>
<pinref part="SV1" gate="G$1" pin="3"/>
<wire x1="-40.64" y1="119.38" x2="-50.8" y2="119.38" width="0.1524" layer="91"/>
<wire x1="-50.8" y1="119.38" x2="-50.8" y2="134.62" width="0.1524" layer="91"/>
<wire x1="-50.8" y1="134.62" x2="33.02" y2="134.62" width="0.1524" layer="91"/>
<pinref part="MK1" gate="G$1" pin="VDD"/>
<wire x1="50.8" y1="129.54" x2="43.18" y2="129.54" width="0.1524" layer="91"/>
<wire x1="43.18" y1="129.54" x2="33.02" y2="129.54" width="0.1524" layer="91"/>
<wire x1="33.02" y1="129.54" x2="20.32" y2="129.54" width="0.1524" layer="91"/>
<wire x1="33.02" y1="134.62" x2="33.02" y2="129.54" width="0.1524" layer="91"/>
<junction x="33.02" y="129.54"/>
<pinref part="C17" gate="G$1" pin="2"/>
<junction x="43.18" y="129.54"/>
<pinref part="C13" gate="G$1" pin="1"/>
<wire x1="33.02" y1="134.62" x2="53.34" y2="134.62" width="0.1524" layer="91"/>
<junction x="33.02" y="134.62"/>
<pinref part="R11" gate="G$1" pin="2"/>
<wire x1="38.1" y1="167.64" x2="40.64" y2="167.64" width="0.1524" layer="91"/>
<wire x1="40.64" y1="165.1" x2="40.64" y2="167.64" width="0.1524" layer="91"/>
<pinref part="C19" gate="G$1" pin="2"/>
<wire x1="40.64" y1="167.64" x2="53.34" y2="167.64" width="0.1524" layer="91"/>
<wire x1="53.34" y1="167.64" x2="53.34" y2="142.24" width="0.1524" layer="91"/>
<junction x="40.64" y="167.64"/>
<pinref part="U8" gate="VEML7700" pin="VDD"/>
<wire x1="53.34" y1="142.24" x2="58.42" y2="142.24" width="0.1524" layer="91"/>
<wire x1="58.42" y1="142.24" x2="63.5" y2="142.24" width="0.1524" layer="91"/>
<wire x1="53.34" y1="134.62" x2="53.34" y2="142.24" width="0.1524" layer="91"/>
<junction x="53.34" y="142.24"/>
<pinref part="U12" gate="G$1" pin="VDD"/>
<wire x1="144.78" y1="167.64" x2="160.02" y2="167.64" width="0.1524" layer="91"/>
<wire x1="160.02" y1="167.64" x2="160.02" y2="127" width="0.1524" layer="91"/>
<wire x1="160.02" y1="127" x2="58.42" y2="127" width="0.1524" layer="91"/>
<wire x1="58.42" y1="127" x2="58.42" y2="142.24" width="0.1524" layer="91"/>
<junction x="58.42" y="142.24"/>
</segment>
</net>
<net name="SDAIN" class="0">
<segment>
<pinref part="SV1" gate="G$1" pin="9"/>
<wire x1="-40.64" y1="127" x2="-45.72" y2="127" width="0.1524" layer="91"/>
<label x="-48.26" y="127" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC1" gate="G$1" pin="SDA"/>
<wire x1="-7.62" y1="154.94" x2="2.54" y2="154.94" width="0.1524" layer="91"/>
<wire x1="2.54" y1="154.94" x2="2.54" y2="147.32" width="0.1524" layer="91"/>
<wire x1="2.54" y1="147.32" x2="7.62" y2="147.32" width="0.1524" layer="91"/>
<wire x1="7.62" y1="147.32" x2="43.18" y2="147.32" width="0.1524" layer="91"/>
<junction x="7.62" y="147.32"/>
<wire x1="7.62" y1="154.94" x2="7.62" y2="147.32" width="0.1524" layer="91"/>
<wire x1="43.18" y1="139.7" x2="43.18" y2="147.32" width="0.1524" layer="91"/>
<junction x="43.18" y="147.32"/>
<pinref part="R14" gate="G$1" pin="1"/>
<junction x="7.62" y="154.94"/>
<wire x1="43.18" y1="147.32" x2="48.26" y2="147.32" width="0.1524" layer="91"/>
<wire x1="48.26" y1="147.32" x2="48.26" y2="172.72" width="0.1524" layer="91"/>
<wire x1="48.26" y1="172.72" x2="106.68" y2="172.72" width="0.1524" layer="91"/>
<pinref part="U8" gate="VEML7700" pin="SDA"/>
<wire x1="106.68" y1="172.72" x2="106.68" y2="157.48" width="0.1524" layer="91"/>
<wire x1="106.68" y1="157.48" x2="99.06" y2="157.48" width="0.1524" layer="91"/>
<pinref part="U12" gate="G$1" pin="SDA"/>
<wire x1="124.46" y1="157.48" x2="106.68" y2="157.48" width="0.1524" layer="91"/>
<junction x="106.68" y="157.48"/>
<label x="43.18" y="139.7" size="1.778" layer="95" rot="R90"/>
</segment>
</net>
<net name="SCLIN" class="0">
<segment>
<pinref part="SV1" gate="G$1" pin="7"/>
<wire x1="-40.64" y1="124.46" x2="-45.72" y2="124.46" width="0.1524" layer="91"/>
<label x="-48.26" y="124.46" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC1" gate="G$1" pin="SCL"/>
<wire x1="-35.56" y1="152.4" x2="-40.64" y2="152.4" width="0.1524" layer="91"/>
<wire x1="-40.64" y1="152.4" x2="-40.64" y2="139.7" width="0.1524" layer="91"/>
<wire x1="-40.64" y1="139.7" x2="5.08" y2="139.7" width="0.1524" layer="91"/>
<wire x1="5.08" y1="139.7" x2="5.08" y2="149.86" width="0.1524" layer="91"/>
<wire x1="5.08" y1="149.86" x2="15.24" y2="149.86" width="0.1524" layer="91"/>
<wire x1="15.24" y1="149.86" x2="40.64" y2="149.86" width="0.1524" layer="91"/>
<wire x1="15.24" y1="154.94" x2="15.24" y2="149.86" width="0.1524" layer="91"/>
<junction x="15.24" y="149.86"/>
<wire x1="40.64" y1="139.7" x2="40.64" y2="149.86" width="0.1524" layer="91"/>
<junction x="40.64" y="149.86"/>
<label x="40.64" y="139.7" size="1.778" layer="95" rot="R90"/>
<pinref part="R13" gate="G$1" pin="1"/>
<wire x1="40.64" y1="149.86" x2="58.42" y2="149.86" width="0.1524" layer="91"/>
<wire x1="58.42" y1="149.86" x2="58.42" y2="157.48" width="0.1524" layer="91"/>
<pinref part="U8" gate="VEML7700" pin="SCL"/>
<wire x1="58.42" y1="157.48" x2="60.96" y2="157.48" width="0.1524" layer="91"/>
<pinref part="U12" gate="G$1" pin="SCL"/>
<wire x1="60.96" y1="157.48" x2="63.5" y2="157.48" width="0.1524" layer="91"/>
<wire x1="124.46" y1="162.56" x2="99.06" y2="162.56" width="0.1524" layer="91"/>
<wire x1="99.06" y1="162.56" x2="99.06" y2="167.64" width="0.1524" layer="91"/>
<wire x1="99.06" y1="167.64" x2="60.96" y2="167.64" width="0.1524" layer="91"/>
<wire x1="60.96" y1="167.64" x2="60.96" y2="157.48" width="0.1524" layer="91"/>
<junction x="60.96" y="157.48"/>
</segment>
</net>
<net name="INTIN" class="0">
<segment>
<pinref part="SV1" gate="G$1" pin="5"/>
<wire x1="-40.64" y1="121.92" x2="-45.72" y2="121.92" width="0.1524" layer="91"/>
<label x="-48.26" y="121.92" size="1.778" layer="95"/>
</segment>
<segment>
<pinref part="IC1" gate="G$1" pin="INT"/>
<wire x1="45.72" y1="152.4" x2="38.1" y2="152.4" width="0.1524" layer="91"/>
<wire x1="38.1" y1="152.4" x2="22.86" y2="152.4" width="0.1524" layer="91"/>
<wire x1="22.86" y1="152.4" x2="-7.62" y2="152.4" width="0.1524" layer="91"/>
<wire x1="22.86" y1="154.94" x2="22.86" y2="152.4" width="0.1524" layer="91"/>
<junction x="22.86" y="152.4"/>
<wire x1="38.1" y1="139.7" x2="38.1" y2="152.4" width="0.1524" layer="91"/>
<junction x="38.1" y="152.4"/>
<label x="38.1" y="139.7" size="1.778" layer="95" rot="R90"/>
<pinref part="R12" gate="G$1" pin="1"/>
</segment>
</net>
<net name="GND" class="0">
<segment>
<pinref part="MK1" gate="G$1" pin="GND"/>
<wire x1="20.32" y1="119.38" x2="22.86" y2="119.38" width="0.1524" layer="91"/>
<wire x1="22.86" y1="119.38" x2="43.18" y2="119.38" width="0.1524" layer="91"/>
<wire x1="43.18" y1="119.38" x2="50.8" y2="119.38" width="0.1524" layer="91"/>
<wire x1="50.8" y1="119.38" x2="50.8" y2="121.92" width="0.1524" layer="91"/>
<wire x1="43.18" y1="121.92" x2="43.18" y2="119.38" width="0.1524" layer="91"/>
<junction x="43.18" y="119.38"/>
<pinref part="C17" gate="G$1" pin="1"/>
<pinref part="C13" gate="G$1" pin="2"/>
<pinref part="SV1" gate="G$1" pin="2"/>
<wire x1="-25.4" y1="116.84" x2="-22.86" y2="116.84" width="0.1524" layer="91"/>
<wire x1="-22.86" y1="116.84" x2="-22.86" y2="111.76" width="0.1524" layer="91"/>
<wire x1="-22.86" y1="111.76" x2="22.86" y2="111.76" width="0.1524" layer="91"/>
<wire x1="22.86" y1="111.76" x2="22.86" y2="119.38" width="0.1524" layer="91"/>
<junction x="22.86" y="119.38"/>
<wire x1="40.64" y1="154.94" x2="33.02" y2="154.94" width="0.1524" layer="91"/>
<wire x1="33.02" y1="154.94" x2="33.02" y2="142.24" width="0.1524" layer="91"/>
<wire x1="33.02" y1="142.24" x2="-2.54" y2="142.24" width="0.1524" layer="91"/>
<wire x1="-2.54" y1="142.24" x2="-2.54" y2="147.32" width="0.1524" layer="91"/>
<pinref part="IC1" gate="G$1" pin="PGND"/>
<wire x1="-2.54" y1="147.32" x2="-5.08" y2="147.32" width="0.1524" layer="91"/>
<wire x1="-5.08" y1="147.32" x2="-7.62" y2="147.32" width="0.1524" layer="91"/>
<wire x1="40.64" y1="157.48" x2="40.64" y2="154.94" width="0.1524" layer="91"/>
<wire x1="-5.08" y1="147.32" x2="-5.08" y2="157.48" width="0.1524" layer="91"/>
<junction x="-5.08" y="147.32"/>
<pinref part="IC1" gate="G$1" pin="GND"/>
<wire x1="-35.56" y1="149.86" x2="-38.1" y2="149.86" width="0.1524" layer="91"/>
<wire x1="-38.1" y1="149.86" x2="-38.1" y2="142.24" width="0.1524" layer="91"/>
<wire x1="-38.1" y1="142.24" x2="-22.86" y2="142.24" width="0.1524" layer="91"/>
<wire x1="-22.86" y1="142.24" x2="-7.62" y2="142.24" width="0.1524" layer="91"/>
<wire x1="-7.62" y1="142.24" x2="-7.62" y2="147.32" width="0.1524" layer="91"/>
<junction x="-7.62" y="147.32"/>
<pinref part="C19" gate="G$1" pin="1"/>
<pinref part="C11" gate="G$1" pin="1"/>
<wire x1="40.64" y1="154.94" x2="55.88" y2="154.94" width="0.1524" layer="91"/>
<wire x1="55.88" y1="154.94" x2="55.88" y2="177.8" width="0.1524" layer="91"/>
<junction x="40.64" y="154.94"/>
<wire x1="55.88" y1="177.8" x2="114.3" y2="177.8" width="0.1524" layer="91"/>
<wire x1="114.3" y1="177.8" x2="114.3" y2="144.78" width="0.1524" layer="91"/>
<wire x1="114.3" y1="144.78" x2="114.3" y2="142.24" width="0.1524" layer="91"/>
<pinref part="U8" gate="VEML7700" pin="GND"/>
<wire x1="114.3" y1="142.24" x2="99.06" y2="142.24" width="0.1524" layer="91"/>
<wire x1="114.3" y1="144.78" x2="154.94" y2="144.78" width="0.1524" layer="91"/>
<pinref part="U12" gate="G$1" pin="GND"/>
<wire x1="154.94" y1="144.78" x2="154.94" y2="152.4" width="0.1524" layer="91"/>
<wire x1="154.94" y1="152.4" x2="144.78" y2="152.4" width="0.1524" layer="91"/>
<wire x1="-22.86" y1="116.84" x2="-22.86" y2="142.24" width="0.1524" layer="91"/>
<junction x="-22.86" y="116.84"/>
<junction x="-22.86" y="142.24"/>
<junction x="114.3" y="144.78"/>
</segment>
</net>
<net name="N$18" class="0">
<segment>
<wire x1="-40.64" y1="167.64" x2="-40.64" y2="154.94" width="0.1524" layer="91"/>
<pinref part="IC1" gate="G$1" pin="VDD"/>
<wire x1="-40.64" y1="154.94" x2="-35.56" y2="154.94" width="0.1524" layer="91"/>
<wire x1="-40.64" y1="167.64" x2="-5.08" y2="167.64" width="0.1524" layer="91"/>
<wire x1="-5.08" y1="167.64" x2="7.62" y2="167.64" width="0.1524" layer="91"/>
<wire x1="7.62" y1="167.64" x2="15.24" y2="167.64" width="0.1524" layer="91"/>
<wire x1="15.24" y1="167.64" x2="22.86" y2="167.64" width="0.1524" layer="91"/>
<junction x="7.62" y="167.64"/>
<wire x1="7.62" y1="165.1" x2="7.62" y2="167.64" width="0.1524" layer="91"/>
<wire x1="15.24" y1="165.1" x2="15.24" y2="167.64" width="0.1524" layer="91"/>
<junction x="15.24" y="167.64"/>
<wire x1="22.86" y1="165.1" x2="22.86" y2="167.64" width="0.1524" layer="91"/>
<junction x="22.86" y="167.64"/>
<wire x1="22.86" y1="167.64" x2="27.94" y2="167.64" width="0.1524" layer="91"/>
<wire x1="-5.08" y1="165.1" x2="-5.08" y2="167.64" width="0.1524" layer="91"/>
<junction x="-5.08" y="167.64"/>
<pinref part="R11" gate="G$1" pin="1"/>
<pinref part="R12" gate="G$1" pin="2"/>
<pinref part="R13" gate="G$1" pin="2"/>
<pinref part="R14" gate="G$1" pin="2"/>
<junction x="7.62" y="165.1"/>
<pinref part="C11" gate="G$1" pin="2"/>
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
