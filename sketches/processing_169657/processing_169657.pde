
// example code http://processingjs.org/learning/basic/clock/  by Casey Reas and Ben Fry

void setup() {

  size(800,800);

  stroke(70);

  smooth();

}

void draw() {

  background(0);

  fill(80);

 




  ellipse(width/2, height/2, 160, 160);
 
   
  

  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;

  float m = map(minute(), 0, 60, 0, TWO_PI) - HALF_PI;

  float h = map(hour() % 12, 0, 12, 0, TWO_PI) - HALF_PI;

  stroke(255);

  strokeWeight(1);
arc(width/2, height/2,cos(s) * 72 + 200, sin(s) * 72 + 100, 0, QUARTER_PI);


  strokeWeight(2);
arc(width/2, height/2, cos(m) * 60 + 150, sin(m) * 60 + 100, 0, HALF_PI);
 
  strokeWeight(4);
arc(width/2, height/2, cos(h) * 50 + 100, sin(h) * 50 + 100, 0, PI);
 
}


  
  
   
 





