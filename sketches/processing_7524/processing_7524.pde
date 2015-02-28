
import controlP5.*;

ControlP5 controlP5;
Thing thing;
ArrayList things;

PVector mouseVector;

public int showPoints;
CheckBox showPointsToggle;

public int showFill;
CheckBox showFillToggle;

public float shellDistance = 50;
public float shellFactor = 10;
public int blurLevel = 5;
public float threshold = 0.5;
public int thingsWanted;


void setup() {
  size(564, 564);
  smooth();

  controlP5 = new ControlP5(this);
  Slider shellDistanceSlider = controlP5.addSlider("shellDistance",0,500,50,10,10,400,10);  
  Slider shellFactorSlider = controlP5.addSlider("shellFactor",1,50,10,10,30,400,10);
  Slider blurLevelSlider = controlP5.addSlider("blurLevel",1,50,5,10,50,400,10);
  Slider thresholdSlider = controlP5.addSlider("threshold",0.0,1.0,0.5,10,70,400,10);  
  Slider thingsWantedSlider = controlP5.addSlider("thingsWanted",1,200,15,10,90,400,10);    
  showPointsToggle = controlP5.addCheckBox("showPointsToggle", 10, height - 20);
  showPointsToggle.addItem("Show Points", 1);
  showFillToggle = controlP5.addCheckBox("showFillToggle", 10, height - 40);
  showFillToggle.addItem("Show Fill", 1);
  showFillToggle.activate(0);  
  
  things = new ArrayList();
  thingsWanted = 20;
  
  mouseVector = new PVector(mouseX, mouseY);
  
  background(0);  
}

void draw() {
  
  // brew some things
  
  
  while(things.size() < thingsWanted) {
    things.add(new Thing(new PVector(0, 0), new PVector(0, 0), new PVector((width / 2) + random(-5, 5), (height / 2) + random(-5, 5)), things.size()));
  }
  
  // prune some things  
  while(things.size() > thingsWanted + 1) {
    things.remove(0);
  }
  
  fill(0, 50);
  rect(0, 0, width, height);
  
  if(showFill == 0) {
    background(0);
  }
  
  // resist each other
  for(int i = 0; i < things.size(); i++) {
    Thing thingA = (Thing)things.get(i);

    for(int j = 0; j < things.size(); j++) {
      if(i != j) {
        // grab each thing
        Thing thingB = (Thing)things.get(j);
        
        // difference
        PVector difference = PVector.sub(thingA.loc, thingB.loc);
        float distance = difference.mag();
        difference.normalize();
        
        // reverses the factor when distance is less than shellDistance
        float factor = -(distance - shellDistance) / shellFactor;
        
        difference.mult(factor);
        thingA.acc = difference;                
        //drawVector(thingA.acc, thingA.loc, 100);        
      }
    }
  }

  // how to connect vertices in the right order?
 //  http://processing.org/discourse/yabb2/YaBB.pl?num=1251409480/1

  showFill = round(showFillToggle.getItem(0).value());

  beginShape();

  ArrayList usedIndexes = new ArrayList();

  for(int i = 0; i < things.size(); i++) {
    float minDistance = 99999999;
    Thing thingA = (Thing)things.get(i);
    
    for(int j = 0; j < things.size(); j++) {
      if(i != j) {

        Thing thingB = (Thing)things.get(j);
        float distance = PVector.dist(thingA.loc, thingB.loc);

        // make sure the index isn't taken already?
        if(!usedIndexes.contains(j)) {            

          if(distance < minDistance) {
            minDistance = distance;
            thingA.closestIndex = j;
          }

        }
  
      }
    }

    noFill();
    if(showFill == 1) fill(255);
    Thing nextThing = (Thing)things.get(thingA.closestIndex);
    //stroke(255);
    //strokeWeight(10);
    
    curveVertex(nextThing.loc.x, nextThing.loc.y);    
    usedIndexes.add(thingA.closestIndex);
    usedIndexes.add(i);    
    
  }
  
  endShape(CLOSE);  
  
  // println("------------------------------------");
  // for(int i = 0; i < things.size(); i++) {
  //   Thing thing = (Thing)things.get(i);    
  //   println("index " + i + " is closest to " + thing.closestIndex);
  // }  
  
  noStroke();
  // make blobish
  
  if(showFill == 1) {  
    loadPixels();
    fastblur(blurLevel);
    updatePixels();
    filter(THRESHOLD, threshold);
  }

  mouseVector.x = mouseX;
  mouseVector.y = mouseY;  

  showPoints = round(showPointsToggle.getItem(0).value());

  for(int i = 0; i < things.size(); i++) {
    Thing thing = (Thing)things.get(i);
    PVector difference = PVector.sub(mouseVector, thing.loc);    
    difference.normalize();
    difference.mult(0.1);
    //thing.acc = difference;
  
    thing.closestIndex = 0;
    thing.tick();

    if(showPoints == 1) thing.render();

  }
  


}


// Renders a vector object 'v' as an arrow and a location 'loc'
// From Dan Shiffman's example
void drawVector(PVector v, PVector loc, float scale) {
  pushMatrix();
  float arrowsize = 12;
  // Translate to location to render vector
  translate(loc.x,loc.y);
  stroke(255);
	strokeWeight(2);
	
  // Call vector heading function to get direction (note that pointing up is a heading of 0) and rotate
  rotate(v.heading2D());
  // Calculate length of vector & scale it to be bigger or smaller if necessary
  float len = v.mag()*scale;
  // Draw three lines to make an arrow (draw pointing up since we've rotate to the proper direction)
  line(0,0,len,0);
  line(len,0,len-arrowsize,+arrowsize/2);
  line(len,0,len-arrowsize,-arrowsize/2);
  popMatrix();
}

// Adapted from http://incubator.quasimondo.com/processing/superfastblur.pde
void fastblur(int radius){

  if (radius<1){
    return;
  }
  int w=width;
  int h=height;
  int wm=w-1;
  int hm=h-1;
  int wh=w*h;
  int div=radius+radius+1;
  int r[]=new int[wh];
  int g[]=new int[wh];
  int b[]=new int[wh];
  int rsum,gsum,bsum,x,y,i,p,p1,p2,yp,yi,yw;
  int vmin[] = new int[max(w,h)];
  int vmax[] = new int[max(w,h)];
  int dv[]=new int[256*div];
  for (i=0;i<256*div;i++){
     dv[i]=(i/div); 
  }
  
  yw=yi=0;
 
  for (y=0;y<h;y++){
    rsum=gsum=bsum=0;
    for(i=-radius;i<=radius;i++){
      p=pixels[yi+min(wm,max(i,0))];
      rsum+=(p & 0xff0000)>>16;
      gsum+=(p & 0x00ff00)>>8;
      bsum+= p & 0x0000ff;
   }
    for (x=0;x<w;x++){
    
      r[yi]=dv[rsum];
      g[yi]=dv[gsum];
      b[yi]=dv[bsum];

      if(y==0){
        vmin[x]=min(x+radius+1,wm);
        vmax[x]=max(x-radius,0);
       } 
       p1=pixels[yw+vmin[x]];
       p2=pixels[yw+vmax[x]];

      rsum+=((p1 & 0xff0000)-(p2 & 0xff0000))>>16;
      gsum+=((p1 & 0x00ff00)-(p2 & 0x00ff00))>>8;
      bsum+= (p1 & 0x0000ff)-(p2 & 0x0000ff);
      yi++;
    }
    yw+=w;
  }
  
  for (x=0;x<w;x++){
    rsum=gsum=bsum=0;
    yp=-radius*w;
    for(i=-radius;i<=radius;i++){
      yi=max(0,yp)+x;
      rsum+=r[yi];
      gsum+=g[yi];
      bsum+=b[yi];
      yp+=w;
    }
    yi=x;
    for (y=0;y<h;y++){
      pixels[yi]=0xff000000 | (dv[rsum]<<16) | (dv[gsum]<<8) | dv[bsum];
      if(x==0){
        vmin[y]=min(y+radius+1,hm)*w;
        vmax[y]=max(y-radius,0)*w;
      } 
      p1=x+vmin[y];
      p2=x+vmax[y];

      rsum+=r[p1]-r[p2];
      gsum+=g[p1]-g[p2];
      bsum+=b[p1]-b[p2];

      yi+=w;
    }
  }

}

