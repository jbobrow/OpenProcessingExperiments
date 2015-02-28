
float[] speedX;
float[] speedY;

int quick = 1000;
PImage p;

float go = 30;

void setup() {
  size(1000, 800);
  background(3, 114, 255);
  p = loadImage("mexican.jpeg");
}

void animation(int quick) {
  speedX = new float[quick];
  speedY = new float[quick];

  for (int j=0; j<quick; j++) {
    speedX[j] = random(-10.0, 10.0);
    speedY[j] = random(-10.5, 10.5);
  }
}




void draw(){
  for (int i = 0; i<p.pixels.length; i++) {
  if (i%2==0) {
    p.pixels[i] = color(random(10,100), random(10, 100), random(10, 100));
  }
  
}

p.updatePixels();
image(p, 0, 0, 1000, 400);

p.updatePixels();
image(p, 0, 400, 1000, 400);


}

