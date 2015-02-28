
import java.text.DecimalFormat; 

public class Axis {
  private int spacement;
  private int axisHeight;
  private int sectors = 0;
  private int axisWidth;
  private double mini, maxi;
  private double ratio;

  public Axis (int axisHeight, int spacement) {
    this.axisHeight = axisHeight;
    this.spacement = spacement;
  }
  
  public void drawTitle (String title) {
    PFont f = loadFont("Verdana-15.vlw");
    textFont(f);
    fill(0);
    textAlign(CENTER);
    text(title, width/2, 15);
  }
  
  public void drawCredits () {
    PFont f = loadFont("Verdana-9.vlw");
    textFont(f);
    fill(100);
    textAlign(LEFT);
    text("Artur Rodrigues\nCaio Rocha", 1, 10);
  }
  
  public void drawAxis (int appletWidth, int appletHeight) {
    line(spacement, appletHeight-axisHeight, appletWidth-spacement, appletHeight-axisHeight);
    for (int i=spacement; i<=appletWidth-spacement; i+=spacement) {
      if (i%100 == 0) line(i, appletHeight-axisHeight, i, appletHeight-(axisHeight-5));
      else line(i, appletHeight-axisHeight, i, appletHeight-(axisHeight-10));
      sectors++;
    }
    axisWidth = appletWidth - spacement*2;
  }
  
  public void drawGrid() {
    stroke(200);
    fill(255);
    for (int h=height-axisHeight-spacement/2-5; h>20; h-=spacement/2) {
      for (int i=spacement; i<width-spacement; i+=spacement/2) {
        rect(i, h, spacement/2, spacement/2);
      }
    }
    // Desenha o zero
    stroke(255,0,0,100);
    int zeroLine = spacement - (int) (mini/ratio);
    line(zeroLine, height-axisHeight, zeroLine, height-axisHeight-80);
  }
  
  public void drawValues (ArrayList<Integer> values) {
    int diff = values.get(values.size()-1) - values.get(0);
    double preUnits = (double) diff/(sectors-1);
    double dDiff = diff + 2*preUnits;
    double units = dDiff/(sectors-1);
    double firstV = (values.get(0) - preUnits);

    // Atribui valor minimo da escala 
    mini = firstV;

    // Define atributos da fonte
    PFont f = loadFont("Serif-11.vlw");
    textFont(f);
    fill(0);
    textAlign(CENTER);
    DecimalFormat df = new DecimalFormat("0");
    
    for (int i=spacement; i<=(spacement*sectors); i+=spacement) {     
      text(String.valueOf(df.format(firstV)), i, height-axisHeight+20);
      firstV += units;
    }

    // Atribui valor máximo da escala
    maxi = firstV - units; 
    ratio = (float) (maxi-mini)/axisWidth;
  }

  public double getRatio() {
    return ratio;
  }
  
  public double getMini() {
    return mini;
  }
  
  public int getAxisHeight() {
    return axisHeight;
  }
}


