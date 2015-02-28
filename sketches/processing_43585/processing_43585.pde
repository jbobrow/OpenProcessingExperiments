
PImage s;
//float r = random(255);

void setup()
{
  size(500,500);
  smooth();
  
  s = loadImage("final_logo_orange.png");
  noLoop();
}

void draw()
{
background(255);
for(int x=0; x< width; x= x+50)
 {
   for(int y=0; y<height; y=y+50)
   {
     float t = map(x+y,   0,height,   width,random(20));
     float siz = map(x+y,   0,9000,   0,10);
     float r = map(x, 0,1.0,  0.3,0);
     //tint(r*5, 100+r, 50);
     drawLogo(x, y, t, siz, r);
   }
 }
 
//   if (mousePressed == true) {
//    background(0);
//  } else {
//    background(255);
//  }
//  rect(25, 25, 50, 50);
 
}

void drawLogo (int x, int y, float t, float siz, float r)
{
  pushMatrix();
  translate(x,y);
  scale(siz*2);
  tint(t);
  rotate(PI/r);
  image(s, x,y, 40,40);
  popMatrix();
  
}


