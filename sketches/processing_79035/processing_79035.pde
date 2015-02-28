
int x1;
int y1;
int col = 255;
PFont myFont;


void setup(){
  size(700,350);
  background(255);
  myFont = createFont("AbrahamLincoln.ttf",32);
  textFont(myFont);
  text("a");
  smooth();
  ellipseMode(CENTER);

}


void draw(){

}

void mousePressed(){
  if (mouseButton == LEFT) {
    stroke (random(255),50,random(255), 150);
    line (x1, y1, mouseX, mouseY);
    x1= mouseX;
    y1=mouseY;
  } 
}

void mouseReleased(){
  if (mouseButton == LEFT) {
    print('a');

    smooth();
    fill(random(220),0,0,random(200));
    textSize(random(50,135));
    text('a',mouseX-25, mouseY+20);
  }
}



