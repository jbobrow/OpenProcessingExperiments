
int cerchio = millis();
int pressed = 0;

void setup() {
  size (400, 400);
  background (255);
  smooth();
}
 
void draw() {
  stroke (255,150,10);
  smooth();
 
  cerchio = millis()-pressed;
  int dimension =cerchio;
  fill(255);
 
  if(mousePressed)
    ellipse (mouseX,mouseY,dimension+50,dimension+50);

}

 void mousePressed() {
      pressed=millis();
  }
       


