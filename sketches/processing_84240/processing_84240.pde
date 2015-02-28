
PImage bild;
int xPos;
float jitter;
float a;


void setup() {
  size(600, 600);
  background(255);
  bild = loadImage("baer.jpg");
  constrain(mouseX, 100, 100);
}

void draw() {
  fill(255, 15);
  rect(0, 0, width, height);

  image(bild, abs(pmouseX - mouseX), 0);

  imageMode(CENTER);
  xPos = constrain(mouseX, 100, width - 300);
  image(bild, 150, 450, xPos, xPos);

  if (mousePressed) {  
    jitter = random(-10, 10);
  }
  imageMode(CORNER);
  image(bild, 300, jitter); 

  if (mousePressed) {  
    a = 600;
  } else{
    a = 300;
  }
  image(bild, a, a);

}



