
//for loop grid cited from week 2 lecture notes p.27
int dx = 17, dy = 17;// distance between dots
int x, y;
//RGB variables
float r = 100;
float g = 200;
float b = 0;

void setup() {
  size(600, 600);
  //background (0);
}

void draw() {
  background(0);
  noStroke();

  // dot grid
  for (y = 5; y <= height-5; y = y + dy) {
    for (x = 5; x <= width-5; x = x + dx) {
      float d = dist(mouseX, mouseY, x, y);//calculate distance between individual dots and mouse position
      //highlight dots within a distance from mouse position
      if ( d <= 155 ) {
        fill(r, g, b, (255 - d*1.65));
        noStroke();
        ellipse(x, y + 0.2*d, 10, 10);// position shifted slightly
      }
      else {//hollow blue squares for non-highlighted area
        fill(256);
        stroke(0, 0, 255);
        strokeWeight(2);
        rect(x, y, 10, 10);
      }
    }
  }
  loop();
}


void keyPressed() {
  if (key == '+' || key == 'z' || key == 'Z') {//increase dot separation when + or Z key is pressed
    r = 255;
    g = 255;
    b = 0;//yellow when keyPressed
    dx += 1;
    dy += 1;
  }

  if (key == '-' || key == 'x' || key == 'X') {//decrease dot separation when - or X key is presssed
    r = 255;
    g = 255;
    b = 0;//yellow when keyPressed
    dx -= 1;
    dy -= 1;
  }
}

//random color change when keyReleased
void keyReleased() {
  g = random(100, 255);
  b = random(50);
  r = random(100, 255);
}



