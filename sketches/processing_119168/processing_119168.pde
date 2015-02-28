

int counter=0;

void setup(){
  size(800,500);
  //noLoop();
  background(255);
  frameRate(2);
}

void draw(){
//background(255);
if(counter>99){
  clearBackground();
  counter=0;
}
drawspiral(random(width),random(height));
counter++;
}


void drawspiral(float centX,float centY){
strokeWeight(3);
float radius;
//int centX; 
//int centY;
stroke(random(225),random(225),random(100));
radius=10;
float x,y;
float lastx=-999;  // new
float lasty=-999;  //new
float radiusNoise=random(10);
for (float ang=0; ang<=360*4; ang+=5){
  radiusNoise +=0.05; 
  radius += 0.5;
  float thisRadius=radius+(noise(radiusNoise)*200)-100;
  float rad = radians(ang);
   x = centX + (thisRadius * cos(rad));
   y = centY + (thisRadius * sin(rad));
   if(lastx>-999){
     line(x,y,lastx,lasty);
   }
   lastx=x;
   lasty=y;
}
}

void clearBackground() {
  background(255);
}



