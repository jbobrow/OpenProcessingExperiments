
//     Christoph Lueder 
//
//     2010
//
//     www.lueder.info


void setup (){
  size (900,440); 
  frameRate (60); 
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
float t = 1;
float tt = 0.01;

//setting initial constraints for RGB color channels 
float rmin = 150;
float rmax = 255;
float gmin = 0;
float gmax = 255;
float bmin = 0;
float bmax = 205;



void draw () { 

  //cursor and fonts
  cursor(CROSS);
  PFont font10b;
  PFont font12b;
  PFont font10;
  font10b = loadFont ("DINBold-10.vlw");
  font12b = loadFont ("DINBold-12.vlw");
  font10 = loadFont ("DIN-10.vlw");

  //getting subdivision of the field from mouse position
  int submaxX = abs(mouseX/(int)(width/100));
  int submaxY = abs(mouseY/(int)(height/100));
  int submin = 1;

  //adjusting subdivisions gradually
  if (subX < submaxX) {
    subX = subX + 1 + (int)((submaxX-subX)/4);
  }
  if (subX > submaxX) {
    subX = subX - (int)((subX-submaxX)/4) - 1;
  }
  if (subX <= 1) {
    subX = 1;
  }
  if (subY < submaxY) {
    subY = subY + 1 + (int)((submaxY-subY)/4);
  } 
  if (subY > submaxY) {
    subY = subY - (int)((subY-submaxY)/4) - 1;
  }
  if (subY <= 1) {
    subY = 1;
  }

  //  once subdivision is stable no more fade-in
  if ((subY == subYs) && (subX == subXs)) {
    i = 9;
  }


  //dimensions of color strips
  float gridX = (width-40)/subX; 
  float gridY = (height-40)/subY;

  //setting gradient of color change within strips
  float gradientR = 1;
  float gradientG = - gradientR * 2;
  float gradientB = gradientR * 3;

  //new starting color
  r = 255 * noise(t);
  g = 255 * noise(t+1);
  b = 255 * noise(t+2);


  //fade in of new pattern
  i = i + 1;
  if (i < 9) {
    r = rs;
    g = gs;
    b = bs;
    subX = subXs;
    subY = subYs;
  } 
  else {
    i = 1;
    //moving t along for perlin function
    t = t + tt;
    //loading new color constraints and subdividers
    rs = r;
    gs = g;
    bs = b;
    subXs = subX;
    subYs = subY;
    //setting new constraints for RGB color channels
    rmin = 100 + 50 * noise (t);
    gmin = 20 * noise (t+1);
    bmin = 20 * noise (t+2);
    rmax = 110 + (215 * noise (t));
    gmax = 110 + (215 * noise (t+1));
    bmax = 110 + (115 * noise (t+2));
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
  rect(0, 0, width , 20);
  rect(0, height-20, width , 20);
  rect(0, 0, 20 , 840);
  rect(width-20, 0, 20 , height);
  fill(255, 255, 255);
  textFont (font10b);
  text ("move cursor to explore pattern :   x = " + subX + " / " + submaxX +"     y = " + subY + " / "+ submaxY, width-700, height-5);
  textFont (font12b);
  text ("COLORFIELD", 10, 15);
  text ("STRIPS", width-50, 15);
  text ("LINES", 10, height-5);
  text ("NOISE", width-50, height-5);
  fill (150, 150, 150);
  textFont (font10b);
  text ("rgb :  "+(int)rmax+"-"+(int)gmax+"-"+(int)bmax+"     iterations : "+ (int)(t/tt), width-400, height-5);

} 

