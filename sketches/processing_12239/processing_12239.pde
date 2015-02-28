

void setup() {
  size(800, 400);
    background(255);
  smooth();

}
void draw(){
  
  float rFill = 0;
  float gFill = 0;
  float bFill = 0;
      
       frameRate(2.5);

   rFill = random(0,255);
   gFill = random(0,255);
   bFill = random(0,255);
   for (int x=0; x<800; x=x+40)
   {
     for (int y=0; y<400; y=y+40)
     {
       fill (rFill+x/2, gFill+y/2, bFill+x+y/3);
       rect(x,y,20,20);
       
       
     }  
  
  
  }

}


