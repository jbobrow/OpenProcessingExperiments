
//                  Pierre MARZIN
//  processing calculation and rendering of different attractors
//    Peter de Jong:
//    x' = sin(a * y) - cos(b * x)
//    y' = sin(c * x) - cos(d * y)
//    Cliff Pickover:
//    x' = sin(a * y) + c * cos(a * x)
//    y' = sin(b * x) + d * cos(b * y)

// use  c to switch between BW/colors
//      a to switch between auto / manual redraw
//      
//  if manual change is choosen, press space bar to redraw and
//                               x to switch between Peter de Jong/Cliff Pickover attractors 


//coordinates
float x0, y0, x1, y1;
//boundaries: min and max values of x1 and y1
float xmin, xmax, ymin, ymax, xmid, ymid;
//max value of parameters a, b c and d
int si=5;
//parameters a, b c and d of the attractors
float   a, b, c, d;
//scales and translation values used for scaling the rendered attractor
int echx, echy, ech, tx, ty, w, h;
//how many cycles
int nbePoints;
int margin=50;
//switches for color/WB, Jong/Pickover attractors type, auto/manual redraw
boolean useColors, Jong, auto;
float blur;
PFont font;

void setup() {  
  size(1000, 1000, P2D);  
  smooth();
  frameRate(300);
  strokeWeight(.5);
  textMode(SCREEN);  
  stroke(0, 100);
  font=loadFont("Verdana-18.vlw");
  textFont(font, 18);
  useColors=false;
  Jong=true;
  auto=true;
  blur=0;
  nbePoints=1000000;  
  //go calculate a few points
  attractor();
}

//here we just calculate points for 1000 cycles to estimate the size and center of the "curve"
void attractor() {  
  a = si-random(2*si);
  b =  si-random(2*si);
  c = si-random(2*si);
  d = si-random(2*si); 
  //initiation of the starting point 
  x0=0.1;
  y0=0;
  //initiation of the boundaries 
  xmin=100;
  xmax=-100;
  ymin=100;
  ymax=-100;
  //cycles
  for (int i=0;i<1000;i++) {
    if (Jong) {
      x1 =  sin(a * y0) - cos(b * x0);
      y1 = sin(c * x0) - cos(d * y0);
    }
    else {
      x1 = sin(a * y0) +c* cos(a * x0);
      y1 = sin(b * x0) +d*cos(b * y0);
    }
    xmin=min(xmin, x1);
    xmax=max(xmax, x1);
    ymin=min(ymin, y1);
    ymax=max(ymax, y1);
    x0 = x1;
    y0 = y1;
  }
  //now we can calculate and render 1000000
  render(a, b, c, d, xmin, xmax, ymin, ymax);
}
void render(float a, float b, float c, float d, float xmin, float xmax, float ymin, float ymax) {
  background(255);
  if (!useColors)stroke(0, 50);
  x0=0.1;
  y0=0;
  //center
  xmid=(xmin+xmax)/2;
  ymid=(ymin+ymax)/2;
  //width/height of the rendering window
  w=width-2*margin;
  h=height-2*margin;
  //scales (we could use echx for x1 and echy for y1, so the curve would be stretched to fill the window)
  echx=int((float)w/(xmax-xmin));
  echy=int((float)h/(ymax-ymin));
  ech=min(echx, echy);
  //translation
  tx=w/2-int(xmid*ech);
  ty=h/2-int(ymid*ech);
  //actual calculation
  for (int i=0;i<nbePoints;i++) {
    if (Jong) {
      //       x1 =  (sin(a * y0) - cos(b * x0)- noise(x0));
      //      y1 = (sin(c * x0) - cos(d * y0)- noise(y0));
      x1 =  sin(a * y0) - cos(b * x0);
      y1 = sin(c * x0) - cos(d * y0);
    }
    else {
      //      x1 =  (sin(a * y0) +c* (cos(a * x0)- noise(x0)));
      //      y1 = (sin(b * x0) +d*(cos(b * y0)- noise(y0)));
      x1 = sin(a * y0) +c* cos(a * x0);
      y1 = sin(b * x0) +d*cos(b * y0);
    }    
    x0 = x1;
    y0 = y1;
    x1+=random(-blur, blur);
    y1+=random(-blur, blur);
    //I use Perlin noise for colors if needed
    if (useColors)stroke(256*noise(x1), 256*noise(y1), 256*sin(x1* y1), 120);     
    point(margin+tx+x1*ech, margin+ty+y1*ech);
    //point(map(x1,xmin,xmax,margin,width-margin), map(y1,ymin,ymax,margin,height-margin));
  }
  //display of the attractor's type and equations
  fill(0);
  if (Jong) {
    text("Pete de Jong attractor:", 10, 20);
    text("x1= sin("+a+"*y0)-cos("+b+"*x0)", 220, 20);
    text("y1= sin("+c+"*x0)-cos("+d+"*y0)", 220, 40);
  }
  else {
    text("Clifford attractor:", 10, 20);
    text("x1= sin("+a+"*y0)+"+c+"*cos("+a+"*x0)", 220, 20);
    text("y1= sin("+b+"*x0)"+d+"*cos("+b+"*y0)", 220, 40);
  }
}
void draw() {
  //if auto is selected, a new attractor is displayed every 500 frames
  if (auto && frameCount%500==0) {
    Jong=(random(1)<.5);
    attractor();
  }
}
void keyPressed() {
  //println(keyCode);
  switch(keyCode) {
  case 32:
    attractor();
    break;
  case 67:
    useColors=!useColors;
    render(a, b, c, d, xmin, xmax, ymin, ymax);
    break;
  case 88:
    Jong=!Jong;
    render(a, b, c, d, xmin, xmax, ymin, ymax);
    break;
  case 65:
    auto=!auto;
    break;
  case 66:
    blur+=0.005;
    if (blur>0.02)blur=0;
    render(a, b, c, d, xmin, xmax, ymin, ymax);
    break;
  }
}


