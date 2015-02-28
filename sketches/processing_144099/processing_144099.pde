
int posx;
int posy;
float walker;
int vel = 20;
float temps = 0;
int blancs = 0;
float punts;

void setup() {
  size(800, 500);
  noStroke();
  background(0);
  posx=width/2;
  posy=height/2;
  punts = 0;
}

void draw() {
  if (blancs < 10){
  if (mouseX != posx && mouseY != posx)
  {
    fill(0, 15);
    rect(0, 0, width, height);
    walker=random(100);

    if (walker < 25) {
      posx=posx+vel;
    }
    else if (walker < 50) {
      posx=posx-vel;
    }
    else if (walker < 75) {
      posy=posy+vel;
    }
    else {
      posy=posy-vel;
    }
    fill(255, 0, 0);
    ellipse(posx, posy, 20, 20);

    quatrelimits();

    fill(0, 0, 255);
    ellipse(mouseX, mouseY, 20, 20);
    temps = temps+1;
  }
  else {
    background(255);
    blancs = blancs+1;
}

punts = 10000*(1/(temps/blancs));
textSize(22);
fill(255);
text("PUNTUACIÓ " +int(punts),10,50);
}
else {
  textSize(52);
fill(255,0,0);
text("PUNTUACIÓ "+int(punts),200,300);
}
}

void mousePressed() {
blancs=0;
temps=0;
}

  //TOTES LES FUNCIONS

  void quatrelimits () {
    if (posx <= 0) {
      posx = width-1;
    }
    if (posx >= width) {
      posx = 1;
    }
    if (posy <= 0) {
      posy = height-1;
    }
    if (posy >= height) {
      posy = 1;
    }
  }



