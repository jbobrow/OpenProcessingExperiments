
//     Christoph Lueder
//
//     2010
//
//     www.lueder.info


void setup (){
  size (840,840); 
  frameRate (25); 
  smooth();
  noStroke (); 
  colorMode(RGB, 255, 255, 255, 1);
  background(0); 
} 

int subX = 1;
int subY = 1;
float r;
float g;
float b;
float rs;
float gs;
float bs;
int subXs;
int subYs;
int i;

void draw () { 
  cursor(CROSS);
  PFont font;
  font = loadFont ("DIN-18.vlw");
  textFont (font);
  
  //getting subdivision of the field from mouse position
  int submaxX = abs(mouseX/4);
  int submaxY = abs(mouseY/4);
  int submin = 1;
  
  //adjusting subdivisions gradually
  if (subX < submaxX) {
    subX = subX + 1 + (int)((submaxX-subX)/4);
  }
  else {
    subX = subX - (int)((subX-submaxX)/4);
  }
  if (subX == 0) {
    subX = 1;
  }
  if (subY < submaxY) {
    subY = subY + 1 + (int)((submaxY-subY)/4);
  } 
  else {
    subY = subY - (int)((subY-submaxY)/4);
  }
  if (subY == 0) {
    subY = 1;
  }
  //dimensions of color strips
  float gridX = (width-40)/subX; 
  float gridY = (height-40)/subY;
  
  //setting gradient of color change within strips
  float gradientR = 1;
  float gradientG = - gradientR * 2;
  float gradientB = gradientR * 3;
  
  //setting constraints for RGB color channels
  float rmin = 150;
  float rmax = 255;
  float gmin = 0;
  float gmax = 255;
  float bmin = 0;
  float bmax = 205;
  
  //new starting color
  r = (1*r + random(rmin, rmax)) / 2;
  g = (1*g + random(gmin, gmax)) / 2;
  b = (1*b + random(bmin, bmax)) / 2;
  
  //fade in of new pattern
  i = i + 1;
  if (i < 25) {
    r = rs;
    g = gs;
    b = bs;
    subX = subXs;
    subY = subYs;
  } 
  else {
    i = 1;
    rs = r;
    gs = g;
    bs = b;
    subXs = subX;
    subYs = subY;
  }
  
  //generation of pattern in vertical strips
  for (int x = 20; x<(width-20); x+=gridX) { 
    for (int y = 20; y<(height-20); y+=gridY) { 
      r = r + (gradientR);
      g = g + (gradientG);
      b = b + (gradientB);
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
      fill (r, g, b, 0.1*i); 
      rect (x, y, gridX, gridY);
    } 
  }
  
  //text line giving current subdivision
  fill(1, 1, 1);
  rect(0, 0, 840 , 20);
  rect(0, 820, 840 , 20);
  rect(0, 0, 20 , 840);
  rect(820, 0, 20 , 840);
  fill(255, 255, 255);
  text ("move cursor to explore pattern :    X-axis currently " + subX + " / " + submaxX +"    -    Y-axis  " + subY + " / "+ submaxY, 15 , 16);

} 






















