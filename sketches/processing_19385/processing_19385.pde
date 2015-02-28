
PFont font;

void setup() {
  size(250, 250);
  background(255);
  font = loadFont("HelveticaNeue-UltraLight-48.vlw"); //font used
  smooth();
  frameRate(100); //fast frame rate
}

float x=mouseX;

void draw() {
  if(mousePressed) { //if mouse pressed draws postal code in colour
    fill(color(random(255),random(255),random(255),random(155)));
  } else { //if mouse not pressed "erases" postal code using postal code
    fill(255);
  }
  textFont(font,10);
  text("L5C",mouseX,mouseY); //L5C are made based on mouse position
  text("L5C",mouseX+20,mouseY+20);
  text("L5C",mouseX-20,mouseY-20);
  text("1W5",width-mouseX,height-mouseY); //1W5 made based on opposite mouse position
  text("1W5",width-mouseX+20,height-mouseY+20);
  text("1W5",width-mouseX-20,height-mouseY-20);
  
  if (keyPressed) { //if key pressed screen clears
    background(255);
  }
}

