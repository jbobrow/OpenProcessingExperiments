
class Chair {

  int chairWidth;
  int chairThickness;
  int chairDepth;

  int chairBackHeight;

  int chairLegWidth;
  int chairLegDepth; // = chairLegWidth
  int chairLegHeight;

  Chair(int _chairWidth, int _chairThickness, int _chairDepth, int _chairBackHeight, int _chairLegWidth, int _chairLegDepth, int _chairLegHeight) {
    this.chairWidth = _chairWidth;
    this.chairThickness = _chairThickness;
    this.chairDepth = _chairDepth;
    this.chairBackHeight = _chairBackHeight;
    this.chairLegWidth = _chairLegWidth;
    this.chairLegDepth = _chairLegDepth;
    this.chairLegHeight = _chairLegHeight;
  }

  void renderChair() {
    // seat
    box(chairWidth, chairThickness, chairDepth);

    // back
    pushMatrix();
    translate(0, -chairBackHeight/2+chairThickness/2, -chairDepth/2-chairThickness/2);
    box(chairWidth, chairBackHeight, chairThickness);
    popMatrix();

    // front legs
    // left
    pushMatrix();
    translate(-chairWidth/2+chairLegWidth/2, chairLegHeight/2+chairThickness/2, chairDepth/2-chairLegDepth/2);
    box(chairLegWidth, chairLegHeight, chairLegDepth);
    popMatrix();

    // right
    pushMatrix();
    translate(chairWidth/2-chairLegWidth/2, chairLegHeight/2+chairThickness/2, chairDepth/2-chairLegDepth/2);
    box(chairLegWidth, chairLegHeight, chairLegDepth);
    popMatrix();

    // back legs
    // left
    pushMatrix();
    translate(-chairWidth/2+chairLegWidth/2, chairLegHeight/2+chairThickness/2, -chairDepth/2-chairLegDepth/2);
    box(chairLegWidth, chairLegHeight, chairLegDepth);
    popMatrix();

    // right
    pushMatrix();
    translate(chairWidth/2-chairLegWidth/2, chairLegHeight/2+chairThickness/2, -chairDepth/2-chairLegDepth/2);
    box(chairLegWidth, chairLegHeight, chairLegDepth);
    popMatrix();
  }
}


