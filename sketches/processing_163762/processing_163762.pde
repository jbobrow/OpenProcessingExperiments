
//concept: create universe with planets, sun, and blackhole
//interaction: if mousePressed, 2Dplanets change in to 3D planets
//opensources were used on openprocessing.org

class planet {
   
  float x;
  float y;
  float z;
  float diam;
  float P, L, A,N;
  float theta = 0;
  
  planet(){
   x=random(0,600);
    y=random(0,600);
    z=random(0,600);
    diam=random(20); 
    P=random(200);
    L=random(50);
    A=random(150);
    N=random(76,360); 
}

 void display(){
   noStroke();
   fill(P,L,A,N);
   pushMatrix();
   rotate(theta);
   translate(x,y,z);
   sphere(diam);
   
     if (mousePressed) {
    lights(); }
   popMatrix(); }}
 
float cameraM1=0;
 
float fade1=50;
 
planet[]  myplanets = new planet[900];  
 
  
void setup(){
size (700,700,P3D);
for (int i=0; i<myplanets.length; i++){
myplanets[i] = new planet();  }}
 
 void draw(){
noStroke(); 
 
   background(#030831); 

    cameraM1=cameraM1+0.0001;
   
  camera(1000, 1000,1000, 0,0,0, 0, 0, 1);
 
  sun();
  translate(0,0,0);
  
  blackhole();
   
for (int i=0; i<myplanets.length; i++){    
   myplanets[i].display(); 
 rotateY(cameraM1); }}
 
void blackhole(){
int centX = (-200);
  int centY = (-900);
  float x, y;

  for (int i = 0; i < 40; i++) {                                        
    float lastx = -999;
    float lasty = -999;
    float radiusNoise = random(30);
    float radius = 10;
     
    stroke( noise( 255/1 , 255/1 ) * 0, 255 , 255 - noise( 200 /1, 230/1) * 255, 100 );
  
    int startangle = int(random(1140));                                 
    int endangle =  1440 + int(random(360));                          
    int anglechange =  5 + int(random(3));
    for (float ang = startangle; ang <= endangle; ang += anglechange) {
      radiusNoise += 0.05;
      radius += 0.5;
      float thisRadius = radius + (noise(radiusNoise) * 200) - 100;
      float rad = radians(ang);
      x = centX + (thisRadius * cos(rad));
      y = centY + (thisRadius * sin(rad));
      if (lastx > -999) {
        line(x,y,lastx,lasty);
      }
      lastx = x;
      lasty = y;
    }
  }
}

void sun(){
 if (mousePressed) {
    lights(); }
  noStroke();
pushMatrix();
translate(0,300,0);
 
fade1=fade1+20;
if(fade1>=250) {fade1=50;}
 
fill(251,0,0,fade1);
stroke(251,255,31);
sphere(100);
popMatrix();
 
  }

