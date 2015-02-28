
float posx = 0;
float posy = 0;
float r = 0;
float g = 0;
float b = 0;

void setup() {
  size(250,250);
  background(0);
}

void draw() {

  if(mousePressed) {
    fill (r,g,b);
    rectMode(CENTER);
    posx=mouseX++;
    posy=mouseY++;
    rect (posx,posy,posx,posy);
  }

  else {
    r = random(255);
    g = random(255);
    b = random(255);
    posx=0;
    posy=0;
  }
}


