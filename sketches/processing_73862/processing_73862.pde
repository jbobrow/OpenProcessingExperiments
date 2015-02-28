


void setup() {
 size(450,300);
 background(loadImage("montanas.JPG"));
 smooth();
 noFill();
}
 
void draw() {
  stroke(0);
    bezier(0,85,20,80,20,80,45,67);
   bezier(45,67,89,67,89,67,143,46);
  bezier(143,46,181,50,181,56,272,60);
 bezier(270,60,300,65,300,50,330,40);
  bezier(330,40,380,40,380,60,450,90);
  }

