<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fhir="http://hl7.org/fhir">

<!-- ======================================================================= -->
<!-- Template:    Match id node and Medication node                          -->
<!-- Description: Extract values of nodes appearing 0...1 per ingredient     -->
<!-- ======================================================================= -->

  <xsl:template match="*|fhir:Medication">
    <xsl:variable name="id" select="fhir:id"/>
    <xsl:for-each select="fhir:ingredient">
      <xsl:value-of select="$id/@value"/><xsl:text>;</xsl:text>

      <!-- FHIR data type: CodeableConcept -->
      <xsl:value-of select="fhir:itemCodeableConcept/fhir:coding/fhir:system/@value"/><xsl:text>;</xsl:text>
      <xsl:value-of select="fhir:itemCodeableConcept/fhir:coding/fhir:version/@value"/><xsl:text>;</xsl:text>
      <xsl:value-of select="fhir:itemCodeableConcept/fhir:coding/fhir:code/@value"/><xsl:text>;</xsl:text>
      <xsl:value-of select="fhir:itemCodeableConcept/fhir:coding/fhir:display/@value"/><xsl:text>;</xsl:text>
      <xsl:value-of select="fhir:itemCodeableConcept/fhir:coding/fhir:userSelected/@value"/><xsl:text>;</xsl:text>
      <xsl:value-of select="fhir:itemCodeableConcept/fhir:text/@value"/><xsl:text>;</xsl:text>

      <!-- FHIR data type: Reference -->
      <xsl:value-of select="fhir:itemReference/fhir:reference/@value"/><xsl:text>;</xsl:text>
      <xsl:value-of select="fhir:itemReference/fhir:type/@value"/><xsl:text>;</xsl:text>
      <!-- Add item reference identifier here if required -->
      <xsl:value-of select="fhir:itemReference/fhir:display/@value"/><xsl:text>;</xsl:text>

      <xsl:value-of select="fhir:isActive/@value"/><xsl:text>;</xsl:text>

      <!-- FHIR data type: Ratio -->
      <!-- FHIR data type: Quantity -->
      <xsl:value-of select="fhir:strength/fhir:numerator/fhir:value/@value"/><xsl:text>;</xsl:text>
      <xsl:value-of select="fhir:strength/fhir:numerator/fhir:comparator/@value"/><xsl:text>;</xsl:text>
      <xsl:value-of select="fhir:strength/fhir:numerator/fhir:unit/@value"/><xsl:text>;</xsl:text>
      <xsl:value-of select="fhir:strength/fhir:numerator/fhir:system/@value"/><xsl:text>;</xsl:text>
      <xsl:value-of select="fhir:strength/fhir:numerator/fhir:code/@value"/><xsl:text>;</xsl:text>
      <!-- FHIR data type: Quantity -->
      <xsl:value-of select="fhir:strength/fhir:denominator/fhir:value/@value"/><xsl:text>;</xsl:text>
      <xsl:value-of select="fhir:strength/fhir:denominator/fhir:comparator/@value"/><xsl:text>;</xsl:text>
      <xsl:value-of select="fhir:strength/fhir:denominator/fhir:unit/@value"/><xsl:text>;</xsl:text>
      <xsl:value-of select="fhir:strength/fhir:denominator/fhir:system/@value"/><xsl:text>;</xsl:text>
      <xsl:value-of select="fhir:strength/fhir:denominator/fhir:code/@value"/><xsl:text>&#xa;</xsl:text>

    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
