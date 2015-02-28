
void setup()
{
  size(500, 500);
}
void draw()
{
 background(255);
   
  float sec = map(second(), 0, 60, 0, 360);
  float min = map(minute(),0,60,0,360);
  float std = map(hour(),0,12,0,360);
   
  translate(width/2, height/2); 
  fill(80);
  noStroke();
for(int is=0;is<360;is+=6)
{
 pushMatrix();
 rotate(radians(is));
 translate(0,-200);
 ellipse(0,0,20,20);
  popMatrix();
}
  
for(int im=0;im<360;im+=6)
{
 pushMatrix();
 rotate(radians(im));
 translate(0,-150);
 ellipse(0,0,30,30);
  popMatrix();  
}

for(int ih=0;ih<360;ih+=30)
{
 pushMatrix();
 rotate(radians(ih));
 translate(0,-200);
 ellipse(0,0,45,45);
  popMatrix();  
}
  
  noStroke();
  
//sekundenzeiger
  pushMatrix();
  rotate(radians(sec)); // um i rotieren
  translate(0, -200); //um radius verschieben
frameRate(1);
fill(50,255,200);
ellipse(0, 0, 15, 15);
  popMatrix();

// minutenzeiger
pushMatrix();
rotate(radians(min));
translate(0,-150);
ellipse(0,0,25,25);
popMatrix();

//Stundenzeiger
pushMatrix();
rotate(radians(std));
translate(0,-200);
ellipse(0,0,40,40);
popMatrix();
resetMatrix();
}
