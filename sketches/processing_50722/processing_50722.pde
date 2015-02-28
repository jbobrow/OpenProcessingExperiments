
/* 
Nina Rivera
nrivera@mcad.edu
Week 1 ass - clock
run it, baby.
*/

void setup(){
  size(601,601);
  smooth();
  noStroke();
  background(25);
}

void draw(){
  int s = second(); // values from 0-59
  int m = minute(); // values from 0-59
  int h = hour();   // values from 0-23
  
  int d = day();
  int M = month();

  fill(0,0,0,18);
  rect(0,0,width,height);
  
  fill(119,9);
  
  float r = random(600);
  
  stroke(255,25);
  float myTan = tan(frameCount/142.962735046) * 600 + s;
  quad(s*10, s*10, 0, 300, r*myTan, r, 600, 300);
  
  stroke(255,30);
  float myTan2 = tan(frameCount/52.876340) * 700 +s;
  quad(600-(s*10),s*10, 300, 600, r, r*myTan2, 300, 0); 
  
  while(m*10<600) {
    line(30, m*10, 80, m*10);
    m = m + 5;
   }
   
  while(h*5<230){
    line(h*5, 30, h*5, 80);
    h = h + 2;
  }
  
  ellipse(110,50,d,d);
  ellipse(50,110,M,M);
}
  



