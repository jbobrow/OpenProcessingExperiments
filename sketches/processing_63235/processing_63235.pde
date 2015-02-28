
int x = 50;
int y = 50;
int w = 100;
int h = 75;

int r = 198;
int g = 55;
int b = 221;

void setup () {
 size(500, 500);
 colorMode(RGB, 500, 500, 500, 50);
 smooth();
}

void draw() {
 r = (int) random(0, 255);
 background (r, g, b);
 stroke (255);
 if (mouseX>=x && mouseX<= x+w && mouseY>=y && mouseY<= y+h) {
   fill(242,3,255);

 }

 else {
   noFill();
 }

 strokeWeight (10);
 rect(x, y, w, h);
}

