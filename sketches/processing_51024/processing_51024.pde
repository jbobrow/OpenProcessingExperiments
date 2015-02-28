
void setup()
{
  size(640,480);
}

void draw()
{
  background (200);
  translate (320,240);
  smooth();
  
  //whites of their eyes
  fill(255);
  strokeWeight(5);
  ellipse (-150,-50, 200, 200);
  ellipse (150, -50, 200, 200);
  
  //wrinkles...
  noFill();
  arc (-150, -50, 200,260,0,PI/2);
  arc (-150, -50, 200,400,0,PI/2);
  arc (150, -50, 200,260,PI/2,PI);
  arc (150, -50, 200,400,PI/2,PI);
  
  //pupils...
  //float easing = 0.01
  //x += (targetX - x) * easing;
  
  fill(0);
  float x = mouseX-320;
  float cx= constrain(x, 90, 210);
  float y = mouseY-240;
  float cy= constrain(y, -50, 0);
  
  float i = mouseX-320;
  float ci= constrain(i, -210,-90);
  float j = mouseY-240;
  float cj= constrain(j, -50, 0);
  
  int d= 50;
  
  if (mousePressed==true)
  {
    d= 15;
  }else{
    d=50;
  }
  
  ellipse(cx, cy, d,d);
  ellipse(ci, cj, d,d);
  //ellipse(x, y, 50,50);
  
  //eyelids
   if (mousePressed==true)
  {
    fill(200, 0);
  }else{
   fill(200, 255);
  } 
 
  arc (-150,-50, 200, 200, PI, 2*PI);
  arc (150, -50, 200, 200, PI, 2*PI);
  
}

