
int hills;
int land;

int ww=400;
int hh=400;
  
  void setup()
  {
    size(400,400);
    smooth();
    frameRate(1);
    //colorMode(RGB, 100);
  }
  
  void draw()
  {
    background(255);
    
    fill(222);
    
    //land
    land = (int) random(10);
    int px1 = 0;
    int py1 = (int)random(hh);
    int px2 = ww;
    int py2 = (int)random(hh);
    int px3 = ww;
    int py3 = hh;
    int px4 = 0;
    int py4 = hh;
    
    quad(px1, py1, px2, py2, px3, py3, px4, py4);
    //String s = joinType;
    //text(s, 15, 20, 70, 70);
  
    //hills
    hills = (int)random(20);
    
    for(int i=0; i<hills; i++)
    {
      fill(random(130,255), random(130,255), random(130,255));
      triangle(random(ww),random(ww),random(ww),random(ww),random(ww),random(ww));
    }
    

  }
  // END
  
