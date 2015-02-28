
void setup (){
  size (840,840); 
  frameRate (1); 
  smooth();
  noStroke (); 
  colorMode(RGB, 255);
  background(0); 
} 

void draw () { 

  cursor(CROSS);
  PFont font;
  font = loadFont ("DIN-18.vlw");
  textFont (font);
  int z;
  int submin = 1;
  int submaxX = abs(mouseX/4);
  int submaxY = abs(mouseY/2);
  float subX = random(submin, submaxX);
  float subY = random(submin, submaxY);
  float gridX = (width-40)/subX; 
  float gridY = (height-40)/subY;
  int gradientR = 2;
  int gradientG = -gradientR*2;
  int gradientB = gradientR*5;
  int rmin = 100;
  int rmax = 255;
  int gmin = 0;
  int gmax = 255;
  int bmin = 0;
  int bmax = 225;
  float r = random(rmin, rmax);
  float g = random(gmin, gmax);
  float b = random(bmin, bmax);

  for (int x = 20; x<(width-20); x+=gridX) { 
    for (int y = 20; y<(height-20); y+=gridY) { 
      //      if (x==width) { 
      //        x=0; 
      //      } 
      r = r+=(gradientR);
      g = g+=(gradientG);
      b = b+=(gradientB);
      if (r>rmax) { 
        r=rmin; 
      }
      if (r<rmin) { 
        r=rmax; 
      }
      if (g>gmax) { 
        g=gmin; 
      }
      if (g<gmin) { 
        g=gmax; 
      }
      if (b>bmax) { 
        b=bmin; 
      }
      if (b<bmin) { 
        b=bmax; 
      }
      fill (r,g,b); 
      rect (x,y,gridX,gridY); 
    } 
  }

  fill(1, 1, 1);
  rect(0, 0, 840 , 20);
  rect(0, 820, 840 , 20);
  rect(0, 0, 20 , 840);
  rect(820, 0, 20 , 840);
  fill(255, 255, 255);
  text ("move cursor to adjust grain :    X-axis currently between 1 / " + submaxX +"    -    Y-axis between 1 / "+ submaxY, 15 , 16);

}




