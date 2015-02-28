
class ObjArrow extends ObjTemplate /*implements Comparable*/ {
  int arrowSize;
  boolean dragged=false;

  private PVector _tp1, _tp2, _tp3;

  ObjArrow(int tX1, int tY1, int aSize, ObjHW theParent, ControlP5 tController) {
    println("constructeur ObjArrow");
    super.aController = tController;
    parent = theParent; 
    arrowSize = aSize;
  }
  
  public ObjArrow(ObjTemplate anObj) {
    parent = anObj.parent;
    super.aController =  anObj.aController;
    center.x = (int)anObj.center.x;
    center.y = (int)anObj.center.y;
    arrowSize = anObj.getObjSize();
  }

  private void processCoord(PVector aP1, PVector aP2, int tSize) {
    PVector orthoVector, vSegment, aVector, arrowBase;
    vSegment = new PVector(aP2.x-aP1.x,aP2.y-aP1.y,0);
    orthoVector = _getOrthogonalVector(aP1, aP2);
    orthoVector.mult(tSize/2);
    aVector = vSegment;
    aVector.normalize();
    aVector.mult(tSize/2);
    arrowBase = PVector.sub(aP2, aVector);
    _tp1 = PVector.add(arrowBase, orthoVector);
    _tp2 = PVector.sub(arrowBase, orthoVector);
    aVector.normalize();
    aVector.mult(tSize/2);
    _tp3 = PVector.add(aP2, aVector );
    /*
    println("tp1:"+_tp1);
    println("tp2:"+_tp2);
    println("tp3:"+_tp3);
    */
  }

  public void drawIt(PGraphics aBuffer, int contourWeight, int typeBuffer){
    if (typeBuffer ==  1) {
      aBuffer.fill(color(id));
    }
    ObjTemplate myMate = getMyMate();    
    if (myMate != null) {
      processCoord(myMate.center, center, arrowSize+contourWeight);
      aBuffer.beginDraw();
      aBuffer.noStroke();
      aBuffer.triangle(_tp1.x, _tp1.y,_tp2.x, _tp2.y,_tp3.x, _tp3.y);
      aBuffer.endDraw();
    }


  }
  
  public void toXml(StringBuilder aSB) {
    aSB.append("<ObjArrow id='"+id+"'>");
    aSB.append("<arrowSize>"+arrowSize+"</arrowSize>");
    //aSB.append("<position x='"+x+"' y='"+y+"'/>");
    aSB.append("</ObjArrow>");
  }
  
  public void setObjSize(int aSize) {
    arrowSize = aSize; 
  }
  
  public int getObjSize() {
    return arrowSize; 
  }

}


