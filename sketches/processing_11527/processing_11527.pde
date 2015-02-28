
//Owaun Scantlebury August 29th 2010
//Image warp c2 OPtimized
//Drag the mouse to control the warp
//Revolves in circular motion by default


PImage tex;
void setup() {

  background(1); 
  
tex = loadImage("desk.png");
size(tex.width,tex.height,P3D);
}

void draw() {
  background(tex);
  beginShape();
  noStroke();

  //strokeWeight(.5);
  float rotx= 6.3;
  float kkv1 = .1/2;


  color c= circleit(width/2,height/2, _x,25,1);
  if (!mousePressed) {
    mouseX=(int)red(c);
    mouseY=(int)green(c);
  }

  texture(tex);
  // kkv1 = .1;
  for (float z=0;z<rotx+(kkv1/2);z+=kkv1) {
    circle(mouseX,mouseY,z,width/2,1);
    // po++;
  }
  endShape(CLOSE);


  _x+=.1/2;
  if (_x>rotx+(kkv1/2)) {
    _x= 1./2;
  }
}

public float _x;


color circleit( float startx,float starty, float angle,float distance,int lark) {
  color retval = 0;
  float endx = startx + cos(angle) * distance;
  float endy = starty + sin(angle) * distance;
  // vertex(endx,endy,endx,endy);
  retval = color (endx,endy,255);
  return retval;
}

void circle( float startx,float starty, float angle,float distance,int lark) {

  float endx = startx + cos(angle) * distance;
  float endy = starty + sin(angle) * distance;
  vertex(endx,endy,endx,endy);
}




