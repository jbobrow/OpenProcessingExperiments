
int counter;

void setup() {  //setup function that is called once
  size(600,600);//sets the size of the canvas
  background(255);  //set background white
  colorMode(RGB);   //set colors to Red, blue and green
}

void draw() {  //Allows to draw
  counter++;
  noStroke();
  fill(random(255),100,255,50);
