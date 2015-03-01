
float angolo;

void setup() 
{
  size (800, 600);
  background (255);
  angolo = 0;
}
void draw()
{
  background(190, 245, 237);
  fiore(400,300,random(0.3),16);
  fiore(100,100,random(0.3),800);
  fiore(700,100,random(0.3),30);
  fiore(100,500,random(0.3),80);
  fiore(700,500,random(0.3),100);
  fiore(mouseX,mouseY,random(0.3),350); 
}

void fiore(float x,float y, float zoom,int petali)
{
  pushMatrix();
   translate(x,y);
  scale(zoom);
  stroke (255,254,0);
  fill (255,254,0);
  ellipse(0, 0, 100, 100);



  for (int i=0; i<petali; i=i+1)
  { 
   
    rotate(TWO_PI/petali); 
    stroke(0, 0, 255);
    fill(255, 0, 0);
    ellipse(0, 150, 100, 200);
  }
  popMatrix();
}
