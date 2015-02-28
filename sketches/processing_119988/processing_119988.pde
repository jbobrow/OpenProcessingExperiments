
void setup()
{
size(500,500); 
smooth();
}


void draw()
{
frameRate(1);
background(200);

 translate(width/2,height/2);
 strokeWeight(10);
 stroke(2);
 ellipse(0, 0, 390, 390);
 fill(240);
 strokeWeight(10);
 stroke(60);
 ellipse(0, 0, 380, 380); 
   
 
float sec = map(second(),0,60,0,360);
float min = map(minute(),0,60,0,360);
float std = map(hour(),0,12,0,360);
 
 
 
strokeWeight(5);
stroke(60);
for (int i=0; i<360; i+=30) {
pushMatrix();
rotate(radians(i));
translate(0, 183);
ellipse(0, 0, 5, 5);
popMatrix();
}
 
  
pushMatrix();
strokeWeight(7);
rotate(radians(std));
translate(0, -130);
rect(0, 0,1, 130);
rectMode(LEFT);
popMatrix();
 
  
pushMatrix();
strokeWeight(4);
rotate(radians(min));
translate(0, -150);
rect(0, 0,1, 150);
rectMode(LEFT);
popMatrix();


pushMatrix();
strokeWeight(2);
rotate(radians(sec));
translate(0, -170);
rect(0, 0,1, 170);
rectMode(LEFT);
stroke(240);
ellipse(0, -12, 10, 10);
popMatrix();
 
 stroke (0);
 strokeWeight(10);
 ellipse(0,0,10,10);
 
}
