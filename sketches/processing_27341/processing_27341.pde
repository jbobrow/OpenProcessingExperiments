
float zoogX;
float zoogY;

float eyeR;
float eyeG;
float eyeB;


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
  
//draw zoogs body 
stroke(0);
fill(150);
rect(zoogX,zoogY,20,100);

//draw zoogs head
stroke(0);
fill(255);
ellipse(zoogX,zoogY-30,60,60);

//draw zoogs eyes //eye r, eyeg, eyeb given random values and used in the fill
eyeR = random(255);
eyeG = random(255);
eyeB = random(255);
fill(eyeR,eyeG,eyeB);

ellipse(zoogX-19,zoogY-30,16,32);
ellipse(zoogX+19,zoogY-30,16,32);


//draw zoogs legs
stroke(150);
line(zoogX-10,zoogY+50,zoogX-10,height);//now drawn from mouse location to previous mouse location
line(zoogX+10,zoogY+50,zoogX+10,height);

//zoog moves up
zoogY = zoogY - 1; //incrimenting up by 1, from 100 below the screen

}
void mousePressed() {
  println("take me to your leader!");
}

