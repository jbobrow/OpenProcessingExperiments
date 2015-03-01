
PFont myFont;

void setup(){
  size(400, 400);
  background(255, 255, 255);
  fill(0, 0, 0);
  smooth();
  noStroke();
  frameRate(50);
  myFont = createFont("MS Gothic", 24, true);
  textFont(myFont);
}

void draw(){
  if(mousePressed == true){
    fill(255,0,0);
    text("留年",mouseX,mouseY);
 }
}
