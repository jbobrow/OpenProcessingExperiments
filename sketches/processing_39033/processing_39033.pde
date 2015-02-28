
  float r=30;
    
    void setup()
    {
      size (400,400); 
    }
    
    void draw()
    {
    
    if (r<400)
    {
      r=r+3;
    }
    fill (255,40);
    noStroke();
    triangle(100, 0, 300, 0, 200, r);
    }
