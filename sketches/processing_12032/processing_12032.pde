
/*
* Aaron Evans
* Loops; Centipede.
* September 12, 2010
*/

float r = random(50, 255);


void setup() {
  
 size(450,120);
 background(0,155,0);

 float x1 =60;
 float y1 = 40;
 float speedX = 3.0;
 float speedY = 4.0;
 float theta = TWO_PI;
 
 //Movements of the centipede
 float cMove = 20;
 
 float x2 = 50;
 float x3 = 60;
 
 float w = 30.0;
 float h = 30.0;
 


stroke(0,0,0,50);

for(int i=0; i <10000; i++){
triangle(random(width), random(height), int(random(3, 12)*.2), 
    random(TWO_PI)*.2, random(20, 100)*.2);
}

fill(220,0,0);
stroke(0,0,0);
smooth();
strokeWeight(2);
for(int i=0;  i < 16; i++){
  ellipse(x1,y1,w,h);
    x1+=20;
    
    if(x1 > x2 ) { 
       y1+=cMove*sin(theta);
       theta+= TWO_PI/6; 
    }}




 







