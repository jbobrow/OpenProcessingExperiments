
float x =0;
 
void setup()
{
  size(400,400);
  smooth();
}

void draw()
{
  background(250, 245, 230);
  stroke(255);
  strokeWeight(3);
   
  translate(width/2,height/2);
   
  for(float i=0; i<TWO_PI; i+=0.2) 
  {
    pushMatrix();
    rotate(x+i);
    line(0,0,100,0);
 
    for (float j=0; j<TWO_PI; j+=0.7) 
    {
      pushMatrix();
      translate(100,0);
      rotate(-x-j);
      line(0,0,50,0);
    
      popMatrix();
    }
       if(mousePressed == true)
        { 
          float c1 = random(255);
          float c2 = random(243);
          float c3 = random(196);
          float c4 = random(255);
          stroke(c1, c2, c3, c4);
        }
 
    popMatrix();
  }
 endShape();
 
  //movement and rotation
  x+=0.01;
}
