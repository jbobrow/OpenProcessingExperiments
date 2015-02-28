
loat index =0.0;
void setup ()
{
  size (500,500);
  colorMode (HSB, 360,100,100);
  
}

void draw ()
{
  float g = map (sin(index),-1,1,0,255);
  
  

    background (g);
     
    translate(width/2, height/2);
    //translate (0, sin(index)*200);
    noStroke ();
    
    fill (g,100,100); 
    ellipse (cos(index)*300, sin(index)*200,50,50);
    ellipse (cos(index)*200, sin(index)*300,50,50);
    ellipse (cos(index)*100, sin(index)*200,50,50);
    ellipse (cos(index)*200, sin(index)*100,50,50);
     fill (360); 
    ellipse (cos(index)*200, sin(index)*200,50,50);
    index +=0.02;

  
  
}
