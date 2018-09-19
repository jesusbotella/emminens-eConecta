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
 
 <h1> Accu-Chek Smart Pix Data </h1>

<xsl:for-each select="ACSPIX">
 <br /> <b>Device: </b><br />SN: <xsl:value-of select="@SN" /> - Version: <xsl:value-of select="@Ver" /> 
</xsl:for-each>

<xsl:for-each select="DEVICE">
 <br /><br /> <b>Bg Device <xsl:value-of select="position()"/>: </b><br />Name: <xsl:value-of select="@Name" />  - SN:<xsl:value-of select="@SN" /> - Unit: <xsl:value-of select="@BGUnit" /> 
</xsl:for-each>

<xsl:for-each select="RECENTREC">
 <br /><br /> <b>Recent Record: </b><br />Date: <xsl:value-of select="@Dt" />  - Time: <xsl:value-of select="@Tm" />  
</xsl:for-each>

<xsl:for-each select="BGDATA">
 <h3>Bg Measurements</h3> 
 <table border="1" cellspacing="0" cellpadding="4">
 <thead bgcolor="#CCCCCC">

 	<tr align="center">
 		
 		<td> Date</td>
 		<td> Time</td>
 		<td width="50"> Bg Value </td>
 		<td> Flags</td>
 		<td> Insulin 1</td>
 		<td> Insulin 2</td>
		<td> Insulin 3</td>
		<td> Carbs</td>
		<td> Event</td>
		<td width="50"> Bg Device</td>
 	</tr>
 </thead>
 
 	<xsl:for-each select="BG">
 	<xsl:choose>
 	<xsl:when test = "@Ctrl>0 or @Ctrl='?'" >
 	</xsl:when>
 	<xsl:otherwise>
 	<tr> 
 		<td align="right"><xsl:if test="not(@Dt)">&#160;</xsl:if><xsl:value-of select="@Dt" /></td>
 		<td> <xsl:if test="not(@Tm)">&#160;</xsl:if><xsl:value-of select="@Tm" /></td>
 		<td align="right"> <b><xsl:value-of select="@Val" /></b> </td>
 		<td> <xsl:if test="not(@Flg)">&#160;</xsl:if><xsl:value-of select="@Flg" /></td>
 		<td align="right"> <xsl:if test="not(@Ins1)">&#160;</xsl:if><xsl:value-of select="@Ins1" /></td>
		<td align="right"> <xsl:if test="not(@Ins2)">&#160;</xsl:if><xsl:value-of select="@Ins2" /></td>
		<td align="right"> <xsl:if test="not(@Ins3)">&#160;</xsl:if><xsl:value-of select="@Ins3" /></td>
		<td align="right"> <xsl:if test="not(@Carb)">&#160;</xsl:if><xsl:value-of select="@Carb" /></td>
		<td> <xsl:if test="not(@Evt)">&#160;</xsl:if><xsl:value-of select="@Evt" /></td>
		<td align="right"> <xsl:if test="not(@D)">&#160;</xsl:if><xsl:value-of select="@D" /></td>
	</tr>
	</xsl:otherwise>
	</xsl:choose>
 	</xsl:for-each>
 </table>
<br/>

<h3>Control Measurements</h3> 
 <table border="1" cellspacing="0" cellpadding="4">
 <thead bgcolor="#CCCCCC">

 	<tr align="center">
 		<td> Date</td>
 		<td> Time</td>
 		<td width="50">Control Value </td>
 		<td width="50">Level </td>
 		<td> Flags</td>
 		<td width="50"> Bg Device</td>
 	</tr>
 </thead>
 	<xsl:for-each select="BG">
 	<xsl:if test = "@Ctrl>0 or @Ctrl='?'">
 	<tr> 
 		<td align="right"> <xsl:if test="not(@Dt)">&#160;</xsl:if><xsl:value-of select="@Dt" /></td>
 		<td> <xsl:if test="not(@Tm)">&#160;</xsl:if><xsl:value-of select="@Tm" /></td>
 		<td align="right"> <b><xsl:value-of select="@Val" /></b> </td>
 		<td align="right"> <xsl:value-of select="@Ctrl" /> </td>
 		<td> <xsl:if test="not(@Flg)">&#160;</xsl:if><xsl:value-of select="@Flg" /></td>
 		<td align="right"> <xsl:if test="not(@D)">&#160;</xsl:if><xsl:value-of select="@D" /></td>
 	</tr>
 	</xsl:if>
 	</xsl:for-each>

 </table>
</xsl:for-each>


<xsl:for-each select="STATISTIC">
  <h3>Statistics </h3>
  <table border="0" cellspacing="0" cellpadding="4">
    <tr>
      <td>Time Range:</td>  
      <td colspan="2"> <xsl:value-of select="ST_TIMERANGE/@Weeks" /> weeks up to <xsl:value-of select="ST_TIMERANGE/@Dt" /> </td>  
    </tr>
    <tr>
      <td>Evaluated Results:</td>  
      <td> <xsl:value-of select="ST_EVALRESULTS/@Val" /> </td>
      <td>&#160;</td> 
    </tr>
    <tr>
      <td>Test Frequency 1:</td>  
      <td> <xsl:value-of select="ST_TSTFREQ1/@Val" /> </td>    
      <td>tests / days in time range</td> 
    </tr>
    <tr>
      <td>Test Frequency 2:</td>  
      <td> <xsl:value-of select="ST_TSTFREQ2/@Val" /> </td>    
      <td>tests / days with measurements</td> 
    </tr>
    <tr>
      <td>MBG:</td>  
      <td> <xsl:value-of select="ST_MBG/@Val" /> </td>    
      <td> <xsl:value-of select="/IMPORT/DEVICE/@BGUnit" /> </td>    
    </tr>
    <tr>
      <td>SD:</td>  
      <td> <xsl:value-of select="ST_SD/@Val" /> </td>    
      <td> <xsl:value-of select="/IMPORT/DEVICE/@BGUnit" /> </td>    
    </tr>
    <tr>
      <td>HBGI:</td>  
      <td> <xsl:value-of select="ST_HBGI/@Val" /> </td>    
      <td>&#160;</td>    
    </tr>
    <tr>
      <td>LBGI:</td>  
      <td> <xsl:value-of select="ST_LBGI/@Val" /> </td>    
      <td>&#160;</td>    
    </tr>
    <xsl:if test="ST_ADRR">
      <tr>
        <td>ADRR:</td>  
        <td> <xsl:value-of select="ST_ADRR/@Val" /> </td>    
        <td>&#160;</td>    
      </tr>
    </xsl:if>
  </table>
</xsl:for-each>

</xsl:template>

</xsl:stylesheet>
