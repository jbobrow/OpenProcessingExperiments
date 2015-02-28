
//Red Circles by David Yu
//September 16 2010

int clickX, clickY, releaseX, releaseY;
boolean nowDragging;

void setup() {
  noStroke();
  background(0);
  size(800, 800);
  frameRate(15);
}

void draw() {  
  fill(255,0);
  rect(0,0, width, height);
  fill(255, 0, 0, 90);

  if (nowDragging) {
    ellipse(mouseX,mouseY,30,30);
  }

  if(mousePressed && (mouseButton == RIGHT)) {
    ellipse(mouseX,mouseY,random(0,100),random(0,100));
  }


  if(mousePressed && (mouseButton == LEFT)) {
    ellipse(mouseX,mouseY,mouseX/mouseY+100, mouseX/mouseY+100);
  }


  if(mousePressed && (mouseButton == CENTER)) {
    ellipse(random(mouseX-50,mouseX+50),random(mouseY-50,mouseY+50), 30,30);
  }
}
void mouseMoved() {
  clickX = releaseX = mouseX;
  clickY = releaseY = mouseY;
  nowDragging = true;
}

void mouseDragged() {
  nowDragging = false;
}


