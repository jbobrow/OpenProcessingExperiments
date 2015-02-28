
//     Christoph Lueder 
//
//     2010
//
//     www.lueder.info


void setup (){
  size (900,640); 
  frameRate (60); 
  smooth();
  //noStroke(); 
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
int gc;
float gradientR;
float gradientG;
float gradientB;
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
  PFont font12;
  font10b = loadFont ("DINBold-10.vlw");
  font12b = loadFont ("DINBold-12.vlw");
  font10 = loadFont ("DIN-10.vlw");
  font12 = loadFont ("DIN-12.vlw");

  //getting subdivision of the field from mouse position
  int submaxX = abs(mouseX-20)/(int)(width/40);
  int submaxY = abs(mouseY-20)/(int)(height/30);
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
  int gr = 30;
  gc = gc + 1;
  if (gc == 10) {
    gradientR = (int)(gr*noise(t+10))-gr/2;
    gradientG = (int)(gr*noise(t+20))-gr/2;
    gradientB = (int)(gr*noise(t+30))-gr/2;
    gc = 0;
  }

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
    float cc = noise (t + 5) * 375.5 + 0.00000001;
    rmin = ((int)(125.5 / cc)) * (cc - 0);
    rmax = 255 - ((int)(255 / cc)) * ((int)(cc / 125.5)) * (255 - cc);
    gmin = ((int)(255 / cc)) * ((int)(cc / 125.5)) * (cc - 125.5);
    gmax = 255 - ((int)(375.5 / cc)) * ((int)(cc / 255)) * (375.5 - cc);
    bmin = ((int)(375.5 / cc)) * ((int)(cc / 255)) * (cc - 255);
    bmax = 255 - ((int)(125.5 / cc)) * (125.5 - cc);
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
      noStroke();
      int o = 0;
      if ( (int)((x-20)/gridX/2) < ((x-20)/gridX/2) ) {
        o = 1;
      } 
      ellipseMode (CENTER);
      ellipse (x+gridX/2, y+(0.5+o)*gridY/2, gridX+pow(gridX,2)*gc/1300, gridY+pow(gridY,2)*gc/1300);
    } 
  }

  //text line giving current subdivision
  fill(1, 1, 1);
  noStroke();
  rect(0, 0, width , 20);
  rect(0, height-20, width , 20);
  rect(0, 0, 20 , 840);
  rect(width-20, 0, 20 , height);
  fill(255, 255, 255);

  /*textFont (font10b);
   text ("move cursor to explore pattern", width-700, height-5);
   textFont (font12);
   text ("COLORFIELD", 20, 30);
   text ("STRIPS", width-65, 30);
   text ("LINES", 20, height-20);
   text ("NOISE", width-60, height-20);
   */
  fill (150, 150, 150);
  textFont (font10b);
  text ("rgb :  "+(int)rmin+"/"+(int)rmax+" - "+(int)gmin+"/"+(int)gmax+" - "+(int)bmin+"/"+(int)bmax, width-400, height-5);
  text ("iterations : "+ (int)(t/tt), width-200, height-5);

  // lines marking cursor x y and subdivision
  stroke (255); 
  textFont (font12b);
  fill(255, 255, 255);
  float xpos = mouseX;
  if (xpos < 40) {
    xpos = 40;
  }
  if (xpos > width-40) {
    xpos = width-40;
  }
  line (xpos, 2, xpos, (30));
  textAlign(RIGHT);
  text (subX, xpos-5, 15);
  textAlign(LEFT);
  text (submaxX, xpos+5, 15);
  float ypos = mouseY;
  if (ypos < 30) {
    ypos = 30;
  }
  if (ypos > height-40) {
    ypos = height-40;
  }
  line (2, ypos, (30), ypos);
  textAlign(RIGHT);
  text (subY, 18, ypos-4);
  text (submaxY, 18, ypos+14);

  //line (mouseX, (height-30), mouseX, height-15);
  //line ((width-30), mouseY, width-10, mouseY);
} 

















