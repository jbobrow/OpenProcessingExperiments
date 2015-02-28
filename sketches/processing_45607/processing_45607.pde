
float x,y,angle;
void setup(){
  size(500,500);
  x=0;
  y=0;
  angle=0;
  background(150,150,220);
  smooth();
}

void draw(){
  x=cos(radians(angle)) * angle/25 + width/2;
  y=sin(radians(angle)) * angle/25 + height/2;
  fill(random(255), random (255), random(255));
  ellipse(x,y,15,15);
  angle++;
 
 fill(random (255), random (255), random (255));
ellipse(width/2,height/2, 150,150);

fill(255,255,255);
textSize(15);
text("EAT SHIT AND DIE", 185,250);

}



