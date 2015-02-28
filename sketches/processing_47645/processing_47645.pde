
final String GEOLOCFILE="locs2.txt";
final String DELIM=";";

final float SCATTER_DIST =0.0007;
final int PEOPLE_PR_DOT=10;
final float RELATIVE_DOT_SIZE=.00020;
final float C1=0.0000001;
color DOT_COLOR=color(0,0,0,50);

final int POP_COLUMN=3;

final int STREET_START_X_COLUMN=4;
final int STREET_START_Y_COLUMN=5;

int picstaken=0;


String[][] data;
Location[] popDots;
Location[] streetStarts;




import processing.opengl.*;
import codeanticode.glgraphics.*;
import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.utils.*;

de.fhpotsdam.unfolding.Map map;



public void setup() {
  size(1000, 800, GLConstants.GLGRAPHICS);
  
  readGeoFile();
  makePopDots();
   
  noStroke();


  map = new de.fhpotsdam.unfolding.Map(this);
  map.setTweening(true);
  map.zoomToLevel(12);
  map.panTo(new Location(float(data[81][0]), float(data[81][1])));
  MapUtils.createDefaultEventDispatcher(this, map);
}

public void draw() {
  background(10);
  map.draw();

  float s = RELATIVE_DOT_SIZE*map.getZoom();
  for(int i=0; i<popDots.length;i++){
    float xyLoc01[] = map.getScreenPositionFromLocation(popDots[i]);
    float xyLoc02[] = map.getScreenPositionFromLocation(streetStarts[i]);
    fill(DOT_COLOR);
    float w=dist(xyLoc01[0],xyLoc01[1],xyLoc02[0],xyLoc02[1]);
    float p=float(data[i+1][POP_COLUMN]);
    float alph=atan2(xyLoc01[1]-xyLoc02[1],xyLoc01[0]-xyLoc02[0]);
    float h=s*sqrt(p);
    pushMatrix();
    translate(xyLoc01[0],xyLoc01[1]);
    rotate(alph);
    ellipseMode(CENTER);
    textAlign(CENTER,BOTTOM);
    textSize(12);
    fill(DOT_COLOR);
    ellipse(0,0,2*h,h);
    //text(data[i+1][2],0,0);
    popMatrix();
  }
  //save("backmap.jpg");
}

int howManyDots(int people)
{
  int tmp=people/PEOPLE_PR_DOT;
  return tmp;
}

void keyPressed()
{
  picstaken++;
  save("rvkstreets"+picstaken+".jpg");
}



void makePopDots(){
  popDots=new Location[data.length-1];
  streetStarts = new Location[data.length-1];
  int currPos=0;
  
  for(int i=1; i<data.length;i++){
    float xC=float(data[i][0]);
    float yC=float(data[i][1]);
    float xS=float(data[i][STREET_START_X_COLUMN]);
    float yS=float(data[i][STREET_START_Y_COLUMN]);
    popDots[currPos] = new Location(xC,yC);
    streetStarts[currPos++]=new Location(xS,yS);
  }
}



void readGeoFile(){
  String[] lines=loadStrings(GEOLOCFILE);
  data=new String[lines.length][]; 
  for(int i=0;i<lines.length;i++)
  {
    String[] pieces = split(lines[i], DELIM);
    data[i]=pieces;
  }
    
}
  




