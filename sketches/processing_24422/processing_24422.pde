



int x = 0;
float placementOne = -5;
int lineOne = 0;
float ellipseSize = random(50,125);

float placementOne2 = -5;
int lineOne2 = 0;
float ellipseSize2 = random(50,125);

void setup() {
  
  size (250,500);
  
  
  background(193,193,193);
  strokeWeight(1);
  strokeCap(SQUARE);
  smooth();
  
}

void draw() {
  
  while (x<8000){
  stroke(255,random(0,200));
  line (random(-1000,1000),random(-2000,2000),random(-1000,1000),random(-2000,2000));
x=x+1;  
}

while (lineOne<625){
placementOne = -5;
ellipseSize = random(50,125);

while (placementOne<300){
fill(0,56,124);
noStroke();
arc(placementOne,lineOne,ellipseSize,ellipseSize,PI,TWO_PI);

fill(255);
arc(placementOne,lineOne,ellipseSize-5,ellipseSize-5,PI,TWO_PI);

fill(0,56,124);
stroke(255,234,0);
strokeWeight(3);
arc(placementOne,lineOne,ellipseSize-15,ellipseSize-15,PI,TWO_PI);

placementOne = placementOne+ellipseSize;
}

lineOne = lineOne+125;}

while (lineOne2<625){
placementOne2 = -5;
ellipseSize2 = random(50,125);

while (placementOne2<300){
  noStroke();
  fill(0,56,124);
arc(placementOne2,lineOne2,ellipseSize2,ellipseSize2,0,PI);

fill(255);
arc(placementOne2,lineOne2,ellipseSize2-5,ellipseSize2-5,0,PI);

fill(0,56,124);
stroke(255,234,0);
strokeWeight(3);
arc(placementOne2,lineOne2,ellipseSize2-15,ellipseSize2-15,0,PI);

placementOne2 = placementOne2+ellipseSize2;
}

lineOne2 = lineOne2+125;}


}

