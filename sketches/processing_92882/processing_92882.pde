
PImage background;
PImage TheMan;

float x = 150;
float y = 50;
float vx = 0;
float vy = 0;
float speed = 1;


void setup () {
  size(500,500);
  TheMan = loadImage("cagedevil.png");
  background = loadImage("icecastle.png");
}
 
void draw() {
  
  if (mousePressed) {
    line(mouseX, mouseY, 250, 100);
    stroke(252, 3, 3);
    fill(0);
  } else {
    background(background);
    image(TheMan, x + vx, y + vy);
    fill(255);
  }
  
  x += vx;
  y += vy;

}

void keyPressed() {
  if (keyCode == 'D')
  {
    vx = speed;
  }
  if (keyCode == 'A')
  {
    vx = -speed;
  }
  if (keyCode == 'W')
  {
    vy = -speed;
  }
  if (keyCode == 'S')
  {
    vy = speed;
  }
}

void keyReleased() {
  if (keyCode == 'D' || keyCode == 'A')
  {
    vx = 0;
  }
  if (keyCode == 'W' || keyCode == 'S')
  {
    vy = 0;
  }
}


