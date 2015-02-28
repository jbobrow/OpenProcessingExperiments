
Mickey mickeyM;

void setup() {
  //size of composition
  size(400, 400);
  background(200);
  mickeyM = new Mickey(); //initializing object
}

int value = 200;
int valueY = 200;
int size = 230;

void draw() {
  //randomize the thickness/color of the stroke
  float randStroke = random(10);
  float strokeColor= random(255);
  stroke(strokeColor);
  strokeWeight(randStroke);
  
  //random colors for mickey
  float red = random(255);
  float blue = random(255);
  float green = random(255);
  fill(red, blue, green);
  //framerate to slow down random colors
  frameRate(1.75);

  float name = random(50);
  textSize(name);  
  text("Mickey Mouse", 45, 370);
  
  //calling the custom function
  mickeyM.drawMickey(value, size);
}
void keyPressed() {
  //conditional to make micky move when pressing arrows.
  if (keyCode == RIGHT) {
    value += 1;
  }
  else if(keyCode == LEFT) {
    value -= 1;
  }
  else if(keyCode == UP){
    value -= 1;
  }
  else if(keyCode == DOWN){
    value += 1;
    
  }
}
class Mickey {
  
  Mickey(){ }
   
  
    //custom function to draw mickey
  void drawMickey(int value, int size) {
  ellipse(value - 100, value - 100, size - 120, size - 120);
  ellipse(value + 100, value - 100, size - 120, size - 120);
  ellipse(value, value, size, size);
   }
}


