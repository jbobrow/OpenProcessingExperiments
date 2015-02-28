


void setup()
  {
    size(520,520);
    rect(10,10,500,500);
    background(255);
    smooth();
  }

void draw()
  {
    
  
    for(int ix=0;ix<14;ix++)
      {
        for(int iy=0; iy<14;iy++)
         {
           if(iy<=6&&ix<=6)
             {
           strokeWeight(((7-iy)+(ix)));
             }
           if(iy<=6&&ix>=7)
             {
             strokeWeight(((7-iy)+(14-ix)));
             }
           if(iy>7&&ix<=6)
             {
             strokeWeight((((-1+iy)/2)+(ix)));
             }
           if(iy>7&&ix>=6)
             {
             strokeWeight((((-1+iy)/2)+(13-ix)));
             }
           ellipse((10+(500/14)/2+ix*(500/14)),
                   (10+(500/14)/2+iy*(500/14)),
                   (500/14),
                   (500/14));
          }
      }
  }
  
  
  


