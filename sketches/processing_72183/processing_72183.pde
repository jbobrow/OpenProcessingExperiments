

float w = 600;
float h = 600;
float x = 50;
float y = 100;
float xvel;
float yvel;
float dvector;

float xpos = 0;
float xneg = w;

float ypos = height;
float yneg = h;

int r = 5;
int rate = r;


void setup () {

  size (600, 600);
  background (255);
  smooth ();
}


void draw () {
 
  wrapping ();
  
}

void wrapping () {
  xpos = (xpos +rate) % width;
  xneg = (xneg -rate);
  if (xneg == 0) {
    xneg = width;
  }


  ypos = (ypos +rate) % height;
  yneg = (yneg -rate);
  if (yneg == 0) {
    yneg = height;
  }

  strokeWeight(1);
  line (mouseX, mouseY, xpos, 0);
  line (mouseX, mouseY, width, ypos);
  line (mouseX, mouseY, xneg, height);
  line (mouseX, mouseY, 0, yneg);

  fill (255);
  ellipse (xpos, 0, r, r);
  ellipse (width, ypos, r, r);
  ellipse (xneg, height, r, r);
  ellipse (0, yneg, r, r);
}

void keyPressed () {
  if (key == ' ') {
    setup ();
  }
}




