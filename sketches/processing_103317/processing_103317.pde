
// SLIDER 

float slider_width = 50;
float slider_height = 10;
float posx, posy;
boolean over = false;
boolean locked = false;
float xoff;
float fundo;

void setup() {
  size(500, 500, P2D);
  posx = width/2;
  posy = height/2;
  rectMode(CENTER);
  line (posx, posy, posx+100, posy);
}

void draw() {
  fundo = posx;
  background(200);
  line (150, posy, 350, posy);
  println (posx);
  if (dist(mouseX, mouseY, posx, posy) < slider_height) {
    fill(200);
    over = true;
  }
  else {
    fill(255);
    over = false;
  }


if (posx < 175) {
println ("ERRO");
posx = 175;
}

if (posx > 325) {
println ("ERRO");
posx = 325;
}


  rect(posx, posy, slider_width, slider_height);
}



void mousePressed() {
  if (over) {
    locked = true;
    xoff = mouseX-posx;
  }
}
void mouseDragged() {
  if (locked) {
    posx = mouseX-xoff;
  }
}
void mouseReleased() {
  locked = false;
}
