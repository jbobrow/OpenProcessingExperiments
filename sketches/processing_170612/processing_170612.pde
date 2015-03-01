
void setup()
{
 size (400, 400);
}
void draw()
{
  background(255);
  translate (width/2, height/2);
  
  
 float sekunde1= map(second(), 0, 60, 0, 2*PI);
 pushMatrix();
 rotate (sekunde1);
 stroke (255);
 fill (191, 62, 255, 150);
 smooth();
 ellipse (0, -130, 40, 40);
 popMatrix();
 
 float minute1 =map(minute(), 0, 60, 0, 2*PI);
 pushMatrix();
 rotate (minute1);
 stroke (255);
 fill (255, 0, 255, 130);
 smooth ();
 ellipse (0, -130, 60, 60);
 popMatrix();
 
float hour1 =map (hour(), 0, 12, 0, 2*PI);
pushMatrix();
rotate (hour1);
stroke (255);
fill (124, 252, 0, 150);
smooth ();
ellipse (0, -130, 80, 80);
popMatrix ();


 
}
  
  
  
  

