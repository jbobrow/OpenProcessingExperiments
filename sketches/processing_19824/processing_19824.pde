
PFont font;

float x = 0.0;
float y = 0.0;
float x2 = 20.0;
float y2= 20.0;

void setup() {
  size(250,250);
  noFill();
  background(98,198,142,30);
  font=loadFont("Garamond-Bold-48.vlw");
}
void draw() {
  fill(19,45,95,30);
  rect(0,0,width,height);
  fill(255,120);
  textSize(350);
  translate(0,150);
  text("L",0,100);

  stroke(0,30);
  strokeWeight(12);
  noFill();
  //diagonal lines from left to right
  line(0,0,width,height);
  line(0,-50,width+50,height);    
  line(0,-100,width+100,height);

  rotate(150.0);
  text("L",10,20);
  textSize(20);
  text("2G2",80,100);
  text("2G2",110,100);
  text("2G2",140,100);
  text("2G2",170,100);
  text("2G2",200,100);

  text("2G2",90,140);
  text("2G2",120,140);

  text("2G2",100,60);
  text("2G2",130,60);

  translate(20,30);
  //diagonal lines from right to left
  strokeWeight(20);
  line(150,-200,10,100);
  line(190,-200,50,100);

  rotate(102);
  textSize(100);
  fill(131,240,199);
  text("6C",10,10);
}


