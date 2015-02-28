
float offset =10;
float angle = 0.0;
float scalar = 2;
float x;
float y;
float speed = 0.5;
int centX = 250;
int centY = 150;


void setup() {
size(500, 300);
background(255);
strokeWeight(0.5);
stroke( random(70), random(30), random(30),5);
smooth();
}

void draw() {
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
  radius+=0.03;
  float thisRadius=radius+(noise(radiusNoise)*200)-100;
  float rad=radians(ang);
  x=centX+(thisRadius*cos(rad)) ;
  y=centY+(thisRadius*sin(rad));
  if(lastx>-10){
    
    line (x, y, lastx, lasty);
    angle += speed;
    scalar += speed;
  } else {
    line (x,y,x, y);
  }
    
 lastx=x;
  lasty=y;



}
}
}

