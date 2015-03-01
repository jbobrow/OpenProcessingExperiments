
/***************

  Mandelbrot
  Zoombeani
  Rev 13-Dec-2014
  Org 10-Dec-2014

  The Mandelbrot Set (Processing Template)
  by Daniel Shiffman.  
 
  Simple rendering of the Mandelbrot set.

  Note: Using Bees & Bombs/ Dave Whyte's render model "//~~~"

***************/

//~~~
int[][] result;
float t;

void setup() {
  setup_();
  result = new int[width*height][3];
}
 
void draw() {
  if (mousePressed) {     //Fine tune with mouse
    t = mouseX*1.0/width; //Thank you metaglitch
    t = constrain(t, 0, 1);
    while(t<0) t+=1.0;
    while(t>1) t-=1.0;
    draw_();

  } else if(mode==1) {    //Preview animation loop
    draw_();              //(Implemented by Zoombeani,
    t+=0.0025;            //idea courtesy of metaglitch)
    if(t>1.) t=0;         //Larger step = faster animation

  } else if(mode==2) {    //Preview animation loop with motion blur
    draw_();              //(Implemented by Zoombeani,
                          //idea courtesy of metaglitch)
    render();
    if(t>=1.) frameCount=0;

  } else {                //Render frames to gif
    render();
   
    saveFrame("f###.gif");
    if (frameCount==numFrames) exit();
  }
}
 
int samplesPerFrame = 1;
int numFrames = 160;
float shutterAngle = 1;

int mode = 1; //Mouse press for fine tune with mouseX
              //1  for preview animation
              //2  for preview animation with motion blur
              //3  for render to gif
//~~~

// Establish a range of values on the complex plane
// A different range will allow us to "zoom" in or out on the fractal
float xdatum=-3,xmin, ydatum=-2.5,ymin, w, h;

// Maximum number of iterations for each point on the complex plane
int maxiterations;
  
void setup_(){
  size(500, 500);
  smooth(64);
  background(255);
}

void draw_(){
  
  //map(mouseY,0,height,
  w=map(ease(t,2.2),0,1,5,0.0028959992);
  //w=map(mouseY,0,height,.007,.005);
  h=w;
  
  //xmin=map(ease(t,2.4),0,1,-3,-.09834);
  //xmin=-.09834;
  xmin=xdatum+map(ease(t,2.4),0,1,0,2.90166);
  //ymin=map(ease(t,1.7),0,1,-2.5,-.85);
  //ymin=-.85;
  ymin=ydatum+map(ease(t,1.7),0,1,0,1.65);
  
  float p1=.2,p2=.83;
  int   i1= 7,i2=25,i3=80;
  if (t<p1) maxiterations=int(map(ease(map(t,0,p1,0,1),2),0,1,1,i1));
  else if(t<p2) maxiterations=int(map(ease(map(t,p1,p2,0,1),2),0,1,i1,i2));
  else maxiterations=int(map(ease(map(t,p2,1,0,1),2),0,1,i2,i3));
  //maxiterations=250;
  
  //println(w);
  
  // Make sure we can write to the pixels[] array.
  // Only need to do this once since we don't do any other drawing.
  loadPixels();
  
  // x goes from xmin to xmax
  float xmax = xmin + w;
  // y goes from ymin to ymax
  float ymax = ymin + h;
  
  // Calculate amount we increment x,y for each pixel
  float dx = (xmax - xmin) / (width);
  float dy = (ymax - ymin) / (height);
  
  // Start y
  float y = ymin;
  for (int j = 0; j < height; j++) {
    // Start x
    float x = xmin;
    for (int i = 0;  i < width; i++) {
  
      // Now we test, as we iterate z = z^2 + cm does z tend towards infinity?
      float a = x;
      float b = y;
      int n = 0;
      while (n < maxiterations) {
        float aa = a * a;
        float bb = b * b;
        float twoab = 2.0 * a * b;
        a = aa - bb + x;
        b = twoab + y;
        // Infinty in our finite world is simple, let's just consider it 16
        if (aa + bb > 64.0) {
          break;  // Bail
        }
        n++;
      }
  
      // We color each pixel based on how long it takes to get to infinity
      // If we never got there, let's pick the color black
      if (n == maxiterations) {
        pixels[i+j*width] = color(0);
      }
      else {
        // Gosh, we could make fancy colors here if we wanted
        pixels[i+j*width] = color(n*64 % 255,n*16 % 255,n*8 % 255);
      }
      x += dx;
    }
    y += dy;
  }
  updatePixels();
}

//###Easing formulas
float ease(float p) {            //courtesy of patakk> Bees & Bombs
  return 3*pow(p,2) - 2*pow(p,3); 
}
float ease(float p, float g) {   //courtesy of patakk> Bees & Bombs
  if (p < 0.5) return 0.5 * pow(2*p, g); 
  else         return 1 - 0.5 * pow(2*(1 - p), g); 
}
                                 //courtesy of metaglitch
                                 //g is ease at beginning of motion
                                 //h is ease at completion of motion
float ease(float p, float g, float h) {
    return (1-p)*ease(p, g) + p*ease(p, h);  
}
//###

//~~~
void render(){
  for (int i=0; i<width*height; i++)
      for (int a=0; a<3; a++)
        result[i][a] = 0;
 
    for (int sa=0; sa<samplesPerFrame; sa++) {
      t = map(frameCount-1 + sa*shutterAngle/samplesPerFrame, 0, numFrames, 0, 1.);
      t=ease(t,.6);
      draw_();
      loadPixels();
      for (int i=0; i<pixels.length; i++) {
        result[i][0] += pixels[i] >> 16 & 0xff;
        result[i][1] += pixels[i] >> 8 & 0xff;
        result[i][2] += pixels[i] & 0xff;
      }
    }
 
    loadPixels();
    for (int i=0; i<pixels.length; i++)
      pixels[i] = 0xff << 24 |
        int(result[i][0]*1.0/samplesPerFrame) << 16 | 
        int(result[i][1]*1.0/samplesPerFrame) << 8 | 
        int(result[i][2]*1.0/samplesPerFrame);
    updatePixels();
}
//~~~
