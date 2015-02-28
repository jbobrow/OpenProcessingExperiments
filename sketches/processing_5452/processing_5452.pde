
/**
 * An object that looks like a 3D arc
 */
class Arc3D {
  
  int resolution = 128;
  float[] tubeXi;
  float[] tubeXo;
  float[] tubeYi;
  float[] tubeYo;
  float angleStart, angleWidth;
  float radius, thickness, elevation;
  color fillColor;
  
  public Arc3D(float angleStart, float angleWidth, float radius, float thickness, float elevation, color fillColor) {
    setAngleStart(angleStart);
    setAngleWidth(angleWidth);
    setRadius(radius);
    setThickness(thickness);
    setElevation(elevation);
    setFillColor(fillColor);
    setResolution(resolution);
    recalculate();
  }
  
  void setResolution(int resolution) {
    this.resolution = resolution;
    this.tubeXi = new float[resolution];
    this.tubeYi = new float[resolution];
    this.tubeXo = new float[resolution];
    this.tubeYo = new float[resolution];
  }
  
  int getResolution() {
    return resolution;
  }
  
  void setFillColor(color fillColor) {
    this.fillColor = fillColor;
  }
  
  color getFillColor() {
    return fillColor;
  }
  
  void setElevation(float elevation) {
    this.elevation = elevation;
  }
  
  float getElevation() {
    return elevation;
  }
  
  void setAngleStart(float angleStart) {
    this.angleStart = angleStart;
  }
  
  float getAngleStart() {
    return angleStart;
  }
  
  void setAngleWidth(float angleWidth) {
    this.angleWidth = angleWidth;
  }
  
  float getAngleWidth() {
    return angleWidth;
  }
  
  void setRadius(float radius) {
    this.radius = radius;
  }
  
  float getRadius() {
    return radius;
  }
  
  void setThickness(float thickness) {
    this.thickness = thickness;
  }
  
  float getThickness() {
    return thickness;
  }
  
  void recalculate() {
    float radiusLo = radius - thickness / 2;
    float radiusHi = radius + thickness / 2;
    float angle = angleWidth / (resolution - 1);
    for (int i = 0; i < this.resolution; i++) {
      this.tubeXi[i] = radiusLo * cos(i * angle);
      this.tubeYi[i] = radiusLo * sin(i * angle);
      this.tubeXo[i] = radiusHi * cos(i * angle);
      this.tubeYo[i] = radiusHi * sin(i * angle);
    }
  }
  
  void display() {
    fill(fillColor);
    pushMatrix();
    rotateY(angleStart);
    // inside
    beginShape(QUAD_STRIP);
    for (int i = 0; i < resolution; i++) {
      vertex(tubeXi[i], 0,              tubeYi[i]);
      vertex(tubeXi[i], elevation, tubeYi[i]);
    }
    endShape();
    // outside
    beginShape(QUAD_STRIP);
    for (int i = 0; i < resolution; i++) {
      vertex(tubeXo[i], 0,              tubeYo[i]);
      vertex(tubeXo[i], elevation, tubeYo[i]);
    }
    endShape();
    // start
    beginShape(QUAD_STRIP);
    vertex(tubeXo[0], 0,         tubeYo[0]);
    vertex(tubeXo[0], elevation, tubeYo[0]);
    vertex(tubeXi[0], 0,         tubeYi[0]);
    vertex(tubeXi[0], elevation, tubeYi[0]);
    endShape();
    // end
    beginShape(QUAD_STRIP);
    vertex(tubeXo[resolution - 1], 0,         tubeYo[resolution - 1]);
    vertex(tubeXo[resolution - 1], elevation, tubeYo[resolution - 1]);
    vertex(tubeXi[resolution - 1], 0,         tubeYi[resolution - 1]);
    vertex(tubeXi[resolution - 1], elevation, tubeYi[resolution - 1]);
    endShape();
    // bottom
    beginShape(QUAD_STRIP);
    for (int i = 0; i < resolution; i++) {
      vertex(tubeXi[i], 0, tubeYi[i]);
      vertex(tubeXo[i], 0, tubeYo[i]);
    }
    endShape();
    // up
    beginShape(QUAD_STRIP);
    for (int i = 0; i < resolution; i++) {
      vertex(tubeXi[i], elevation, tubeYi[i]);
      vertex(tubeXo[i], elevation, tubeYo[i]);
    }
    endShape();
    
    popMatrix();
  }
  
}


