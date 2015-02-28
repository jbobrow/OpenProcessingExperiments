
void setup() {
  size(700, 500);
  smooth();
  
}

void draw() {
  frameRate(15);
  background(27, 45,77);
  fill(126,18,56);
  line(50,0,120,500);
  strokeWeight(7);
  
  line(100,0,170,500);
  strokeWeight(2);
  
  line(150,0,220,500);
  strokeWeight(1);
  
  line(200,0,270,500);
  strokeWeight(1);
  
  rect(mouseX, mouseY, 175, 175);
  fill(32,106,139);
  
  rect(175, mouseY, 95, 95);
  fill(214,192,207);
  
  rect(mouseX, 95, 55, 55);
  fill(84,100,73);
  rotate(-PI/16);
  
  rect(450, 100, mouseX, mouseY);
    fill(64,80,56);
    rect(450, 100, mouseX +300, mouseY +300);

  fill(203,173,200);
  rotate(-PI/15);
  
  textSize(55);
  PFont font;
  font = loadFont("BLKITCAD.vlw");
  textFont(font);  
  fill (0);  
  text("Zero Gravity", width-mouseX, height-mouseY);
}

