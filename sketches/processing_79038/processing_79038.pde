
//Assignment 2 - Dynamic Sketch

float snowX = 300;
float snowY = 300;

boolean button = false; // Button starts of in this state
//The button is located at the bottom half of the sketch window
float x = 0;
float y = 150;
float w = 300;
float h = 300;

void setup() {
  size(300,300); //Set the size of the sketch window
  smooth(); //Draw all edges smooth
}

void draw() {
  background(0,mouseX,mouseY); //The background colour will change depending on the postion of the mouse
  noStroke(); //There is no stroke
  fill(255); //The fill of the next shape is white
  rect(x,y,w,h); //The button will be drawn at the bottom of the sketch window
  if(button) {
    background(0,mouseX,mouseY); //The background will remain the same as before
    rect(x,y,w,h); //The button will remain at the bottom of the sketch window
    ellipse(random(snowX),random(snowY),10,10);
  }
  penguin();
}

void penguin() {
  noStroke();
  ellipseMode(CENTER);
  
  fill(0);
  ellipse(mouseX,mouseY-50,60,60); //Draw the penguins head
  
  ellipse(mouseX,mouseY,70,90); //Draw the penguins body
  
  fill(255);
  ellipse(mouseX-10,mouseY-50,20,20); //Draw left eye
  ellipse(mouseX+10,mouseY-50,20,20); //Darw right eye
  
  ellipse(mouseX,mouseY+2,50,70); //Draw penguins body
  
  fill(0);
  ellipse(mouseX-8,mouseY-50,10,10); //Draw left pupil
  ellipse(mouseX+8,mouseY-50,10,10); //Draw right pupil
  
  fill(230,255,0);
  ellipse(mouseX,mouseY-38,25,18); //Draw the penguins beak
  
  ellipse(mouseX-15,mouseY+45,25,15); //Draw penguins left foot
  ellipse(mouseX+15,mouseY+45,25,15); //Draw penguins right foot
}

void mousePressed() { //When the mouse is pressed the state of the button is changed
  if(mouseX > x && mouseX < x+w && mouseY > Y && mouseY < y+h) {
    button = !button;
  }
}

