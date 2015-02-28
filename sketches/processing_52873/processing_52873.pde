
void setup() {
  size (300, 300);
}

void draw() {
  //set canvase

  background (172, 211, 115);
  
  for (int x = 0; x < 25; x++)
  {
    for (int y = 0; y < 25; y++)
    {
          int x1 = 15 + 30 * x;
          int y1 = 15 + 30 * y;
          fill(255);
          ellipse(x1,y1,26,20);
          
          float a = x1;
          float b = y1;
          
          if ((mouseX - x1) * (mouseX - x1) + (mouseY - y1) * (mouseY - y1) < 16)
          {
            a = x1;
            b = y1;
          }
          else if (mouseX - x1 == 0)
          {
               a = x1;
           if ( mouseY - y1 > 0)
           {
             b = y1 + 4;
           }
           else 
           {
             b = y1 - 4;
             }
          }
          else
          {
             float a1 =  (float)(x1 + 4 / java.lang.Math.sqrt(1 + (mouseY - y1) * (mouseY - y1) / ((mouseX - x1) * (mouseX - x1))));
             float  b1 =  (float)(y1  + 4*(mouseY - y1) / (mouseX -x1) / java.lang.Math.sqrt(1 + (mouseY - y1) * (mouseY - y1) / ((mouseX - x1) * (mouseX - x1))));
       
             float a2 =  (float)(x1 - 4 / java.lang.Math.sqrt(1 + (mouseY - y1) * (mouseY - y1) / ((mouseX - x1) * (mouseX - x1))));
             float  b2 =  (float)(y1  - 4*(mouseY - y1) / (mouseX -x1) / java.lang.Math.sqrt(1 + (mouseY - y1) * (mouseY - y1) / ((mouseX - x1) * (mouseX - x1))));
             
             if ((a1 - x1) * (mouseX - x1) >= 0 &&  (b1 - y1) * (mouseY - y1) >= 0 )
             {
               a = a1;
               b = b1;
             }
             else
             {
               a = a2;
               b = b2;
             }
           }
          
          fill(0);
          ellipse(a, b, 10, 10);
    }
  }
}
                                
