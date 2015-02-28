

float x;
float y;
float speed = 0.5;
int centX = 400;
int centY = 345;


void setup() {
size(800, 720);

strokeWeight(0.5);
stroke( random(200), random(30), random(30),80);
smooth();

}

void draw() {
  background(255);
  frameRate(60);
  for(int i =0;i<100; i++){
    float lastx = -999;
float lasty = -999;
float radiusNoise=random(10);
float radius=10;

int startangle=int(random(360));
int endangle = 1440+ int(random(1440));
     int anglestep = 1+int(random(3));

for (float ang= startangle; ang<=endangle; ang+=anglestep){
  radiusNoise+=0.05;
  radius += 0.1;
    
  float thisRadius=radius+(noise(radiusNoise)*200)-100;
  float rad=radians(ang);
  x=centX+(thisRadius*cos(rad)) ;
  y=centY+(thisRadius*sin(rad));
  if(lastx>-999){
    
    line (x, y, lastx, lasty);
   
  }
    
 lastx=x;
  lasty=y;
}
}
}

