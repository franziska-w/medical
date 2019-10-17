<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fhir="http://hl7.org/fhir">

<!-- Set separator and new line characters -->
<xsl:variable name="customSeparator" select="';'"/>
<xsl:variable name="customNewLine" select="'&#xa;'"/>

<!-- ======================================================================= -->
<!-- Template:    Match id node and Patient node                             -->
<!-- Description: Extract values of nodes appearing 0...1 per identifier     -->
<!-- ======================================================================= -->

  <xsl:template match="*|fhir:Patient">
    <xsl:variable name="id" select="fhir:id"/>
    <xsl:for-each select="fhir:identifier">
      
      <!-- id -->
      <xsl:value-of select="$id/@value"/><xsl:value-of select="$customSeparator"/>
      
      <!-- Patient/identifier has FHIR data type: Identifier -->
      <xsl:value-of select="fhir:use/@value"/><xsl:value-of select="$customSeparator"/>
      <!-- Patient/identifier/type has FHIR data type: CodeableConcept -->
      <xsl:value-of select="fhir:type/fhir:coding/fhir:system/@value"/><xsl:value-of select="$customSeparator"/>
      <xsl:value-of select="fhir:type/fhir:coding/fhir:version/@value"/><xsl:value-of select="$customSeparator"/>
      <xsl:value-of select="fhir:type/fhir:coding/fhir:code/@value"/><xsl:value-of select="$customSeparator"/>
      <xsl:value-of select="fhir:type/fhir:coding/fhir:display/@value"/><xsl:value-of select="$customSeparator"/>
      <xsl:value-of select="fhir:type/fhir:coding/fhir:userSelected/@value"/><xsl:value-of select="$customSeparator"/>
      <xsl:value-of select="fhir:type/fhir:text/@value"/><xsl:value-of select="$customSeparator"/>
      <xsl:value-of select="fhir:system/@value"/><xsl:value-of select="$customSeparator"/>
      <xsl:value-of select="fhir:value/@value"/><xsl:value-of select="$customSeparator"/>
      <xsl:value-of select="fhir:period/fhir:start/@value"/><xsl:value-of select="$customSeparator"/>
      <xsl:value-of select="fhir:period/fhir:end/@value"/><xsl:value-of select="$customNewLine"/>
      
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
