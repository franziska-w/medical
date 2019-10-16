<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fhir="http://hl7.org/fhir">

<!-- Set separator and new line characters -->
<xsl:variable name="customSeparator" select="';'"/>
<xsl:variable name="customNewLine" select="'&#xa;'"/>

<!-- ======================================================================= -->
<!-- Template:    Match id node and Patient node                             -->
<!-- Description: Extract values of nodes appearing 0...1 per Patient        -->
<!-- ======================================================================= -->

  <xsl:template match="*|fhir:Patient">

    <!-- Patient id -->
    <xsl:value-of select="fhir:id/@value"/><xsl:value-of select="$customSeparator"/>
    
    <xsl:value-of select="fhir:active/@value"/><xsl:value-of select="$customSeparator"/>
    <xsl:value-of select="fhir:gender/@value"/><xsl:value-of select="$customSeparator"/>
    <xsl:value-of select="fhir:birthDate/@value"/><xsl:value-of select="$customSeparator"/>
    
    <xsl:value-of select="fhir:deceasedBoolean/@value"/><xsl:value-of select="$customSeparator"/>
    <xsl:value-of select="fhir:deceasedDateTime/@value"/><xsl:value-of select="$customSeparator"/>
    
    <xsl:value-of select="fhir:multipleBirthBoolean/@value"/><xsl:value-of select="$customSeparator"/>
    <xsl:value-of select="fhir:multipleBirthInteger/@value"/><xsl:value-of select="$customSeparator"/>
    
    <!-- FHIR data type: Reference -->
    <xsl:value-of select="fhir:managingOrganization/fhir:reference/@value"/><xsl:value-of select="$customSeparator"/>
    <xsl:value-of select="fhir:managingOrganization/fhir:type/@value"/><xsl:value-of select="$customSeparator"/>
    <!-- add managing organization identifier here if required -->
    <xsl:value-of select="fhir:managingOrganization/fhir:display/@value"/><xsl:value-of select="$customNewLine"/>
    
  </xsl:template>
</xsl:stylesheet>
