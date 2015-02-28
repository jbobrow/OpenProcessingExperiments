
float x;
float y;
int centX = 300;
int centY = 300;


void setup() {
size(600, 600);

strokeWeight(1);
stroke( random(200), random(30), random(30),30);
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
  radiusNoise+=0.1;
  radius+=0.03;

 // if( startangle <=50){
   // radius+= 0.5; 
  //} 


  
  
  
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

