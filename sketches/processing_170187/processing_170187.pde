
float degree1 = 0;
float degree2 = 0;
float delta = 100;
boolean stop = false;
float i=0; 
void setup()
{
  size(800, 800, P3D);
}

void draw()
{

  background(0);

  translate(width/2, height/2, -width/2);

  stroke(255);
  strokeWeight(2);
  if (key==CODED)
  {
    if (!stop) {
      if (keyCode==UP)
      {
        degree1++;
      }
      if (keyCode==DOWN)
      {
        degree1--;
      } 
      if (keyCode==RIGHT)
      {
        degree2++;
      }
      if (keyCode==LEFT)
      {
        degree2--;
      }
    }
    rotateX(radians(degree1));
    rotateY(radians(degree2));
  }    
  //

  for ( int z=-250; z<=250; z+=delta) 
  {
    for (int y=-250; y<=250; y+=delta) 
    {
      for (int x=-250; x<=250; x+=delta) 
      {
        float r=map(x, -250, 250, 0, 255);
        float g=map(y, -250, 250, 0, 255);
        float b=map(z, -250, 250, 0, 255);
        fill(r, g, b, 200);

        pushMatrix();
        translate(x, y, z);
        box(80);
        popMatrix();
      }
    }
  }


  if (mousePressed)
  {  
    background(0);
    box(i);
    fill(255);
    i+=1;
  }else{
    i=0;
  }
    
  
}



void keyPressed() 
{
  stop=!stop;
}
