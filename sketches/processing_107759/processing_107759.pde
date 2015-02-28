
float count = .05;

void setup()
{
  size(700,500);
  background(255);
  smooth();
}

void draw()
{
  count += .03;
 for(int i = 101; i < 211; i++)
  {
    
    float x = noise( count, (i/100.))*width;
    float y = noise( (i/100.),count)*height;
    
   stroke(0,random(150,250));
    fill(255);
    ellipse( x,y,12,16);
  
   
    
  }
  
    filter(BLUR,.09);
      saveFrame("images/export-"+"-#####.jpeg");
 if ( frameCount >= 6000 ) {
       exit();
   } 
  
}



