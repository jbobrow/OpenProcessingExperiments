

// sketch: Test_PixelDrawing.pde  
//    v1.0  5/2011
//    v2.0  7/2011
// show the speed difference of drawing pixels with
//  stroke(color);  point(x,y)     and   
//  pixels[pixelOffset] = color(...);
 
int dim = 512;
boolean test1 = true;
float start = 0;
 
//-----------------------------------------------------------
void setup()
{
  size(dim,dim); 
//  size(dim,dim,P2D);  // faster!!!
  frameRate(200);
  colorMode(HSB,dim);
  textSize(16);
  start = millis();
}
//-----------------------------------------------------------
void draw()
{
  if (test1)
    drawTest1();
  else drawTest2();
  float fps = frameCount * 1000 / (millis() - start);
  text("FPS: " + nf(fps,0,1)+ "  fast="+!test1
       +"       toggle test with mouse click", 11, 22);
}
//-----------------------------------------------------------
void mousePressed()
{ test1 = !test1;
  // reset fps!
  frameCount = 1;  
  start = millis();
}
//-----------------------------------------------------------
// pixel drawing using point(x,y);  slow
void drawTest1()
{ for(int y=0; y<height; y++)
  { for(int x=0; x<width; x++)
    { stroke (x, y, 200+random(200));
      point (x,y);
    }  
  } 
}
//-----------------------------------------------------------
// pixel drawing using pixels[offset];  faster
void drawTest2()
{ float dx,dy,d = 0;
  int pixelOffset = 0;
  loadPixels(); // must call before using pixels[]
  for(int y=0; y<height; y++)
  { for(int x=0; x<width; x++)
    { pixels[pixelOffset] = color(x, y, 200+random(200));
      pixelOffset++;
    }
  }
  updatePixels(); // display picture
}


