
public class Genome {
	
  static final int MAXSIZE = 40;
  static final int MAXWALL = 10;
  static final int MAXSTARTINGWALL = 2;
  static final int MAXSHAPE = 3;
  static final int MAXHUE = 360;
  static final int MAXSAT = 50;
  static final int MAXBRT = 70;
  
  public int gSize;
  public int gWall;
  public int gShape;
  public int gBrt;
  public int gHue;
  public int gSat;
  
  
  public String hashDispaly() {
	  return Integer.toBinaryString(gSize + gWall + gShape + gBrt + gHue + gSat);
  }
  
  public int getWall() {
	  return gWall;
  }
  public int getSize() {
	  return gSize + 10;
  }
  public int getShape() {
	  return gShape;
  }
  public void setToColor() {
	  colorMode(PApplet.HSB, 360, 100, 100);
	  fill(color(gHue, gSat+50, gBrt+30));
	  stroke(color(gHue, gSat+25, gBrt+15));
	  strokeWeight(gWall*1.5f);
  }
  
  public Genome() {  
    gSize = (int)random(MAXSIZE+1);
    gWall = (int)random(MAXSTARTINGWALL+1);
    gShape = (int)random(MAXSHAPE+1);
    gHue = (int)random(MAXHUE+1);
    gSat = (int)random(MAXSAT+1);
    gBrt = (int)random(MAXBRT+1);
  }
    
  public Genome(Genome g) {
    gSize = g.gSize;
    gWall = g.gWall;
    gShape = g.gShape;
    gHue = g.gHue;
    gSat = g.gSat;
    gBrt = g.gBrt;

    mutateAllValues();
  }
  
  public void mutateAllValues() {
    gSize = mutate(gSize, MAXSIZE, 7, 7);
    gWall = mutate(gWall, MAXWALL, 5, 2);
    gShape = mutate(gShape, MAXSHAPE, 4, 1);
    gHue = mutate(gHue, MAXHUE, 5, 10);
    gSat = mutate(gSat, MAXSAT, 7, 20);
    gBrt = mutate(gBrt, MAXBRT, 5, 20);
  }
  
  private int mutate(int startValue, int maxValue, int rate, int varyAmount) {
    if(random(100) < rate) {
      int minRange = startValue - varyAmount;
      int maxRange = startValue + varyAmount;
      if(minRange < 0) {
        minRange = 0;
      }
      if(maxRange > maxValue) {
        maxRange = maxValue;
      }
      int resultValue = (int)random(minRange, maxRange+1);
      
      return mutate(resultValue, rate, maxValue, varyAmount);
    }
    
    return startValue;
  }
}

