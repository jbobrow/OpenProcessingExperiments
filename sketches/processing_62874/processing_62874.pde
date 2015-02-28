
/*

Jerod Rivera 
Mediatecture Wk2 HW
-------------------

Using for loops, objects and mouse X,Y

*/



float x, y;
float xmove, ymove;

void setup() {
  frameRate(20);
  size(600, 600);

  noFill();

  x += xmove;
  y += ymove;

  xmove = random(300);
  ymove = random(60);
}



void draw() {



  for (int i=0; i<width; i+=40)
  {
    for (int j=0; j<height; j+=40)
    {

      smooth();

      float r = random(50);
      fill(255);
      // rect(0,0,500,500);

      stroke(0, 20+mouseX);
      strokeWeight(r+ymove);
      ellipse(i, j, 20+r, 20+r);

      
    }
  }
}


