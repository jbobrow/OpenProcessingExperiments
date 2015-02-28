
class CurveParam {

  // VARIABLES //
  String    crvType;
  ArrayList allpts;
  color     linePrmCOL;
  int       strokePrmThickness;
  float     COL = 0;

  // CONSRUCTOR ASSIGN ALL THE VARIABLES
  CurveParam(String CTYPE, ArrayList ALLPTS) {
    crvType            = CTYPE;
    allpts             = (ArrayList) ALLPTS.clone();
    strokePrmThickness = 3;

    if ( crvType.equals( "  1  " ) ) linePrmCOL = color(10, 100, 100);
    else if ( crvType.equals( "  2  " ) ) linePrmCOL = color(20, 100, 100);
    else if ( crvType.equals( "  3  " ) ) linePrmCOL = color(40, 100, 100);
    else if ( crvType.equals( "  4  " ) ) linePrmCOL = color(80, 100, 100);
    else if ( crvType.equals( "  5  " ) ) linePrmCOL = color(60, 100, 100);
    else linePrmCOL = color(35, 100, 100);
  }

  // METHODS //
  void run() {
    render();
    renderActiveNode();
  }

  void renderActiveNode() {
    for (int i=0 ; i<allpts.size(); i++) {
      PVector allptsTmp = (PVector) allpts.get(i);
      float dist2mouse = dist(allptsTmp.x, allptsTmp.y, mouseX, mouseY );
      if ( dist2mouse < 8 ) {
        boolean SELECT = true;
        pushStyle();
        noStroke();
        fill(COL);
        ellipse( allptsTmp.x, allptsTmp.y, 10, 10 );
      }
    }
  }
  void render() {
    pushStyle();
    stroke(linePrmCOL);
    strokeWeight(strokePrmThickness);
    noFill();
    beginShape();
    for (int i=0 ; i<allpts.size(); i++) {
      PVector allptsTmp = (PVector) allpts.get(i);
      vertex(allptsTmp.x, allptsTmp.y);
    }
    endShape();
    popStyle();
  }
}


