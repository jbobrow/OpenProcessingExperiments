
// GIL 5-4-2012 first processing scketch

void setup() 
{
  size(450, 450);
  noStroke();
  smooth();
  mouseX=int(random(25, width-25));
  mouseY=int(random(25, height-25));
}

void draw() 
{   
  if (mouseX==width/2 && mouseX == mouseY) { 
    background(255); fill(252, 9, 45, 255); // red harts
  } else { 
    background(120); fill(230, 230, 230, 200); // grey harts
  }  
  drawHart(mouseX, (height/2-mouseY/2)+(height/8), 0, 8);
  drawHart(width-mouseX, mouseY-(height/8), 8, 0);
}

void drawHart (float px, float py, int dim1, int dim2) {
  // px,py lines coordinates, dim1,dim2 dimensional limits, 
  // delta dimension multiplier (window must be a square)
  float delta = map(mouseY, 0, height, dim1, dim2);
  // hart proportion parameters based on window size
  float hh = height/(delta);      // hart height
  float uw = width/(delta*4);     // upper width
  float lw = width/(delta/1.47);  // lower width
  float uh = height/(delta/0.58); // upper height
  float lh = height/(delta/1.07); // lower height
  // draw hart
  bezier(px, py, px-uw, py-uh, px-lw, py+hh-lh, px, py+hh);
  bezier(px, py, px+uw, py-uh, px+lw, py+hh-lh, px, py+hh);
}

