
void setup() {
  size(400,400);
}

void RoundedRect(int x, int y, int sizeX, int sizeY, float radius) {  
  // sanity check
  radius = min(min(sizeX/2,sizeY/2),radius);


  // finish edges
  line(x+radius,y,x+sizeX-radius,y);
  line(x+sizeX,y+radius,x+sizeX,y+sizeY-radius);
  line(x+sizeX-radius,y+sizeY,x+radius,y+sizeY);
  line(x,y+sizeX-radius,x,y+radius);

  // rounded arcs
  if (radius > 0) {
    arc(x+sizeX-radius,y+sizeY-radius,
        radius*2,radius*2,
        radians(0),radians(90));   
    arc(x+sizeX-radius,y+radius,
        radius*2,radius*2,
        radians(-90),radians(0));
    arc(x+radius,y+radius,
        radius*2,radius*2,
        radians(180),radians(270));
    arc(x+radius,y+sizeY-radius,
        radius*2,radius*2,
        radians(90),radians(180));
  }
}

int grid = 36;
int spacer = 6;
int radius = 12;
float chance = 0.88;
boolean fills = false;
boolean strokes = true;
int seed = 0;

void draw() {
  background(0);
  noFill();
  if (strokes){
    stroke(255,0,0);
    strokeWeight(0.1);
  }

  randomSeed(seed);
  for (int i = 0; i < (float)(width/grid); i++) {
    for (int j = 0; j < (float)(height/grid); j++) {
      boolean show = true;
      if ((i == 0) || (i == (float)(width/grid) - 1))
        show = false;
      if (random(1) > chance)
        show = show && false;
      if (show)
        RoundedRect(spacer/2+i*grid,spacer/2+j*grid,
        grid-spacer,grid-spacer,radius);
    }
  }  
}


