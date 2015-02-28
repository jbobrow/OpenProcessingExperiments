
void setup() {
  size(400, 400);
  background(0);
  //line colour white
  stroke(255);
  //no fill
  noFill();
}

void draw() {

  if (mousePressed) {
    ellipse(mouseX, mouseY, 10, 10);
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
}

//this fucniton is called when we press a key

void keyPressed() {
  //this fucntion stores the char pressed as key
  // we can compare this to things with a double equals
  // and change things about how we are drawing

  //this gorup of if's will change the line thikness
  if (key == '1') {
    strokeWeight(1);
  } 
  if (key == '2') {
    strokeWeight(2);
  } 
  if (key == '3') {
    strokeWeight(3);
  } 
  if (key == '4') {
    strokeWeight(4);
  } 
  if (key == '5') {
    strokeWeight(5);
  } 

  //this will let us select colour
  if (key == 'r') {
    stroke(255, 0, 0);
  } 
  if (key == 'b') {
    stroke(0, 255, 0);
  } 
  if (key == 'g') {
    stroke(0, 0,255);
  } 
  
  //if we get the space key we will refreash the screen
  if (key == ' ') {
    background(0);
  }
}

