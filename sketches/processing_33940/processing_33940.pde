
int a = 0;
int b = 5;
void setup()
{
size(700,400);
background(0);
}

void draw()
{
 noFill();
 stroke(255);

background(0);
 ellipse(width/2, height/2, b, b);
 
}

void mouseDragged() 

{
  b = b + 10;
  if (b > 1000) {
    b = 10;
  }




 

  
}



