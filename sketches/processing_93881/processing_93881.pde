
float r;
float g;
float b;
float a;

//float w;
//float h;

void setup() {
  size(500,500);
  background(0);
  smooth();
}

//random ellipses will be created whenever the mouse is pressed and dragged around
void draw() {
  if(mousePressed == true) {
    //stop creating new ellipses if mouse is idle
    if(mouseX != pmouseX || mouseY != pmouseY) {
      // Fill all variables with random values
      r = random(255);
      g = random(255);
      b = random(255);
      a = random(255);
      //w = random(20);
      //h = random(20);
  
      // Use values to draw an ellipse
      noStroke();
      fill(r,g,b,a);
      ellipseMode(CENTER);
      //faster mouse movement create bigger ellipse, especially in diagonal direction
      ellipse(mouseX,mouseY,abs(pmouseX-mouseX),abs(pmouseY-mouseY));
    }
  }
}


