
boolean mouseP = false;
int R;



void setup() {
  smooth();
  size(600, 600);
  background(255);
}

void draw() {
  noStroke();
  if (mouseP == false) {

    fill(0, map(mouseY, 0, 600, 50, 146), map(mouseX, 0, 600, 100, 255));
    rect(0, 0, 200, 200);

    fill(0, map(mouseX, 0, 600, 100, 200), map(mouseY, 0, 600, 0, 100));
    rect(0, 200, 200, 200);

    fill(map(mouseY, 0, 600, 255, 100), map(mouseX, 0, 600, 100, 255), 0);
    rect(0, 400, 200, 200);

    //-----------------------------------------------------------------//

    fill(0, 0, map(mouseX, 0, 600, 50, 255));
    rect(200, 0, 200, 200);

    fill(200, map(mouseX, 0, 600, 100, 255), 200);
    rect(200, 200, 200, 200);

    fill(255, map(mouseY, 0, 600, 50, 200), 0);
    rect(200, 400, 200, 200);

    //-----------------------------------------------------------------//

    fill(map(mouseX, 0, 600, 70, 255), 0, map(mouseY, 0, 600, 50, 149));
    rect(400, 0, 200, 200);

    fill(map(mouseX, 0, 600, 80, 255), 0, map(mouseY, 0, 600, 50, 15));
    rect(400, 200, 200, 200);

    fill(map(mouseX, 0, 600, 120, 255), map(mouseX, 0, 600, 50, 115), 0);
    rect(400, 400, 200, 200);
  }

  if (mouseP == true) {
    fill(map(mouseX, 0, 600, 100, R));
    triangle(0, 0, 0, 200, 200, 0);

    fill(map(mouseY, 0, 600, 0, R));
    triangle(0, 400, 200, 400, 200, 200);

    fill(map(mouseX, 0, 600, 0, R-100));
    triangle(0, 400, 0, 600, 200, 400);


    //-----------------------------------------------------------------//

    fill(map(mouseY, 0, 600, 50, R-100));
    triangle(200, 200, 400, 200, 400, 0);

    fill(map(mouseX, 0, 600, 70, R));
    triangle(200, 200, 200, 400, 400, 200);

    fill(map(mouseY, 0, 600, 0, R-50));
    triangle(200, 600, 400, 600, 400, 400);

    //-----------------------------------------------------------------//

    fill(map(mouseX, 0, 600, 0, R-100));
    triangle(400, 0, 400, 200, 600, 0);

    fill(map(mouseY, 0, 600, 50, R));
    triangle(400, 400, 600, 400, 600, 200);

    fill(map(mouseX, 0, 600, 50, R-50));
    triangle(400, 400, 400, 600, 600, 400);
  }
}

void mousePressed() {
  R = int(random(255));
  mouseP = true;
}

void mouseReleased() {
  mouseP = false;
}

