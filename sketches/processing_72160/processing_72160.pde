
//Multiple Aliens

int x=100;
int y=100;
int w=45;
int h=60;

int xspeed=1;

void setup(){
  size(500,200);
  smooth();
}

void draw(){


  background(255); //White background
  
  //Set ellipse and rect to center mode
  rectMode(CENTER);
  ellipseMode(CENTER);
  
  //Multiple versions of Alien
  for (int x=50; x<width; x+=100){
  strokeWeight(1);
  stroke(0);        //Black Outline
  
  
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
}

