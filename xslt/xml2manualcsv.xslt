<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:strip-space elements="*"/>
  <xsl:output method="text" encoding="UTF-8"/>

  <xsl:variable name="fs">,</xsl:variable>

  <xsl:template match="/divelog/dives">
    <xsl:value-of select="concat('&quot;dive number&quot;', $fs, '&quot;date&quot;', $fs, '&quot;time&quot;', $fs, '&quot;duration&quot;', $fs, '&quot;maxdepth&quot;', $fs, '&quot;avgdepth&quot;', $fs, '&quot;airtemp&quot;', $fs, '&quot;watertemp&quot;', $fs, '&quot;startpressure&quot;', $fs, '&quot;endpressure&quot;', $fs, '&quot;location&quot;', $fs, '&quot;gps&quot;', $fs, '&quot;divemaster&quot;', $fs, '&quot;buddy&quot;', $fs, '&quot;suit&quot;', $fs, '&quot;rating&quot;', $fs, '&quot;visibility&quot;', $fs, '&quot;notes&quot;')"/>
    <xsl:text>
</xsl:text>
    <xsl:apply-templates select="dive|trip/dive"/>
  </xsl:template>

  <xsl:template match="dive">
    <xsl:text>&quot;</xsl:text>
    <xsl:value-of select="@number"/>
    <xsl:text>&quot;</xsl:text>
    <xsl:value-of select="$fs"/>
    <xsl:text>&quot;</xsl:text>
    <xsl:value-of select="@date"/>
    <xsl:text>&quot;</xsl:text>
    <xsl:value-of select="$fs"/>
    <xsl:text>&quot;</xsl:text>
    <xsl:value-of select="@time"/>
    <xsl:text>&quot;</xsl:text>
    <xsl:value-of select="$fs"/>
    <xsl:text>&quot;</xsl:text>
    <xsl:value-of select="@duration"/>
    <xsl:text>&quot;</xsl:text>
    <xsl:apply-templates select="divecomputer[1]/depth"/>
    <xsl:choose>
      <xsl:when test="divetemperature/@air|divetemperature/@water != ''">
        <xsl:apply-templates select="divetemperature"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates select="divecomputer[1]/temperature"/>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates select="cylinder"/>
    <xsl:apply-templates select="location"/>
    <xsl:apply-templates select="divemaster"/>
    <xsl:apply-templates select="buddy"/>
    <xsl:apply-templates select="suit"/>
    <xsl:value-of select="$fs"/>
    <xsl:text>&quot;</xsl:text>
    <xsl:value-of select="@rating"/>
    <xsl:text>&quot;</xsl:text>
    <xsl:value-of select="$fs"/>
    <xsl:text>&quot;</xsl:text>
    <xsl:value-of select="@visibility"/>
    <xsl:text>&quot;</xsl:text>
    <xsl:apply-templates select="notes"/>
    <xsl:text>
</xsl:text>
  </xsl:template>
  <xsl:template match="divecomputer/depth">
    <xsl:value-of select="$fs"/>
    <xsl:text>&quot;</xsl:text>
    <xsl:value-of select="@max"/>
    <xsl:text>&quot;</xsl:text>
    <xsl:value-of select="$fs"/>
    <xsl:text>&quot;</xsl:text>
    <xsl:value-of select="@mean"/>
    <xsl:text>&quot;</xsl:text>
  </xsl:template>
  <xsl:template match="divetemperature|temperature">
    <xsl:value-of select="$fs"/>
    <xsl:text>&quot;</xsl:text>
    <xsl:value-of select="@air"/>
    <xsl:text>&quot;</xsl:text>
    <xsl:value-of select="$fs"/>
    <xsl:text>&quot;</xsl:text>
    <xsl:value-of select="@water"/>
    <xsl:text>&quot;</xsl:text>
  </xsl:template>
  <xsl:template match="cylinder">
    <xsl:value-of select="$fs"/>
    <xsl:text>&quot;</xsl:text>
    <xsl:value-of select="@start"/>
    <xsl:text>&quot;</xsl:text>
    <xsl:value-of select="$fs"/>
    <xsl:text>&quot;</xsl:text>
    <xsl:value-of select="@end"/>
    <xsl:text>&quot;</xsl:text>
  </xsl:template>
  <xsl:template match="location">
    <xsl:value-of select="$fs"/>
    <xsl:text>&quot;</xsl:text>
    <xsl:value-of select="."/>
    <xsl:text>&quot;</xsl:text>
    <xsl:value-of select="$fs"/>
    <xsl:text>&quot;</xsl:text>
    <xsl:value-of select="@gps"/>
    <xsl:text>&quot;</xsl:text>
  </xsl:template>
  <xsl:template match="divemaster">
    <xsl:value-of select="$fs"/>
    <xsl:text>&quot;</xsl:text>
    <xsl:value-of select="."/>
    <xsl:text>&quot;</xsl:text>
  </xsl:template>
  <xsl:template match="buddy">
    <xsl:value-of select="$fs"/>
    <xsl:text>&quot;</xsl:text>
    <xsl:value-of select="."/>
    <xsl:text>&quot;</xsl:text>
  </xsl:template>
  <xsl:template match="suit">
    <xsl:value-of select="$fs"/>
    <xsl:text>&quot;</xsl:text>
    <xsl:value-of select="."/>
    <xsl:text>&quot;</xsl:text>
  </xsl:template>
  <xsl:template match="notes">
    <xsl:value-of select="$fs"/>
    <xsl:text>&quot;</xsl:text>
    <xsl:value-of select="."/>
    <xsl:text>&quot;</xsl:text>
  </xsl:template>
</xsl:stylesheet>
