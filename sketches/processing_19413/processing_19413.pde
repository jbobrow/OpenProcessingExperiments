
PFont font;
  
void setup(){
  size(250,250);
  background(255);
  font = loadFont("BodoniStd-Book-72.vlw");
  smooth();
  noStroke();
  frameRate(50);
}
  
   
void draw(){
  if(!mousePressed) {
    fill(60,20);
    textFont(font, 50);
    text("L5C",mouseX,mouseY);
    text("L5C",mouseY,mouseX);
  } 
  if (mousePressed) {
    fill(143,167,123,30);
    textFont(font, 50);
    text("1W5",mouseX,mouseY);
    fill(123,147,167,30);
    text("1W5",mouseY,mouseX);
  }
  if (keyPressed) {
    fill(255,40);
    rect(0,0,250,250);
  }
}


