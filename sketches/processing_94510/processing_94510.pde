
float Partx, Party, Parta;
float x, y;
int a = 0;
void setup() {
  size(800, 600); 
  background(120);

  Partx = 0;
  Party = 0;
  Parta = 0;
}

void draw() {

  if (mousePressed && (mouseButton == LEFT)) {
    smooth(400);
    noStroke();
    fill(random(50, 100));
    strokeWeight(1);
    rectMode(CENTER);
    rect(mouseX, mouseY, mouseX / 3, mouseY / 3);
    a = 1;
  }

  else if (mousePressed && (mouseButton == RIGHT)) {
    background(120);
    a = 0;
  }


  else if (!mousePressed) {
    if (a == 1) {

      translate(Partx, Party);
      rotate(Parta);
      fill(random(180, 255), random(200, 255), random(180, 255));
      strokeWeight(1);
      stroke(random(180, 255), random(200, 255), random(180, 255));
      triangle(0, 0, 10, 10, 10, 0);
      Partx = Partx + random(-1, 1);
      Party = Party + random(-3, 5);
      Parta = Parta + radians(random(-20, 20));
      
      if (Partx < 0 || Partx > width || Party > height) {
        Partx = x;
        Party = y;
      }
    }
  }
}

void mouseReleased() {
  Partx = mouseX;
  Party = mouseY;
  x = Partx;
  y = Party;
}
