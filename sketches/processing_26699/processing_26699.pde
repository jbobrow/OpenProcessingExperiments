
//creature
float r;
float g;
float b;
float diam;
float x;
float y;
float move;
float shake;

void setup() {
  size(500,500);
  frameRate(30);
  background(255);
   x = width/2;
  y = height/2;
  diam = 120;
  move = height/2 - 300;
 

}
void draw() {
  ellipseMode(CENTER);
  rectMode(CENTER);
  frameRate(10) ;
  smooth();
  //head
 
    ellipse(x,move,diam,diam);
 
 //eyes
  r = random(255);
  g = random (155);
  b = random (200);
 
  fill(r,g,b);
  fill(255);
  //eyeball 
  ellipse(x+20,move,30,30);
  fill(0);
  //dot
  ellipse(x+20,move,10,10);
  fill(255);
  //eyeball
  ellipse(x-20,move,30,30);
  //dot
  fill(0);
  ellipse(x-20,move,10,10);
  //mouth
 fill(255,r,g);
  rect(x,move+30,50,20);
 
  //moves
  move = move + 10; 


}

