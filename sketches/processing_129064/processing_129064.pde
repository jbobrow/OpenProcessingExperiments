
PImage pic;
boolean filterApplied = false;

void setup()

{
 size (600, 600);
 pic = requestImage("fotovicky.jpg");
}
 
void draw ()
 
{
     
   
 if (pic.width > 0)
    {
     image(pic, 0, 0, width, height);
       
      if (filterApplied == false)
     {
      pic.filter(GRAY);
      filterApplied =  true;
     }
      
    }
     
     stroke(255);
     strokeWeight(3);
     for (int i = 70; i < 420; i = i + 50)
   {
      
     line(150, i, 450, i);
      
   }
     
      for (int i = 150; i < 480; i = i + 50)
      
   {
      
     line(i, 70, i, 370);
   
  }
 
 fill (0);
 stroke(0);
 {
   rect(0, 0, 180, 600);
   rect(0, 0, 600, 75);
   rect(420, 0, 200, 600);
   rect(0, 370, 600, 400);
 }
 
 //top
 float x0 = 200;
float y0 = 0;
float prevX0 = x0;
float prevY0 = y0;
strokeWeight (3);
stroke(255);
while (y0 < 75)
  {
    y0 += 5;
    x0 += random(-5, 5);
    line(prevX0, prevY0, x0, y0);
    prevX0 = x0;
    prevY0 = y0;
    
  }
 
  
  float x1 = 250;
float y1 = 0;
float prevX1 = x1;
float prevY1 = y1;
strokeWeight (3);
stroke(255);
while (y1 < 75)
  {
    y1 += 5;
    x1 += random(-5, 5);
    line(prevX1, prevY1, x1, y1);
    prevX1 = x1;
    prevY1 = y1;
    
  }
  
  float x2 = 300;
float y2 = 0;
float prevX2 = x2;
float prevY2 = y2;
strokeWeight (3);
stroke(255);
while (y2 < 75)
  {
    y2 += 5;
    x2 += random(-5, 5);
    line(prevX2, prevY2, x2, y2);
    prevX2 = x2;
    prevY2 = y2;
    
  }
  
  float x3 = 350;
float y3 = 0;
float prevX3 = x3;
float prevY3 = y3;
strokeWeight (3);
stroke(255);
while (y3 < 75)
  {
    y3 += 5;
    x3 += random(-5, 5);
    line(prevX3, prevY3, x3, y3);
    prevX3 = x3;
    prevY3 = y3;
    
  }
  
  float x4 = 400;
float y4 = 0;
float prevX4 = x4;
float prevY4 = y4;
strokeWeight (3);
stroke(255);
while (y4 < 75)
  {
    y4 += 5;
    x4 += random(-5, 5);
    line(prevX4, prevY4, x4, y4);
    prevX4 = x4;
    prevY4 = y4;
    
  }
  
  //bottom
  float x5 = 200;
float y5 = 370;
float prevX5 = x5;
float prevY5 = y5;
strokeWeight (3);
stroke(255);
while (y5 < 600)
  {
    y5 += 5;
    x5 += random(-5, 5);
    line(prevX5, prevY5, x5, y5);
    prevX5 = x5;
    prevY5 = y5;
    
  }
  
  float x6 = 250;
float y6 = 370;
float prevX6 = x6;
float prevY6 = y6;
strokeWeight (3);
stroke(255);
while (y6 < 600)
  {
    y6 += 5;
    x6 += random(-5, 5);
    line(prevX6, prevY6, x6, y6);
    prevX6 = x6;
    prevY6 = y6;
    
  }
  
  float x7 = 300;
float y7 = 370;
float prevX7 = x7;
float prevY7 = y7;
strokeWeight (3);
stroke(255);
while (y7 < 600)
  {
    y7 += 5;
    x7 += random(-5, 5);
    line(prevX7, prevY7, x7, y7);
    prevX7 = x7;
    prevY7 = y7;
    
  }
  
  float x8 = 350;
float y8 = 370;
float prevX8 = x8;
float prevY8 = y8;
strokeWeight (3);
stroke(255);
while (y8 < 600)
  {
    y8 += 5;
    x8 += random(-5, 5);
    line(prevX8, prevY8, x8, y8);
    prevX8 = x8;
    prevY8 = y8;
    
  }
  
  float x9 = 400;
float y9 = 370;
float prevX9 = x9;
float prevY9 = y9;
strokeWeight (3);
stroke(255);
while (y9 < 600)
  {
    y9 += 5;
    x9 += random(-5, 5);
    line(prevX9, prevY9, x9, y9);
    prevX9 = x9;
    prevY9 = y9;
    
  }
  
  //right
  float x10 = 420;
float y10 = 120;
float prevX10 = x10;
float prevY10 = y10;
strokeWeight (3);
stroke(255);
while (x10 < 600)
  {
    x10 += 5;
    y10 += random(-5, 5);
    line(prevX10, prevY10, x10, y10);
    prevX10 = x10;
    prevY10 = y10;
    
  }
  
  float x11 = 420;
float y11 = 170;
float prevX11 = x11;
float prevY11 = y11;
strokeWeight (3);
stroke(255);
while (x11 < 600)
  {
    x11 += 5;
    y11 += random(-5, 5);
    line(prevX11, prevY11, x11, y11);
    prevX11 = x11;
    prevY11 = y11;
    
  }
  
  float x12 = 420;
float y12 = 220;
float prevX12 = x12;
float prevY12 = y12;
strokeWeight (3);
stroke(255);
while (x12 < 600)
  {
    x12 += 5;
    y12 += random(-5, 5);
    line(prevX12, prevY12, x12, y12);
    prevX12 = x12;
    prevY12 = y12;
    
  }
  
  float x13 = 420;
float y13 = 270;
float prevX13 = x13;
float prevY13 = y13;
strokeWeight (3);
stroke(255);
while (x13 < 600)
  {
    x13 += 5;
    y13 += random(-5, 5);
    line(prevX13, prevY13, x13, y13);
    prevX13 = x13;
    prevY13 = y13;
    
  }
  
  float x14 = 420;
float y14 = 320;
float prevX14 = x14;
float prevY14 = y14;
strokeWeight (3);
stroke(255);
while (x14 < 600)
  {
    x14 += 5;
    y14 += random(-5, 5);
    line(prevX14, prevY14, x14, y14);
    prevX14 = x14;
    prevY14 = y14;
    
  }
  
  //left
  float x15 = 0;
float y15 = 120;
float prevX15 = x15;
float prevY15 = y15;
strokeWeight (3);
stroke(255);
while (x15 < 180)
  {
    x15 += 5;
    y15 += random(-5, 5);
    line(prevX15, prevY15, x15, y15);
    prevX15 = x15;
    prevY15 = y15;
    
  }
  
  float x16 = 0;
float y16 = 170;
float prevX16 = x16;
float prevY16 = y16;
strokeWeight (3);
stroke(255);
while (x16 < 180)
  {
    x16 += 5;
    y16 += random(-5, 5);
    line(prevX16, prevY16, x16, y16);
    prevX16 = x16;
    prevY16 = y16;
    
  }
  
  float x17 = 0;
float y17 = 220;
float prevX17 = x17;
float prevY17 = y17;
strokeWeight (3);
stroke(255);
while (x17 < 180)
  {
    x17 += 5;
    y17 += random(-5, 5);
    line(prevX17, prevY17, x17, y17);
    prevX17 = x17;
    prevY17 = y17;
    
  }
  
  float x18 = 0;
float y18 = 270;
float prevX18 = x18;
float prevY18 = y18;
strokeWeight (3);
stroke(255);
while (x18 < 180)
  {
    x18 += 5;
    y18 += random(-5, 5);
    line(prevX18, prevY18, x18, y18);
    prevX18 = x18;
    prevY18 = y18;
    
  }
  
  float x19 = 0;
float y19 = 320;
float prevX19 = x19;
float prevY19 = y19;
strokeWeight (3);
stroke(255);
while (x19 < 180)
  {
    x19 += 5;
    y19 += random(-5, 5);
    line(prevX19, prevY19, x19, y19);
    prevX19 = x19;
    prevY19 = y19;
    
  }
  
  
}



