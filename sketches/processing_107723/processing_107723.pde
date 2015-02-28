
float count = 30000;

void setup()
{
  size(640,480);
  
  frameRate(30);
}

void draw()
{
  count += .08;
   
    noStroke();
fill(255,50);
rect(0,0,width,height);

  for(int i = 0; i < 10000; i++)
  {
    
    float x = noise( count, (i/10000.))*width;
    float y = noise( (i/10000.),count)*height;
   
    fill(0,15);
    ellipse( x,y,5,5);
  
    
  }
//   saveFrame("images/export-"+"-#####.jpeg");
//if ( frameCount >= 6000 ) {
//      exit();
//   } 

  
}



