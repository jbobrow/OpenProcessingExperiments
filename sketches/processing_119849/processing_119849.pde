
float x, y, radi, velocitatx, velocitaty;
 
void setup()
{
  size (600,600);
 background(255);
  x = 300;
  y= 500;
  velocitatx = 10;
  velocitaty =random(10);
  radi = 20;
     
  noStroke();
  smooth();
  
}
 
void draw()
{
background(255);
  bola();
  movbola();
}
 
 
void bola()
{
  fill (0);
  ellipse (x,y,radi,radi);
}
 
 
void movbola()
{
 x+=velocitatx;
 y+=velocitaty;
 if (x>width-radi || x<0+radi)
  {
  velocitatx=-velocitatx;
  }
 else if (y>height-radi||y<0+radi)
  {
  velocitaty=-velocitaty;
  }
}


