
//HW#3-User
//Joshua Chang
//jmc1 Copyright 2012

boolean test = false;
float x, y;
void setup()
{
 
  size(400,400);
  smooth();
  background(0);
x=width/2;
y=height/2;
rectMode(CENTER);
}

void draw()
{
  if (test == true) {
   fill(0,20);
  } else {
   fill( 0 );
  }
  rect(0,0,width*2,height*2);
  fill(random(200),random(200),random(200), 40);
  stroke(255,255,255);
  ellipse(mouseX,mouseY,50,50); 
  ellipse(mouseX/2,mouseY,100,100);
  ellipse(mouseX/2,mouseY/2,100,100);
  ellipse(mouseX,mouseY/2,100,100);
  ellipse(width-mouseX,height-mouseY,100,100);

noFill();
 
  test = true;
  
 


 // ellipse(mouseX,mouseY,x,y);
  //fill(0,77,77);
  //ellipseMode(CENTER);

}


