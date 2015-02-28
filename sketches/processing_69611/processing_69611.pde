
//import processing.pdf.*;
void setup()
{
  size(500, 600);//, PDF, "Wallpaper2.pdf");
  smooth();
}

void draw()
{
  noFill();
  for (int i = 0; i < 800; i += 125)
  {
    
    for (int j = 0; j <800; j += 125)
    {
       boolean u = false;
        if (u == true)
        {
          fill(255);
          u = false;
        }
        else
        {
          fill (230, 20, 20);
          u = true;
        }
      
      //fill(map(i, 0, 800, 0, 255), map(i, 0, 800, 0, 40+i), map(i, 0, 800, 0, 130+i));
      ellipse(i, j, map(mouseX, 0, 800, 0, 40), map(mouseX, 0, 800, 0, 40));
     fill(0,0,0);
     translate(i,j);
      for (int b = 0; b < 360; b += 20) 
    {
      pushMatrix();
      rotate(radians(b));
      translate(260, -300);
      rotate(radians(45));
      triangle(70, 363, 65, 338, 68, 336);
      popMatrix();
    }
    translate(-i,-j);
    }
  }
  //exit();
}
