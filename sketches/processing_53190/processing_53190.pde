
float x,y,angle;
 
void setup(){
  size(600, 600);
 x = 0;
 y = 0;
 angle = 0;
 smooth();
  
}
 
void draw(){ 
   
   
   
   x = cos(radians(angle))*90 + width/2 ;
  y = sin(radians(angle)) *100 + height/2;
  fill(245,15,6);
  ellipse(y,angle,10,10);
  ellipse(x,angle,10,10);
  ellipse(angle,x,10,10);
  ellipse(angle,y,10,10);
  angle++;
  if (angle >= width){
    angle = 0;
  }
   
 
 
  
   {
      
  float glowlight = sin(radians(angle));
  glowlight = map(glowlight,-1,1,85,166);
  fill(glowlight);
  ellipse(mouseX,mouseY,100,100);
  angle++;
}
 
smooth();
noFill();
randomSeed(0);
strokeWeight(10);
stroke(0, 50);
for (int i = 0; i < 50; i += 10) {
  float begin = radians(i);
  float end = begin + HALF_PI;
 
}
 
}


