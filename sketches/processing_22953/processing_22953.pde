
float x = 1;
float y = 1;
   void setup()
    {
    size(500,500);
    background(255);
    };


   void draw()
    {
    line(x,0,x,500);
    line(0,x,500,x);
    x = x*1.1;
  
    }

