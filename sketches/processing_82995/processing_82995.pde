
ArrayList<PVector> anchorPoints = new ArrayList<PVector>();
int amountAnchors=8;

float lerpProgress;
int index;

ArrayList<PVector> currentPoints = new ArrayList<PVector>();

PVector lerpPoint;

void setup(){

  size(800,600);
  smooth();
  

  for(int i=0; i<amountAnchors; i++){
    PVector p = new PVector(random(width),random(height));
    anchorPoints.add(p);
  }
  anchorPoints.set(0,anchorPoints.get(1));
  anchorPoints.set(amountAnchors-1,anchorPoints.get(amountAnchors-2));
  
  for(int i=0; i<4; i++){
    currentPoints.add(new PVector(0,0));
  }
  
  lerpPoint = new PVector(0,0);
  
}

void draw(){
  
  background(255);
  
  lerpProgress = map(mouseX,0,width,1,amountAnchors-2);
  index = floor(lerpProgress);
  println("lerpProgress: " + lerpProgress + " / index: " + index);
  
  for(int i=0; i<4; i++){
    currentPoints.get(i).set(anchorPoints.get(index+i-1).x,anchorPoints.get(index+i-1).y,0);
  }
  
  lerpPoint.x = curvePoint(currentPoints.get(0).x, currentPoints.get(1).x, currentPoints.get(2).x, currentPoints.get(3).x, lerpProgress-index);
  lerpPoint.y = curvePoint(currentPoints.get(0).y, currentPoints.get(1).y, currentPoints.get(2).y, currentPoints.get(3).y, lerpProgress-index);
  
  pushStyle();
  fill(0,0,255);
  ellipse(lerpPoint.x, lerpPoint.y, 20,20);
  popStyle();
  
  beginShape();
  for(int i=0; i<amountAnchors; i++){
    PVector p = anchorPoints.get(i);
    pushStyle();
    noFill();
    curveVertex(p.x,p.y);
    popStyle();
    pushStyle();
    fill(0);
    ellipse(p.x,p.y,10,10);
    text(i,p.x+10, p.y+10);
    popStyle();
  }
  endShape();
  
  float tightness = map(mouseY,0,width,-5,5);
  curveTightness(tightness);
  

}

void keyPressed(){
  anchorPoints.clear();
  anchorPoints.add(new PVector(0,0));
  for(int i=1; i<amountAnchors-1; i++){
    PVector p = new PVector(random(width),random(height));
    anchorPoints.add(p);
  }
  anchorPoints.set(0,anchorPoints.get(1));
  anchorPoints.add(amountAnchors-1,anchorPoints.get(amountAnchors-2));
}


