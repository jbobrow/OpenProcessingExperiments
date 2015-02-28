
void setup() {

  size(400,400);
  stroke(0);
  background(190,64,0);
  smooth();
   }

void draw() {
  if(mousePressed == true) {
        background(mouseX,mouseY,0);
    } 
  else {
    // line(25, 150, mouseX, mouseY);
      int a; a =mouseX;         
      int b =  mouseY;   
      int c = a + b; 
      for (int i=60; i<540;i=i+60 )
      triangle(i,0 , a-i, b, a, b);
   }
}


