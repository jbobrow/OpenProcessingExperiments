

PGraphics img;
int width = 500;
int height = 400;
float state = 0.01;

void setup() {
  
  img = createGraphics(width,height,P2D);
  size(width,height,P2D);
  
  img.beginDraw();
  img.background(5);
  img.stroke(100,50);
  innerEquiSpiralDraw(img,state);
  img.endDraw();
}

void draw() {
  
  state = (1 - state) * 0.01 + state;
  
  img.background(5);
  innerEquiSpiralDraw(img,state);
  
  img.updatePixels();
  image(img,0,0);
}

void innerEquiSpiralDraw(PGraphics source,float angle) {
  
  // Define basis point
  int bounds = source.width > source.height ? source.height: source.width;
  PVector origin = new PVector(source.width/2,source.height/2);
  
  // Outer edge of our draw is at 0*
  PVector preVert = new PVector(bounds - 1,0);
  PVector vert = new PVector(bounds - 1,0);
  
  // Our rotational step
  PVector stepMatrix[] = {new PVector(cos(angle),sin(angle)), new PVector(cos(angle + HALF_PI),sin(angle + HALF_PI))};
  
  // Draw until it saturation
  do{
    
    vert.mult(angle);
    
    PVector X = stepMatrix[0].get();
    PVector Y = stepMatrix[1].get();
    
    X.mult(vert.x);
    Y.mult(vert.y);
    
    vert.set(X.x + Y.x, X.y + Y.y,0);
    
    img.stroke(200,0,0,50);
    source.line(preVert.x + origin.x, preVert.y + origin.y, vert.x + origin.x, vert.y + origin.y);
    source.point(preVert.x + origin.x, preVert.y + origin.y);
    source.point(vert.x + origin.x, vert.y + origin.y);
    
    img.stroke(0,200,0,50);
    source.line(origin.x - preVert.x, preVert.y + origin.y, origin.x - vert.x, vert.y + origin.y);
    source.point(origin.x - preVert.x, preVert.y + origin.y);
    source.point(origin.x - vert.x, vert.y + origin.y);
    
    img.stroke(0,0,200,50);
    source.line(preVert.x + origin.x, origin.y - preVert.y, vert.x + origin.x, origin.y - vert.y);
    source.point(preVert.x + origin.x, preVert.y - origin.y);
    source.point(vert.x + origin.x, vert.y - origin.y);
    
    img.stroke(0,200,0,50);
    source.line(origin.x - preVert.x, origin.y - preVert.y, origin.x - vert.x, origin.y - vert.y);
    source.point(origin.x - preVert.x, preVert.y - origin.y);
    source.point(origin.x - vert.x, vert.y - origin.y);
    
    preVert.set(vert.get());
    
  }while (vert.mag() > 1.0);
  
}

