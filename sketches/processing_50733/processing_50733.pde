
 //HW#4-User-Spinning Melons.
//Joshua Chang
//jmc1 Copyright 2012
//Move mouse around
//Press any key to flash color screen
//Click to change the greenness of the melons.

boolean test = false;
float x,y,a, value=random(255);
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
  fill (value, 255,value,40);
  stroke(255,255,255);
  ellipse(mouseX,mouseY,random(100),random(100)); 
  ellipse(mouseX/2,mouseY,random(100),100);
  ellipse(mouseX/2,mouseY/2,100,random(100));
  ellipse(mouseX,mouseY/2,random(100),100);
  
  ellipse(mouseX,mouseY,100,100);
  ellipse(width-mouseX,height-mouseY,random(100),100);
  ellipse(mouseX,height-mouseY,100,random(100));
  ellipse(width-mouseX,mouseY,100,random(100));
 
noFill();
 
  test = true;
}

 void keyPressed()
 {fill(0);
  if (key==key)
 {background(random(255),random(255),random(255));} 
 }
 
 void mouseClicked()
 {
   
  if (value == random(255))
  {value = 0;}
  else
  {value=random(255);
    //saveFrame ("hw4-mellons.jpg");
 }
 }

 //ellipse(mouseX,mouseY,x,y);
  //fill(0,77,77);
  //ellipseMode(CENTER);


