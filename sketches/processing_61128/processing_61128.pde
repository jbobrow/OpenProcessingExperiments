
void setup() {
  size(900, 450);
  PFont font;
  font = createFont("MSゴシック", 50);
  textFont(font);
  textSize(25);
  stroke(0);
  line(450,0,450,450);
  fill(0,0,0);
  ellipse(150,150,50,50);
  ellipse(300,150,50,50);
  
  frameRate(20);
}

void draw() {
  background(255);
  fill(0);
  text("a",720,225);
  text("i",800,30);
  text("u",530,60);
  text("e",750,100);
  text("o",550,200);
  text("n",600,20);
  fill(0,0,0);
  ellipse(150,150,50,50);
  ellipse(300,150,50,50);
  fill(255,0,0);
  ellipse(width/4,height*2/3,mouseX-500, mouseY);
  fill(0,0,0);
  ellipse(150,150,50,50);
  ellipse(300,150,50,50);
  stroke(0);
  line(450,0,450,450);
}

