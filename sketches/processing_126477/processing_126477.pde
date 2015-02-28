

float cont = 0;
PGraphics projHorizontal;
PGraphics projVertical;

void setup() {
  size(200, 400, P3D);
  projVertical   = createGraphics(200,200,P3D);
  projHorizontal = createGraphics(200,200,P3D);
}

void drawAll(PGraphics proj, int x, int y, color c) {  
  proj.beginDraw();
  proj.strokeWeight(4);
  proj.stroke(255);
  proj.fill(150,150,150);
  proj.background(c);
  proj.translate(proj.width/2, proj.height/2, 0);
  
  beginCamera();
  if (y == 200)
  {
    proj.rotateX(-PI/2);
  }
  proj.ortho(0, proj.width, 0, proj.height,-800,800);
  endCamera();
  
  proj.rotateY(-cont*PI/360);
  // proj.line(0,100,0,-100);
  proj.line(-60,-60,-60,60,60,60);
  proj.box(40);
  proj.endDraw();
  image(proj, x, y);   
}


void draw() {
  drawAll(projVertical,0,0,color(100,100,255));
  drawAll(projHorizontal,0,200,color(100,255,100));
  cont++;
}




