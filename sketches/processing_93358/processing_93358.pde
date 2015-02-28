
int r = 0; 
int g = 0;
int b = 0;
int opacity = 150;
int diam = 0;
int w = 0;
int h = 0;
int randMin = 2;
int randMax = 250;
int colMin = 0;
int colMax = 255;

void setup() {
    size(512, 512); 
}

void draw(){
  
  if (keyPressed){
    r = colMax;
    g = colMax;
    b = colMax;
  } else {
    r = int(random(colMin, colMax));
    g = int(random(colMin, colMax));
    b = int(random(colMin, colMax));
  }
  
  fill(r, g, b, opacity);
  if (mousePressed){
    w = int (random(randMin, randMax));
    h = int (random(randMin,randMax));
    rectMode(CENTER);
    rect (mouseX, mouseY, h, w);
  } else {
    diam = int(random(randMin, randMax));
    ellipse (mouseX, mouseY, diam, diam);
  }
}
