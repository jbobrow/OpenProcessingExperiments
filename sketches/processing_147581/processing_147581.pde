
 void setup()
{
  size (1000,1000);
  smooth();
}

void draw()
{
background(250,0,0);
  pushMatrix();  
 fill(0,255,0);
 ellipse(mouseX, 400,400,400);
 fill(0,0,250);
 ellipse(mouseX+30,300,60,60);
 triangle(mouseX-10,+400,mouseX+ 190,+350,mouseX+190,+450);
 fill(#000000);
 //arc(500,500,400,400,3.14,-3.14);
 fill ( 0,0,255);
 noStroke();
 ellipse (mouseX +193, +400,15,100);
 popMatrix();
}
