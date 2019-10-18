<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fhir="http://hl7.org/fhir">

<!-- Set separator and new line characters -->
<xsl:variable name="customSeparator" select="';'"/>
<xsl:variable name="customNewLine" select="'&#xa;'"/>

<!-- Header information:
     id;coding_system;coding_code;coding_display;numerator_value;numerator_system;numerator_code;denominator_value;denominator_system;denominator_code -->
  
<!-- ======================================================================= -->
<!-- Template:    Match id node and Medication node                          -->
<!-- Description: Extract values of nodes appearing 0...1 per ingredient     -->
<!-- ======================================================================= -->

  <xsl:template match="*|fhir:Medication">

    <xsl:variable name="id" select="fhir:id"/>
    <xsl:for-each select="fhir:ingredient">
      
      <!-- id -->
      <xsl:value-of select="$id/@value"/><xsl:value-of select="$customSeparator"/>

      <!-- Medication/ingredient/itemCodeableConcept has FHIR data type: CodeableConcept -->
      <xsl:value-of select="fhir:itemCodeableConcept/fhir:coding/fhir:system/@value"/><xsl:value-of select="$customSeparator"/>
      <xsl:value-of select="fhir:itemCodeableConcept/fhir:coding/fhir:code/@value"/><xsl:value-of select="$customSeparator"/>
      <xsl:value-of select="fhir:itemCodeableConcept/fhir:coding/fhir:display/@value"/><xsl:value-of select="$customSeparator"/>

      <!-- Medication/ingredient/strength has FHIR data type: Ratio -->
      <!-- Medication/ingredient/strength/numerator has FHIR data type: Quantity -->
      <xsl:value-of select="fhir:strength/fhir:numerator/fhir:value/@value"/><xsl:value-of select="$customSeparator"/>
      <xsl:value-of select="fhir:strength/fhir:numerator/fhir:system/@value"/><xsl:value-of select="$customSeparator"/>
      <xsl:value-of select="fhir:strength/fhir:numerator/fhir:code/@value"/><xsl:value-of select="$customSeparator"/>
      <!-- Medication/ingredient/strength/denominator has FHIR data type: Quantity -->
      <xsl:value-of select="fhir:strength/fhir:denominator/fhir:value/@value"/><xsl:value-of select="$customSeparator"/>
      <xsl:value-of select="fhir:strength/fhir:denominator/fhir:system/@value"/><xsl:value-of select="$customSeparator"/>
      <xsl:value-of select="fhir:strength/fhir:denominator/fhir:code/@value"/><xsl:value-of select="$customNewLine"/>

    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
