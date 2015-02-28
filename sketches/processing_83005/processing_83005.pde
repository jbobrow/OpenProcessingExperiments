

int num = 8;  //number of shapes

float xnoise;
float ynoise;
float inc;

PGraphics graphics; //draws forms off screen

PGraphics graphics2; //draws noise off screen


void setup() {
  background(#FFFFFF);
  size(500, 500);
  noLoop();

  colorMode(HSB, 360, 100, 100);
}



void draw() {
  Bioform [] bf;
    bf = new Bioform[num];
  for (int i=0;i<num;i++) {
    bf[i]=new Bioform(random(width/3, width/2), random(height/3, height/2)); //size of shapes
  //  scale(.6, .6);
  }
  //the following variables are for manipulating the noise colors as described
int colhigh=int(random(100,360)); //hue numbers between 0-360
int collow= colhigh-50; //the range of hues displayed 

int brighthigh= 100 ; //brightness 0-100
int brightlow=20;

int sathigh= 100; //saturation 0-100
int satlow =0;

//these following variables are for manipulating size/shape of attributes of the noise
float xncolx= random(2,5);
float xncoly= random(.5,2);
float xnbrightx=random(.5,1.8);
float xnbrighty=1;
float xnsatx= .5;
float xnsaty= .5;


  
  background(#FFFFFF);
  smooth();
  noStroke();

  float xnoise = 0.0;
  float ynoise = 0.0;
  float inc = 0.01;



  graphics2 = createGraphics(2*width, 2*height, JAVA2D);

  for (int i=0;i<num;i++) {
    bf[i].go(random(-width/10, (2*width)/3), random(-height/10, (2*height)/3)); //field dimensions where the shapes appear
  }

  graphics2.beginDraw();
  graphics2.colorMode(HSB, 360, 100, 100);
  for (int y = 0; y<height;y++) {
    for (int x=0;x<width;x++) { 
      float col = map(noise(xnoise*xncolx, ynoise*xncoly), 0, 1, collow, colhigh);  
      float bright = map(noise(xnoise*xnbrightx, ynoise*xnbrighty), 0, 1, brightlow, brighthigh); 
      float sat = map(noise(xnoise*xnsatx, ynoise*xnsaty), 0, 1, satlow, sathigh); 
      graphics2.stroke(col, sat, bright);
      graphics2.point(x, y);
      xnoise = xnoise + inc;
    }
    xnoise = 0;
    ynoise = ynoise+inc;
  }
  graphics2.endDraw();

  blend(graphics2, 0, 0, width, height, 0, 0, width, height, LIGHTEST); //this masks the noise to the shapes (onscreen)
}
class Bioform {
 
  PGraphics graphics;
  color colour;
  float [] p1x; // p1x and p1y are the beginning points of each bezier vertex drawn
  float [] p1y;
  float [] p2x; // p2x and p2y are the end points of each bezier vertex drawn
  float [] p2y;
  float [] c1x; // c1x, c1y, c2x, c2y are control points of the bezier vertices
  float [] c1y;
  float [] c2x;
  float [] c2y;
  
int c=int(random(0,360));  //hue of shapes
int b=int(random(0,50));  //brightness of shapes
int s=int(random(0,50));  //saturation of shapes


  Bioform(float w, float h) {  

    graphics = createGraphics((int)(1.5*w), (int)(1.5*h), JAVA2D);
    p1x = new float[4];
    p1x[0] = w/2+random(-w/8, w/8);
    p1x[1] = w+random(-w/8, w/8);
    p1x[2] =  w/2+random(-w/8, w/8);
    p1x[3] = random(-w/8, w/8);

    p1y = new float[4];
    p1y[0] = random(-h/8, h/8);
    p1y[1] = h/2+random(-h/8, h/8);
    p1y[2] = h+random(-h/8, h/8);
    p1y[3] = h/2+random(-h/8, h/8);


    p2x = new float[4];
    p2x[0] =  w+random(-w/8, w/8);
    p2x[1] =  w/2+random(-w/8, w/8);
    p2x[2] = random(-w/8, w/8);
    p2x[3] = w/2+random(-w/8, w/8);

    p2y = new float[4];
    p2y[0] = h/2+random(-h/8, h/8);
    p2y[1] = h+random(-h/8, h/8);
    p2y[2] = h/2+random(-h/8, h/8);
    p2y[3] = 0+random(-h/8, h/8);


    c1x = new float[4];
    c1x[0] = (3*w)/4+random(-w/3, w/3);
    c1x[1] = w+random(-w/3, w/3);
    c1x[2] = w/4+random(-w/3, w/3);
    c1x[3] = random(-w/3, w/3);

    c1y = new float[4];
    c1y[0] = random(-h/3, h/3);
    c1y[1] = (3*h)/4+random(-h/3, h/3);
    c1y[2] = h+random(-h/3, h/3);
    c1y[3] = h/4+random(-h/3, h/3);



    c2x = new float[4];
    c2x[0] = w+random(-w/3, w/3);
    c2x[1] = (3*w)/4+random(-w/3, w/3);
    c2x[2] = random(-w/3, w/3);
    c2x[3] = w/4+random(-w/3, w/3);

    c2y = new float[4];
    c2y[0] = h/4+random(-w/3, w/3);
    c2y[1] = h+random(-w/3, w/3);
    c2y[2] = (3*h)/4+random(-w/3, w/3);
    c2y[3] = random(-w/3, w/3);

    colour = color(c,b,s, 85);  //transparent color of shapes
    appear();
  }


  void appear() {
    graphics.beginDraw();
    graphics.smooth();
    graphics.noStroke();
    graphics.colorMode(HSB, 360, 100, 100);
    graphics.fill(colour);
    graphics.beginShape();
    graphics.vertex(p1x[0], p1y[0]);
    for (int i=0;i<4;i++) {
//these two lines draw the shape. because the points (p1x,p1y, and p2x, p2y) are not the same, it creates sharp little points around the shapes
      graphics.vertex(p1x[i], p1y[i]); 
      graphics.bezierVertex(c1x[i], c1y[i], c2x[i], c2y[i], p2x[i], p2y[i]); 
    }


    graphics.endShape();

    graphics.endDraw();
  }


  void go(float x, float y) {
    image(graphics, x, y);
  }
}



void mousePressed()
{

  redraw();
}


