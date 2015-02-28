
float posX=250, posY=250;
float angle=0.0;
float radius = 100;
float raball =80;

void setup(){
  size(500,500);
  background(255);
  
}
void draw(){
 smooth();
  stroke(2,25,255);
  fill(random(255));
  ellipse(sin(radians(angle))*radius+raball, cos(radians(angle))*radius+raball, raball, raball);
  angle+=4;
  if(angle%360==0){
    raball+=20;
    
  }
  
}

