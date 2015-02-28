
void setup() {
  size(250, 250);
  background(255);
  smooth();
  frameRate(100); //fast frame rate
}

float x=mouseX;

void draw() {
  if(mousePressed) { //when mouse pressed draw in colour
    stroke(color(random(255),random(255),random(255),random(255)));
  } else { //when mouse not pressed draw in white
    stroke(255);
  }
  line(mouseX-22, mouseY, mouseX+22, mouseY); //lines form square cross
  line(mouseX, mouseY-22, mouseX, mouseY+22);
  
  line(mouseX+66,mouseY,mouseX+110,mouseY);
  line(mouseX+88,mouseY-22,mouseX+88,mouseY+22);
  
  if (keyPressed) { //if key pressed, erase all
    background(255);
  }
}


