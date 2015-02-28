
float moogX;
float moogY;

void setup(){
  size(200,200);
  smooth();
  frameRate(30);
  moogX = width/2;
  moogY = height+100;
}

void draw(){
  background(255,239,213);
  ellipseMode(CENTER);
  rectMode(CENTER);
  

//Limbs
stroke(0,0,0,200);
strokeWeight(5);
//Neck
line(moogX,moogY-35,moogX,moogY-40);
//L.Arm
line(moogX-15,moogY-10,moogX-30,moogY-20);
//R.Arm
line(moogX+15,moogY-10,moogX+30,moogY-20);
//L.Leg
line(moogX-15,moogY+35,moogX-20,moogY+50);
//R.Leg
line(moogX+15,moogY+35,moogX+20,moogY+50);

//Body Parts
fill(255,165,0);
stroke(0);
strokeWeight(2);
//Body
rect(moogX,moogY,30,70);
//L.Hand
ellipse(moogX-30,moogY-20,10,10);
//R.Hand
ellipse(moogX+30,moogY-20,10,10);
//L.Foot
rect(moogX-25,moogY+50,12,10);
//R.Foot
rect(moogX+25,moogY+50,12,10);
//Head
triangle(moogX-20,moogY-73,moogX+20,moogY-73,moogX,moogY-40);
stroke(0,0,0,150);
fill(random(255), moogX,moogY);
ellipse(moogX-7.5,moogY-64,5,5);
ellipse(moogX+7.5,moogY-64,5,5);
fill(255,0,0,150);
ellipse(moogX,moogY-55,10,5);

//rising&shaking moog on leave screen

moogY = moogY - 1;
moogX = random((width/2)-7,(width/2)+7);

if ((moogY < -100)){
  moogY = height+100;  
}

}

