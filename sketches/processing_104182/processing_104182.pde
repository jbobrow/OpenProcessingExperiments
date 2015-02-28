
void setup()
    {
      size(400,400);
      background(0);
    }
void draw()
      {
        for(int i=10;i<width;i+=25)
           {
              for(int j=10;j<height;j+=25)
                 {
                   
                   fill(mouseX/2,mouseY/2,random(55,255));
                   ellipse(i,j,15,15);
                 }
            }      
      }


