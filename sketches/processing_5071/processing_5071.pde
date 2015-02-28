
/*

Radiance
October, 2009
veronyu@hotmail.com

*/

void setup() {
  size(1000, 1000);
  background(45);
  smooth();

};

void draw() {
  if (mousePressed) {
  
  for(int i = 0; i < 700; i++){
  stroke(10);
 stroke(random(0,200),random(100,40),0, random(50,200));
  line(mouseX, mouseY, mouseX + random(-1000,1000), mouseY - random(500,100));
  }; 
   };
};

