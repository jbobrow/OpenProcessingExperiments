
PImage img; 
PImage duck;
void setup () {
  img = loadImage("unnamed.jpg");
  duck = loadImage("duck-hunt.png");
  size (1000, 500);
  image(img, 0, 0, 1000, 500);
}


int cartouches = 400;
int x = 1000;
int y = int(random(150, 350));
int dx =int(random(5));
int dy = int(random(-2, 2));

int score = 0;
int vie = 3;




void draw () {

  background (img);
  fill (255, 0, 0);
  text ("Score = " +score, 450, 20);
  text ("Life(ves) = " + vie, 555, 20);

  for (int i=0; i< cartouches; i += 5) {
    //text ("c", i, 500);
    fill (255, 255, 0);
    rect (i, 496, 3, 3);
  }


  if (mousePressed) {
    cartouches -= 1;
  }
  noFill ();
  ellipse (mouseX, mouseY, 30, 30);
  line (mouseX + 15 *sqrt(2)/2, mouseY - 15 *sqrt(2)/2, mouseX+ sqrt(2)/2, mouseY-sqrt(2)/2);
  line (mouseX - 15 *sqrt(2)/2, mouseY - 15 *sqrt(2)/2, mouseX- sqrt(2)/2, mouseY-sqrt(2)/2);
  line (mouseX - 15 *sqrt(2)/2, mouseY + 15 *sqrt(2)/2, mouseX- sqrt(2)/2, mouseY+sqrt(2)/2);
  line (mouseX + 15 *sqrt(2)/2, mouseY + 15 *sqrt(2)/2, mouseX+ sqrt(2)/2, mouseY+sqrt(2)/2);

  if (dist (x, y, mouseX, mouseY) < 30 && mousePressed) {
    x = 1000;
    y = int(random(150, 350));
    dx =int(random(3, 7));
    dy =int(random(-2, 2));
    background(255, 0, 0);
    score += 1;
    cartouches += 5;
  } else if (x<0 || y < 0 || y > 500) {
    x = 1000;
    y = int(random(150, 350));
    dx = int(random(5, 10));
    dy = int(random(0, 2));
    vie -= 1;
    if (vie == 0) {
      exit ();
    }
  } else {

    image(duck, x, y);
    x -= dx;
    y -= dy;
  }
  if (cartouches == 0) {
    exit ();
  }

}



