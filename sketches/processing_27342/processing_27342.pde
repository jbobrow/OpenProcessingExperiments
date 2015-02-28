
float zoogX;
float zoogY;

float eyeR;
float eyeG;
float eyeB;
float diam;

void setup(){
  size(200,200);
  smooth();
  frameRate(30);
  zoogX = width/2; //zoog starts in the middle
  zoogY = height + 100; //zoog starts below the screen
  
}

void draw() {
  background(255);
  
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  float diam = random(1,35);
//draw zoogs body 
stroke(0);
fill(150);
rect(zoogX,zoogY,diam,diam);

//draw zoogs head
stroke(0);
fill(255);
ellipse(zoogX,zoogY-30,diam,diam);

//draw zoogs eyes //eye r, eyeg, eyeb given random values and used in the fill
eyeR = random(255);
eyeG = random(255);
eyeB = random(255);
fill(eyeR,eyeG,eyeB);


ellipse(zoogX-19,zoogY-30,diam,diam);
ellipse(zoogX+19,zoogY-30,diam,diam);


//draw zoogs legs
stroke(150);
line(zoogX-10,zoogY+50,zoogX-10,height);//now drawn from mouse location to previous mouse location
line(zoogX+10,zoogY+50,zoogX+10,height);

//zoog moves up
zoogY = zoogY - 1; //incrimenting up by 1, from 100 below the scree

}
void mousePressed() {
  println("take me to your leader!");
}

