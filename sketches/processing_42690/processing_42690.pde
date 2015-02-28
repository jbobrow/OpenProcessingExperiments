
float x,y;





void setup() {
  background(255);
  size(600, 600);
  smooth();
}


void draw() {
  fill(209, 209, 209, 20);
    float mil = millis();
    noStroke();
    fill(mil % 500);
    rect(0, 0, 600, 600);
    
  int mi= millis();
  int s = second();  // Values from 0 - 59
  int m = minute();  // Values from 0 - 59
  int h = hour();    // Values from 0 - 23
  
  
  strokeWeight(1);
  stroke(0,174,239);
  line(mi, 0, mi,150);
  strokeWeight(2);
  stroke(236,0,140);
  line(s, 0, s,300);
  strokeWeight(3);
  stroke(255,242,0);
  line(m, 0, m, 450);
  strokeWeight(4);
  stroke(150);
  line(h, 0, h, 550);
  
  
  
  }
 

