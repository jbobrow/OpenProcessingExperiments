
PImage s;
PImage g;
PImage o;
int x, y;
float angle;

void setup()
{
  size(600,600);
  smooth();
  imageMode(CENTER);
  colorMode(HSB);
  background(100,30,255);
  
  s = loadImage ("final_logo_orangewb.png");
  g = loadImage ("final_logo_gothamwb.png");
  o = loadImage ("final_logo_oratorwb.png");
}



void draw()
{
  
    if(mousePressed && mouseButton == LEFT)
  {
  //tint(mouseX, mouseY, 204);
  tint(0,0,255,20);
  logo_lubalin(width-mouseX, mouseY, s);
  //tint(mouseX, 104, mouseY);
  logo_gotham(mouseX, height-mouseY+100, s);
  //tint(mouseY, 54, mouseX);
  logo_orator(width+mouseY, height+mouseX-100, s);
  }
else if (mousePressed && mouseButton == RIGHT) 
{
    background(100,30,255);
  }
  
}

void logo_lubalin (float x, float y, PImage s)
{
  pushMatrix();
  image(s, width-mouseX, mouseY, 250,250);
  popMatrix();
}

void logo_gotham (float x, float y, PImage s)
{
  pushMatrix();
  image(g, mouseX, height-mouseY+100, 250,250);
  popMatrix();
}

void logo_orator (float x, float y, PImage s)
{
  pushMatrix();
  image(o, 100+mouseX, height+mouseY-500, 250,250);
  popMatrix();
}

