

Bioform [] bf;
int num = 8;  //number of shapes

PGraphics graphics;

float xnoise;
float ynoise;
float inc;
PGraphics graphics2;



void setup() {
  background(#FFFFFF);
  size(500, 500);
  noLoop();
  bf = new Bioform[num];
  for (int i=0;i<num;i++) {
    bf[i]=new Bioform(random(width/5, width/2), random(height/5, height/2)); //size of shapes
    scale(.6, .6);
  }
  colorMode(HSB, 360, 100, 100);
}



void draw() {

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
    for (int x=0;x<width;x++) { // have a good time playing with the following as well as multipliers of xnoise and ynoise for col, bright, and sat
      float col = map(noise(xnoise, ynoise), 0, 1, 0, 255);  //last two numbers are range of hues
      float bright = map(noise(xnoise*1.5, ynoise), 0, 1, 20, 120);  //last two numbers are range of brightness
      float sat = map(noise(xnoise*.5, ynoise*.5), 0, 1, 0, 100); //last two numbers are range of saturation
      graphics2.stroke(col, sat, bright);
      graphics2.point(x, y);
      xnoise = xnoise + inc;
    }
    xnoise = 0;
    ynoise = ynoise+inc;
  }
  graphics2.endDraw();
  
  filter(BLUR, 3);
  
  blend(graphics2, 0, 0, width, height, 0, 0, width, height, LIGHTEST);
}
class Bioform {
  PGraphics graphics;
  color colour;
  float [] p1x;
  float [] p1y;
  float [] p2x;
  float [] p2y;
  float [] c1x;
  float [] c1y;
  float [] c2x;
  float [] c2y;



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



    colour = color(#0000cc, 80);
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


