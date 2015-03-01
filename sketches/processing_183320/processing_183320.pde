
  int x=0;
  int y=80;
  int speed=2;
  

  void setup()
   {
    size(600,600);
    
    float a=random(150,255);
    float b=random(150,255);
    float c=random(150,200);
    background(255);
    
   } 
   
   void draw()
  {
    rotate(radians(x));
    y=y-1;
    frameRate(70);

    float a=random(150,255);
    float b=random(150,255);
    float c=random(150,255);
    float d=random(230,255);

    for (int m=width/9; m<=800; m=m+150)
    {
      noStroke(); fill(a,b,c,100);  
      ellipseMode(CORNER); ellipse(m,m,y,y);
      x=speed;

        if (y<-200)
        {
          m=-m; y=80;
          background(d);
        }
 
        
    }
  }
