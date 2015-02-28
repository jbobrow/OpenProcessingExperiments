
color c = color(0);
float x = 0;
float y = 100;
void setup()
{
  size( 640, 480);
  smooth();
  background(0, 87, 57);

  strokeWeight(10);
  for (int i=5; i<width; i=i+10) {
    for (int j=5; j<height; j=j+10)

      point (i, j);
  }
  
  fill(255);
  strokeWeight(20);

  for (int f= 10; f < width; f = f+30) {
    for (int g =10; g < height; g = g +30)

      point (f, g);
  }
}

void draw()
{
    fill(255, 255, 0);
   text("'r' : reset", 10, 20);
  
    color(250);
    for (int a=0; a<=width; a=a+125) {
      for (int b=0; b<=height; b=b+125) {
  
        stroke(a, b, 200);
        strokeWeight(1);
        if (mousePressed)
        {
         line(mouseX, mouseY, a, b);
       }
     }
   }
}
void keyPressed()
{
  if (key == 'r')
  {
    background(0, 87, 57);
    stroke(0,0,0);
 
    strokeWeight(10);

    for (int i=5; i<width; i=i+10) {
      for (int j=5; j<height; j=j+10)
     
        point (i, j);
    }

    fill(255);
    strokeWeight(20);

    for (int f= 10; f < width; f = f+30) {
      for (int g =10; g < height; g = g +30)

        point (f, g);
    }
  }
}
