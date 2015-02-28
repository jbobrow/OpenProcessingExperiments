
float prevX=0;
float prevY=0;
int currentBrush =0;
color brushColor =color(0);
PImage colors;
float angle=0;
float s=1;

void setup()
{
  size(600,600);
  smooth();
  colors = loadImage("colors.jpg");
}

void draw()
{
  if (mouseButton == RIGHT) 
  {
        brushColor = get(mouseX, mouseY);
  }
  if (mousePressed == true)
  {
    if (mouseButton == LEFT)
    {
      if(currentBrush ==1)
      {
  
 strokeWeight(random(50));
 stroke(red(brushColor), green(brushColor), blue(brushColor));
 line(prevX,prevY, mouseX, mouseY);
      }
      if(currentBrush ==0)
      {
        noStroke();
        fill(red(brushColor), green(brushColor), blue(brushColor));
      pushMatrix();
      translate(mouseX,mouseY);
      rotate(angle);
      scale(s);
      triangle(-25,25,0,-25,25,25);
      popMatrix();
     
       
      }
    }
  }
 image (colors,0,0);
 
 prevX = mouseX;
 prevY = mouseY;
}

void keyReleased()
{
  if (key =='0')
  {
    currentBrush =0;
  }
  if (key =='1')
  {
    currentBrush =1;
  }
  if (key =='2')
  {
    currentBrush =2;
  }
  if (keyCode== UP)
  {
    angle +=5;
  }
  if (keyCode ==DOWN)
  {
    angle-=5;
  }
  if ( keyCode == LEFT)
  {
    s+=1;
  }
  if ( keyCode == RIGHT)
  {
    s-=1;
  }
}



