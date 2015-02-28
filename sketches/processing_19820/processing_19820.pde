
PFont font;

void setup() {
  size(250,250);
  background(250,216,255);
  smooth();
  strokeWeight(1);
  font=loadFont("AlbemarleSwash-48.vlw");
}

int x = 0;
int y = 0;

void draw() {
  rect(0,0,width,height);
  text("L6C",20,20);
  textSize(120);
  strokeWeight(5);
  for(int x1=25; x1<250; x1+=30) {
    for(int y1=25; y1<250; y1+=30) {
      //text
      fill(x1,mouseX,mouseY,20);
      text("L",0,70);
      text("6",0,150);
      text("C",0,230);
      text("2G2",30,250);

      stroke(255,10);
      //circles in background

      ellipse(x1,y1,80,80);
    }
  }
}


