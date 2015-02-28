

int thisTime = millis();
int pressed = 0;

/////////////////////////////////

void setup() {
  size (400, 400);
  background (255);
  smooth();
}

/////////////////////////////////

void draw() {
  stroke (255);
  smooth();

  thisTime = millis()-pressed;
  //println("ThisTime: "+thisTime+" Pressed: "+pressed);
  int dimension =thisTime/100;
  fill(random(dimension),random(dimension),-random(dimension));

  if(mousePressed) 
    ellipse (mouseX,mouseY,dimension+5,dimension+5);
  else ellipse (mouseX,mouseY,20,20);
}
 
/////////////////////////////////
 void mousePressed() {
      pressed=millis();
  }
       
                
