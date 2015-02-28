
public class Form {
  private color     colStroke, colFill;
  private PVector[] tabPoint;
  private boolean   filled = true;

  //---------------------------------------------
  //--- CONSTRUCTOR
  //---------------------------------------------
  Form(PVector[] tab,color colStroke,color colFill) {
    this(tab);
    this.colStroke = colStroke;
    this.colFill = colFill;
  }

  Form(PVector[] tab) {
    tabPoint = new PVector[tab.length];
    for(int nb=0; nb<tab.length; nb++)
      tabPoint[nb] = tab[nb];
  } 


  //---------------------------------------------
  //--- METHODS
  //---------------------------------------------
  public void draw(PGraphics g) {
    g.stroke(colStroke);
    if(filled) {
      g.fill(colFill);
      g.beginShape();
      for(int nb=0; nb<tabPoint.length; nb++) {
        g.vertex(tabPoint[nb].x,tabPoint[nb].y,tabPoint[nb].z);
      }
      g.vertex(tabPoint[0].x,tabPoint[0].y,tabPoint[0].z);
      g.endShape();
    }
    else {
      g.noFill();
      for(int nb=0; nb<tabPoint.length-1; nb++)
        g.line(tabPoint[nb].x, tabPoint[nb].y, tabPoint[nb].z,
               tabPoint[nb+1].x, tabPoint[nb+1].y, tabPoint[nb+1].z);
      g.line(tabPoint[tabPoint.length-1].x, 
             tabPoint[tabPoint.length-1].y, 
             tabPoint[tabPoint.length-1].z,
             tabPoint[0].x,tabPoint[0].y,tabPoint[0].z);
    }
  }

  public PVector getPoint(int numPoint) {
    return(tabPoint[numPoint]);
  }    
  
  public int getNbPoint() {
    return(tabPoint.length);
  }

  public void setColStroke(color colStroke)  {
    this.colStroke = colStroke;
  }

  public void setColFill(color colFill) {
    this.colFill = colFill;
  }

}

