

PImage lastFrame = new PImage();

int x = 0;
int y = 250;

void setup() {
  size(500,500);
  smooth();
  strokeWeight(7);
  lastFrame = get();  // NOTE THAT WE HAVE TO GET A FRAME HERE SO WE DON'T CHOKE OF THE FIRST IMAGE IN THE DRAW LOOP.
}

void draw() {
  strokeWeight(7);
  background(0,0,0);
  // THIS DRAWS THE IMAGE FROM BEFORE ON THE SCREEN.
  image(lastFrame, 0, 0);
  ellipse(x,y,10,10);
  x++;

//THIS CAPTURES THE CURRENT IMAGE ON THE SCREEN
  lastFrame = get();
  ellipse (y,x,10,10);
}



