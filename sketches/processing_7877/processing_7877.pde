
/*Libby Riefler <er845@bard.edu>
  February 24 2010
  Wrist Watch*/

void setup() 
{ 
  size(300, 300); 
  smooth(); 
} 
 
void draw() 
{ 
  background(mouseX, 0, 250);
  strokeWeight(2); 
 
  fill(11, 15, 11);
  rect(100, 0, 100, 300);//band
  
  fill(162, 162, 162);
  ellipse(150, 150, 210, 210);//watch
  
  strokeWeight(1);
  fill(252, 169, 13);
  rect(255, 145, 10, 10);
  line(255, 147, 265, 147);
  line(255, 149, 265, 149);
  line(255, 151, 265, 151);
  line(255, 153, 265, 153);//time adjust

  ellipse(150, 150, 190, 190);
  for (int i = 0; i < 182; i = i + 2)
  {
    noFill();
    stroke((i% (.1 + second())) + 20, 25, mouseY);
    ellipse(width/2, height/2, i, i);
  }
  
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute(), 0, 60, 0, TWO_PI) - HALF_PI;
  float h = map(hour() % 12, 0, 12, 0, TWO_PI) - HALF_PI;
  stroke(0);
  strokeWeight(2);
  line(150, 150, cos(s) * 86 + 150, sin(s) * 86 + 150);
  line(150, 150, cos(m) * 76 + 150, sin(m) * 76 + 150);
  line(150, 150, cos(h) * 45 + 150, sin(h) * 65 + 150);//clock face 
  
  ellipse(150, 70, 3, 3);
  ellipse(150, 230, 3, 3);
  ellipse(70, 150, 3, 3);
  ellipse(230, 150, 3, 3);//hour markings

} 

