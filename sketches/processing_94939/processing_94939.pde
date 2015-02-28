
int tib=-20;


void setup(){
  size(600, 600);
  background(33, 250, 208);
  frameRate(5);
  strokeWeight(2);
}

void draw(){
 size(600, 600);
 background(33, 250, 208);
 frameRate(5);
 strokeWeight(2);
 
 tib=(tib+10);
 tail(100+tib, 100);
 

 }
 
 
 void tail(int x, int y){
   fill(0, 168, 255);
   triangle(100+x, 100, 120+x, 140, 160+x, 150);
   triangle( 100+x, 200, 120+x, 140, 160+x, 150);
   ellipse(240+x, 150, 180, 60);
   triangle(250+x, 180, 250+x, 180, 230+x, 160);
   line(320+x, 160, 300+x, 150);
   fill(255, 0, 51);
   ellipse(300+x ,135 ,10, 10);
   fill(0, 168, 255);
   triangle(220+x, 100, 275+x, 125, 220+x, 130);
   tib=(tib+1)%400;
 
 }

