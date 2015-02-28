
/*
 A creature bouncing off the edges of the screen.
Also get the eye colors to change depedning on screen 
position  by Stani
*/
 
float x=200;
float y=200;
float w=120;
float h=100;
float speedX=3;
float speedY=1;
//float gravity=0.1;
 
void setup() {
  size(300,400);
}
 
void draw(){
  background(0);
  noStroke();
   
  x=x+speedX;
  y=y+speedY;
   
  //speedX=speedX+1;
  //speedY=speedY+1;
 
  if((x>width) || (x<0)){
  speedX=speedX*-1;
  } 
   
  if((y>height) || (y<0)){
  speedY=speedY*-1;
  }
   
  //neck
  rectMode(CENTER);
  fill(174,56,0);
  rect(x,y+65,20,40);
   
  //draw head
  fill(174,255,0);
  ellipseMode(CENTER);
  ellipse(x,y,w,h);
   
  //eyes
  pushMatrix();
    //rotate(frameRate);
    translate(-30,-10);
    //rotate(frameRate);
    fill(constrain(x,0,255));
    ellipse(x,y,20,20);
    fill(0);
    ellipse(x,y,8,8);
    translate(60,0);
    fill(constrain(y,0,255));
    ellipse(x,y,20,20);
    fill(0);
    ellipse(x,y,8,8);
  popMatrix();
   
  stroke(0);
  strokeWeight(2);
  fill(255,0.0);
  arc(x+1,y+10,60,60,0,PI);
   
  //draw body
  noStroke();
  fill(constrain(x,0,205));
  rect(x,y+95,60,70);
   
  //legs
  stroke(174,56,0);
  strokeWeight(5);
  line(x-20,y+130,x-20,y+180);
  line(x+20,y+130,x+20,y+180);
   
  //hands
  line(x-30,y+90,x-60,y+120);
  line(x+30,y+90,x+60,y+120);
     
}

