
float x, y;
float size = 40.0;

void setup()
{
  size(500,500);
  noStroke();
  frameRate(30);
  text("mercantile",20,30);
}

void draw()
{
  background(150);
  textSize(35);
  text("mercantile",35,160);
  fill(250,250,0);
  
  x = x + 1;
  
  if (x > width + size) {
  x = -size;
  }
  
  translate(x,height/2-size/2);
  textSize(100);
  text("S P",size,size);
  fill(255,255,255);
 
 translate(x,size/1);
 textSize(100);
 text("A C",size,size);
 fill(0);
 
 translate(x,size/0.5);
 textSize(100);
 text("E",size,size);
 fill(255,255,255);
}


