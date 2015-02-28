
class Association { 
  /* Association class to hold data about associations between parties and 
   their start and end positions 
   */
  String sourceId;
  String linkLabel;
  String destId;
  int startDate;
  int endDate;
  float xPosStart = 0;
  float yPosStart = 0;
  float xPosEnd = 0;
  float yPosEnd = 0;
  int linkType = 0;

  /* Default constructor for the class.  Takes a String[] array which is 
   itself tokenised data from on line of the input file */
  Association(String[] assocPieces) { 
    sourceId = assocPieces[1];
    destId = assocPieces[2];
    linkLabel = assocPieces[3];
    startDate = int (assocPieces[4]);
    endDate = int (assocPieces[5]);
    /* hased on the text in linkLabel generate a linkType integer (used in 
     switch statement below 
     */
    if (linkLabel.equals("hier-parent")) {
      linkType = 1;
    }
    if (linkLabel.equals("hier-child")) {
      linkType = 1;
    }
    if (linkLabel.equals("temp-earlier")) {
      linkType = 2;
    }
    if (linkLabel.equals("temp-later")) {
      linkType = 2;
    }
    if (linkLabel.equals("associative")) {
      linkType = 3;
    }
  }
  /* Method to set start coordinates 
   */
  public void assignCoordsStart(float _xPosStart, float _yPosStart) {
    xPosStart = _xPosStart;
    yPosStart = _yPosStart;
  }
  /* Method to set end coordinates 
   */
  public void assignCoordsEnd(float _xPosEnd, float _yPosEnd) {
    xPosEnd = _xPosEnd;
    yPosEnd = _yPosEnd;
  }
  /* Accessor to get sourceId of object 
   */
  public String getSourceId() {
    return sourceId;
  }
  /* Accessor to get destId of object 
   */
  public String getDestId() {
    return destId;
  }
  /* method to draw association 
   */
  void draw() {
    if (xPosStart != 0 && yPosStart!= 0 && xPosEnd != 0 && yPosEnd!= 0) {
      /* Draw smoothly 
      */
      smooth();
      /* Select colour of stroke based on the linkType integer
      */
      switch(linkType) {
      case 0:
        stroke(255, 255,255,100);
        break;
      case 1:
        stroke(255, 0,0,100);
        break;
      case 2:
        stroke(0,255,0,100);
        break;
      case 3:
        stroke(0, 0,255,100);
        break;
      default:
        stroke(255);
        break;
      }
      
      fill(0,0);
      strokeWeight(2);
      /* draw bezier curve for association 
      */
      bezier(xPosStart, yPosStart, 500, height/2, 500, height/2, xPosEnd, yPosEnd);
      }
  }
}


