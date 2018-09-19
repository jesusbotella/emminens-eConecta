<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html><head>
<style type="text/css">
   table {empty-cells: show}
</style>
</head><body style="font-family:Verdana">
  <xsl:apply-templates />
 </body></html>
</xsl:template>

<xsl:template match="IMPORT">
 
 <h1>Accu-Chek Smart Pix Data </h1>

<xsl:for-each select="ACSPIX">
 <br /><b>Device: </b><br/> SN: <xsl:value-of select="@SN" /> - Version: <xsl:value-of select="@Ver" />  <br/>
</xsl:for-each>

<xsl:for-each select="IP">
 <br /><b>Insulin Pump:</b><br/> Type: <xsl:value-of select="@Name" /> - SN:<xsl:value-of select="@SN" /> - Pump Date and Time: <xsl:value-of select="@Dt" /> - <xsl:value-of select="@Tm" /> <br/>
 <xsl:if test="@RestUseDays"> Rest Use Days: <xsl:value-of select="@RestUseDays" /> - </xsl:if> 
 Active Profile: <xsl:value-of select="@ActiveProf" /> - Insulin Concentration: <xsl:value-of select="@InsulinConc" /><br/>
</xsl:for-each>

<xsl:for-each select="IPDATA">
 
 <h3>Bolus</h3> 
 <table border="1" cellspacing="0" cellpadding="4">
 <thead bgcolor="#CCCCCC">

 	<tr align="center">
 		<td > Date </td>
 		<td > Time </td>
 		<td> Bolus U</td>
 		<td> Type</td>
 		<td> Comment</td>
 	</tr>
 </thead>
 
 	<xsl:for-each select="BOLUS">
 	
 	<xsl:choose> 
 	<xsl:when test = "@remark='Bolus+Basal Total'" >
 	<tr>
 		<td align="right"><b><xsl:value-of select="@Dt" /></b></td>
 		<td align="right"><b>&#160;</b></td>
 		<td align="right"><b><xsl:value-of select="@amount"/></b></td>
 		<td><b>&#160;</b></td>
		<td><b><xsl:value-of select="@remark" /></b></td>
		
		<!-- BOLUS Weekend="1" Dayofweek="Sunday" Dt="2005-05-29" Tm="19:32:00" bolusamount="7.5" bolustype="ex" remark="0:45 h"/ -->
	
	</tr>
 	</xsl:when>
	
	<xsl:when test = "@remark='Bolus Total'" >
 	<tr>
 		<td align="right"><b><xsl:value-of select="@Dt" /></b></td>
 		<td align="right">&#160;</td>
 		<td align="right"><b><xsl:value-of select="@amount"/></b></td>
 		<td>&#160;</td>
		<td><b><xsl:value-of select="@remark" /></b></td>
		
		<!-- BOLUS Weekend="1" Dayofweek="Sunday" Dt="2005-05-29" Tm="19:32:00" bolusamount="7.5" bolustype="ex" remark="0:45 h"/ -->
	
	</tr>
 	</xsl:when>
	
	<xsl:otherwise>
	
 	<tr> 
 		<td align="right"> <xsl:value-of select="@Dt" /></td>
 		<td align="right"> <xsl:value-of select="@Tm" /></td>
 		<td align="right"><xsl:value-of select="@amount" /></td>
 		<td><xsl:value-of select="@type"/></td>
		<td>
            <xsl:if test="not(@remark)">
                <xsl:if test="not(@cmd)">&#160;</xsl:if>
                <xsl:if test="@cmd='1'">Adv</xsl:if>
                <xsl:if test="@cmd='2'">Rmt</xsl:if>
            </xsl:if> 
            <xsl:if test="(@remark)">
                <xsl:value-of select="@remark" />
                <xsl:if test="@cmd='1'">, Adv</xsl:if>
                <xsl:if test="@cmd='2'">, Rmt</xsl:if>
            </xsl:if> 
        </td>
	</tr>
	</xsl:otherwise>
	</xsl:choose>
 	</xsl:for-each>
 </table>
 
 <h3>Basal</h3> 
 <table border="1" cellspacing="0" cellpadding="4">
 <thead bgcolor="#CCCCCC">

 	<tr align="center">
 		<td > Date </td>
 		<td > Time </td>
 		<td> Basal Rate U/h </td>
 		<td> Profile</td>
 		<td> Inc</td>
 		<td> Dec</td>
 		<td> Comment</td>
 	</tr>
 </thead>
 
 	<xsl:for-each select="BASAL">
  	<tr> 
 		<td align="right"> <xsl:value-of select="@Dt" /></td>
 		<td align="right"> <xsl:value-of select="@Tm" /></td>
 		<td align="right"> <xsl:value-of select="@cbrf" /></td>
 		<td> <xsl:if test="not(@profile)">&#160;</xsl:if><xsl:value-of select="@profile" /></td>
 		<td> <xsl:if test="not(@TBRinc)">&#160;</xsl:if><xsl:value-of select="@TBRinc" /></td>
 		<td> <xsl:if test="not(@TBRdec)">&#160;</xsl:if><xsl:value-of select="@TBRdec" /></td>
		<td>
            <xsl:if test="not(@remark)">
                <xsl:if test="not(@cmd)">&#160;</xsl:if>
                <xsl:if test="@cmd='1'"> Adv</xsl:if>
                <xsl:if test="@cmd='2'"> Rmt</xsl:if>
            </xsl:if> 
            <xsl:if test="(@remark)">
                <xsl:value-of select="@remark" />
                <xsl:if test="@cmd='1'">, Adv</xsl:if>
                <xsl:if test="@cmd='2'">, Rmt</xsl:if>
            </xsl:if> 
        </td>
	</tr>
	</xsl:for-each>
	
 </table>
 
 
<br/>

 
 
   <h3>Events</h3> 
 <table border="1" cellspacing="0" cellpadding="4">
 <thead bgcolor="#CCCCCC">

 	<tr align="center">
 		<td> Date </td>
 		<td> Time </td>
 		<td> Event </td>
 		<td> Description </td>
 	</tr>
 </thead>
 
 	<xsl:for-each select="EVENT">
 	<tr> 
 		<td align="right"> <xsl:value-of select="@Dt" /></td>
 		<td align="right"> <xsl:value-of select="@Tm" /></td>
 		<td align="right"> <xsl:if test="not(@shortinfo)">&#160;</xsl:if><xsl:value-of select="@shortinfo" /></td>
 		<td align="right"> <xsl:if test="not(@description)">&#160;</xsl:if><xsl:value-of select="@description" /></td>
	</tr>
	</xsl:for-each>
 </table>
 
<br/>

</xsl:for-each>


<xsl:for-each select="STATISTIC">
  <h3>Statistics </h3>
  <table border="0" cellspacing="0" cellpadding="4">
    <tr>
      <td>Time Range:</td>  
      <td colspan="2"> <xsl:value-of select="ST_TIMERANGE/@Weeks" /> weeks up to <xsl:value-of select="ST_TIMERANGE/@Dt" /> </td>  
    </tr>
    <tr>
      <td>Use Time:</td>  
      <td> <xsl:value-of select="ST_USETIME_PERCENT/@Val" /> </td>
      <td>%</td> 
    </tr>
    <tr>
      <td>Bolus Frequency:</td>  
      <td> <xsl:value-of select="ST_BOLUSFREQ/@Val" /> </td>
      <td>x / day</td> 
    </tr>
    <tr>
      <td>Basal:</td>  
      <td> <xsl:value-of select="ST_BASAL_IU/@Val" /> </td>
      <td>U / day</td> 
    </tr>
    <tr>
      <td>&#160;</td>  
      <td> <xsl:value-of select="ST_BASAL_PERCENT/@Val" /> </td>
      <td>%</td> 
    </tr>
    <tr>
      <td>Bolus:</td>  
      <td> <xsl:value-of select="ST_BOLUS_IU/@Val" /> </td>
      <td>U / day</td> 
    </tr>
    <tr>
      <td>&#160;</td>  
      <td> <xsl:value-of select="ST_BOLUS_PERCENT/@Val" /> </td>
      <td>%</td> 
    </tr>

  </table>
</xsl:for-each>


</xsl:template>

</xsl:stylesheet>
