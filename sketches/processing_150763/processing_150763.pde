
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
boolean button = false;

int x = 50;
int y = 50;
int w = 100;
int h = 75;

void setup() {
  size(200,200); 
}

void draw() {
  if (button) {
    background(255);
    stroke(0);
  } else {
    background(0);
    stroke(255);
  }
  
  fill(175);
  rect(x,y,w,h);
}

// When the mouse is pressed, the state of the button is toggled.   
// Try moving this code to draw() like in the rollover example.  What goes wrong?
void mousePressed() {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    button = !button;
  }  
}
