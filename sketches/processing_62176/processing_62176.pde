
PImage img1; 
PImage img2; 
PImage img3; 
PImage img4;

int grenzeX = 200;
int grenzeY = 200;



//MAIN SETUP

void setup() {
  size(400, 400);
  noStroke();
  smooth();
  noCursor();

  img1 = loadImage("browser.png");
  img2 = loadImage("browser_klein.png");
  img3 = loadImage("browser_mittel.png");
  img4 = loadImage("mouse.png");
}



//ZEICHNEN

void draw() {

  frameRate(60);

  background(255);

  float x = random(200);
  float y = random(200);

  float r = random(90);


  image(img1, 0, 0);





  if (mouseX < grenzeX) {
    image(img3, width/2, height/2);
  }
  else {
    image(img3, 50, height/2);
  }


  if (mouseY < grenzeY && mouseX > 200) {
    rotate(PI/r);
    image(img2, width/2, 120);
  }
  else {
    image(img2, width/2, 120);
  }


  image(img4, mouseX, mouseY);
  
    if (mousePressed) {
    frameRate(10);
    background(255);
    image(img1, x, y);
    image(img2, x*2, y*2);
    image(img3, x/2, y/2);
    image(img4, y, x);
  }
}


