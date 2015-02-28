

// sketch:  retainedWindmill.pde
// a retained mode example of Processing v2.0
// read http://codeanticode.wordpress.com/2012/03/26/opengl-in-processing-2-0-alpha-5/
// v1.0 2012-04-25  initial release
// v2.0 2012-06-03  texture handling added

PShape colorTriangle;
PImage texture1;
PImage texture2;
float spin = 0;
boolean useTexture = false;

void setup() 
{
  size(512, 400, P3D);
  fill (0);
  textSize (36);
  text ("needs processing >= v2.0",22,111);
  texture1 = loadImage("oldWood.jpg");
  createTriangle();
}

void createTriangle()
{ int w = texture1.width;
  int h = texture1.height;
  colorTriangle = createShape();
    colorTriangle.noStroke();
    if ((texture1.width > 0) && useTexture) 
      colorTriangle.texture(texture1);
    colorTriangle.fill(0,222,222);    // 1
    colorTriangle.vertex(0,0,0, 0,h);
    colorTriangle.fill(222,222,0);    // 2
    colorTriangle.vertex(120,0,0, 0,0);
    colorTriangle.fill(222,0,222);    // 3
    colorTriangle.vertex(120,120,10, w,0);
  colorTriangle.end();
}

void draw() 
{
  //  background(0);
  image (texture1,0,0,width,height);
  translate(256, 200);
  rotate (spin);
  spin += 0.01 + (mouseX-200)*0.0001;    
  for (int i=0; i<8; i++)
  {
    rotate(PI/4);  // 45°
    shape(colorTriangle);
  }
}

void mousePressed()
{
  useTexture = !useTexture;
  createTriangle();
}

