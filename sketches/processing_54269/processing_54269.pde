
PShape mocalogo;
int col = 200;

void setup()
{
 size (800, 800);
smooth();
noFill();
frameRate(4);
colorMode(HSB, 360, 80, 50);

mocalogo = loadShape("moca_logo.svg");
}

void draw()
{
 background(360);
  for (int x=0; x< width; x+=160) 
  {
    for (int y=0; y<height; y+=100) 
    {
 color c1 = color(random(col, col+160), 80, 50);
 logo (x, y, c1);
  
    }
  }
}


void logo (float x, float y,  color c1)
{
 pushMatrix();
translate(x, y);
stroke(c1);
strokeWeight(2);
mocalogo.disableStyle();
shape (mocalogo, 10, 10);
popMatrix();
}


void mousePressed(){
  if (col<200) {
    col= col+160;
  } else {
    col = col-160;
  }
}






