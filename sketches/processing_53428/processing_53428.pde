

PFont zombie;
String alot = "A LOT!";


float x, y;



void setup()
{
  size(500, 500);
  smooth();


  zombie = loadFont("ZombieChecklistAlpha-50.vlw");
  textFont(zombie);
  textAlign(CENTER, CENTER);

  x=width/2;
  y=height/2;
}

void draw()
{  
  background(53, 189, 39);

  float distText = dist(x, y, mouseX, mouseY);

  if (distText <= 50)
  { 
    
    for (int i=0;i<width+100;i+=100) {
      for (int j=0;j<height;j+=35) {
        
        pushMatrix();
        scale(random(0.3,3));
        
        text(alot, i, j);
        popMatrix();
      }
    }
  }
  else
  {   
    text(alot, x, y);
  }
}


