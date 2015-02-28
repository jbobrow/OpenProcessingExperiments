
float x;
float y;
int centX = 300;
int centY = 300;
int time1 = 6000;
int time2 = 4000;
int time3 = 9000;
int time4 = 12000;
int time5 = 15000;
int time6 = 18000;
int time7 = 25000;



void setup() {
size(600, 600);
 background(100);

strokeWeight(0.5);
stroke(219, 11, 11,50);
smooth();


}

void draw() {

  if (mousePressed) { 
    loop();
    
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
 
  
  int currentTime = millis();
  
  if (currentTime >time2) {
      radius +=0.03 ; }

  if (currentTime >time1) {
     radius += 0.02;
  } 
  if (currentTime> time3) {
  radius += 0.01; }
     if(currentTime > time4) {
        radius += 0.01; }
   if (currentTime >time5) {
     
     radius += 0.2; }
     
     if (currentTime >time6) {
       radius +=0.3; 
              
     }
      
      if (currentTime >time7) {
         radius += 0.03;}
      
    
  
    
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
}}
}


void mouseReleased () {
  if (centX == 300) {
    background (100);
    int currentTime = 0;
 }
  
    
  
   
} 

