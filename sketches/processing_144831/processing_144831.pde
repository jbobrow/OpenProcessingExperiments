
float index =0.0;
void setup ()
{
  size (500,500);
  colorMode (HSB, 360,100,100);
  
  smooth();


  
}

void draw ()
{
 
   float t = map (sin(index),-1,1,255,0);
  float g = map (sin(index),-1,1,0,255);
  float m =millis();

  
  if (mousePressed == true)
  {
    
    background (0);
    translate(width/2, height/2);
    translate (0, sin(index)*200);
    fill (t); 
    ellipse (0,0,100,50);
    
    index +=0.02;
  }
  
  else {
    
    background(360);
   
 
  translate(70, 250);
   
  for (int i=0; i<10; i++)
  {
    pushMatrix();
    translate(i*40, sin(index+i)*200);
    noStroke();
    fill(g, 100, 100);
    ellipse(0, 0, 50, 50);
    popMatrix();
    
  }
    index +=0.07;
  }
  
  

}
