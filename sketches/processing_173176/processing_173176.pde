
float counter=0;
void setup ()
{
  size (500, 500);
  background (255);

}
void draw ()
{
  if (mouseX >=165 && mouseX <=335 && mouseY >= 150 && mouseY <=300)
  {

    colorMode (HSB, 360, 100, 100);
    background (0, 1, 95);//weis
    if (mousePressed == true)
    {
      fill (0, 81, 87);//rot
      smooth();

      translate (0, sin(counter)*100);

      ellipse (215, 200, 100, 100); 


      ellipse (285, 200, 100, 100); 


      triangle (175, 230, 325, 230, 250, 300); 
      println(sin(counter));//Nachverfolgung
      counter+=0.2;//Zeit
    } else

    {
      colorMode(HSB, 360, 100, 100);
      background (0, 1, 95);//weis
    }
  } else 
  {
    colorMode(HSB, 360, 100, 100);
    background (0, 81, 87);//rot
  }

  noStroke();
  ellipse (215, 200, 100, 100); 
  ellipse (285, 200, 100, 100); 
  triangle (175, 230, 325, 230, 250, 300); 
  fill (0, 81, 87);
}

