
float x;
float y;
int centX = 400;
int centY = 345;
int time1 = 10000;
int time2 = 4000;
int time3 = 20000;
int time4 = 30000;
int time5 = 40000;
int time6 = 50000;




void setup() {
size(800, 720);

strokeWeight(0.5);
stroke( random(255), random(10), random(10),50);
smooth();

}

void draw() {
  background(150);
  
  frameRate(24);
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
 
  
  int currentTime = millis();
  
  if (currentTime >time2) {
      radius +=0.03 ; }

  if (currentTime >time1) {
     radius += 0.02;
  } 
  if (currentTime> time3) {
    radius += 0.01; }
     if(currentTime > time4) {
       radius += 0.1; }
   if (currentTime >time5) {
     radius += 0.2; }
     
     if (currentTime >time6) {
       radius +=0.3; }
      
      
      
    
  
    
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

