
//Flower experiment
//Xiongfei Zhang
//CCTP764
//used a lot of Garrison's at http://www.openprocessing.org/sketch/57343
//different flower drawing (ellipse instead of bezier)
//added different colors, and leaves
//was attempting to make petals rotate, and colored differently
//had problem using arrays,  especially with the use of 'class'


Flower[] myFlower;
int petalNum=int(random(8,18));
PShape myCloud;
float cloudX,cloudY;
color[] colour;

void setup() {
  smooth();
  myCloud=loadShape("http://upload.wikimedia.org/wikipedia/commons/9/95/Cartoon_cloud.svg");
  size(860, 550);
  cloudX=-150; cloudY=30;
  myFlower = new Flower [12];
  colour = new color [12];
  
  //generate colour[i] and set the range for flowers
  for(int i = 0; i < myFlower.length; i++){
    colour[i] = color(random(139,255), random(0,139), random(0,139));
    myFlower[i] = new Flower (0,0,random(150,200),random(30,50),random(20,40),colour[i]);
  }
  
}

void draw() {
  background(212);
  noStroke();
  fill(#16A9F0);
  rect(0,0,width,height/2);
  fill(#2A671A);
  rect(0,height/2,width,height);
  makeCloud();
  
  for (int i=0;i<myFlower.length;i++) {
    pushMatrix();
    translate(i*65+90, height/1.5-(myFlower[i].stemHeight));
    myFlower[i].drawFlower();
    popMatrix();
  }
  
}

//borrowed from Garrison directly
void makeCloud() {
  fill(#FAFAFE);
  noStroke();
  shape(myCloud,cloudX,cloudY,190,120);
  cloudX=cloudX+0.46;
  if (cloudX>width+15) {
    cloudX=-192;
  }
}

