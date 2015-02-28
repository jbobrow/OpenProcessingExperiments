
//Conditional Alien

float x=100;
float y=100;
float w=45;
float h=60;

float xspeed=3;
float yspeed=1;

void setup(){
  size(200,200);
  smooth();
}

void draw(){
  
  //change the location of Alien by speed
  x=x+xspeed;
  y=y+yspeed;
  
  if ((x>width)||(x<0)){ //if Alien hits the right or left side
  xspeed=xspeed*-1;       //reverse the speed to reverse direction
  }
  if((y>height)||(y<0)){ //If Alien hits top or botton, Reverse
  yspeed=yspeed*-1;      //speed to reverse direction
  }
  
  
  //Draws Alien
  background(255);
  rectMode(CENTER);   //Sets center mode
ellipseMode(CENTER);

stroke(0);        //Black Outline
strokeWeight(1);
fill(150);
rect(x,y,w,h);  //Body

stroke(0);
fill(200);
ellipse(x,y-50,60,70);  //Head

stroke(0);
fill(0);
ellipse(x-15,y-60,20,15);    //Right Eye
ellipse(x+15,y-60,20,15);   //Left Eye

ellipse(x-15,y+27,30,10);  //Right Foot
ellipse(x+15,y+27,30,10);  //Left Foot

strokeWeight(10);
stroke(150);
line(x-27,y-20,x-50,y); //Right Arm
line(x+27,y-20,x+50,y);  //Left Arm
}


