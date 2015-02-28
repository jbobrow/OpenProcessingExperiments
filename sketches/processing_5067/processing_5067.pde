
/*

Constellation Creator
October, 2009
veronyu@hotmail.com

*/

void setup() {
  size(500, 500);
  background(0);
  smooth();

};

void draw() {
  if (mousePressed) {
    
  
  
  for(int i = 0; i < 1000; i++){
  stroke(255);
  line(pmouseX, pmouseY, mouseX, mouseY);
  stroke(random(10),random(9),90, random(9));
  line(mouseX, mouseY, mouseX + random(-1000,80), mouseY - random(-1000,1000));
  }; 
   };
};

