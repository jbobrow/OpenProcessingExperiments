
PImage lineImage;
PImage lineImage2;


void setup() {
  size(1200, 700);
  smooth();
  frameRate(30);
  lineImage=loadImage("cookie.png");
  lineImage2=loadImage("cookiemonster.png");
  noCursor();
}


void draw() {

  float x= mouseX;
  float y=mouseY;
  float ix=width-mouseX;
  float iy=height-mouseY;
  float angle=map(mouseX, 0, width, 100, PI/2);

  if (keyPressed) {
    if (key== 'b') {
      translate(550, 550);
      rotate(angle);
      fill(random(255), random(150), 90);
      ellipse(x, height/2, y, y);
      fill(0, 150, 60);
      ellipse(ix, height/2, iy, iy);
      cursor();
    }
  }
  if (keyPressed) {
    if (key== 'c') {
      if (mouseX>=550) {
        fill(200, 20, 20);
        rect(mouseX, mouseY, 25, 25);
      } 
      else {
        strokeWeight(5);
        stroke(100, 200, 200);
        fill(200, 100, 100);
        line(mouseX+2, mouseY+2, pmouseX+2, pmouseY+2);
        cursor();
      }
    }
  }
  if (keyPressed) {
    if (key== 'v') {
      int iz= mouseX - lineImage2.width/2;
      int in= mouseY - lineImage2.height/2;
      image (lineImage2, iz, in);
      
      int ix2=mouseX - lineImage.width/20;
      int iy2=mouseY - lineImage.height/20;
      image (lineImage, random(ix2), random(iy2));

    }
  }
  if (keyPressed) {
    if (key == ' '){
      background(180);
    }
  }
}


