
void setup() {
  size(500,500,P2D);
  divideSquare(5,100,100,400,400);
  rectMode(CORNERS);
}

ArrayList<PVector> parts = new ArrayList<PVector>();

void divideSquare(int depth, float x1, float y1, float x2, float y2) {
  if(depth == 0 || (x2-x1) < 10 || (y2-y1)<10) {
    parts.add(new PVector(x1,y1));
    parts.add(new PVector(x2,y2));
  } else {
    float rx = random(x1+2,x2-2);
    float ry = random(y1+2,y2-2);
    divideSquare(depth-1, x1,y1, rx,ry);
    divideSquare(depth-1, rx,ry, x2,y2);
    divideSquare(depth-1, rx,y1, x2, ry);
    divideSquare(depth-1, x1,ry, rx, y2);
  }
}

float mult = 1;
float step = TWO_PI/240.0;
final PVector middle = new PVector(250,250);

void draw() {
  background(194,169,149);
  
  float ss = abs(sin(mult-1.0));
  
  pushMatrix();
  translate(250,250);
  rotate(-mult*2);
  translate(-250,-250);
  
  stroke(113,110,139);
  fill(113,110,139); 
  for(int i=0;i<parts.size();i+=2) {
    if(random(1)<0.8) {
      PVector p1 = parts.get(i);
      PVector p2 = parts.get(i+1);
      PVector p2bis = p2.get();
      p2bis.sub(p1);
      PVector p1bis = p1.get();
      p1bis.sub(middle);
      p1bis.mult(1.0+ss*0.8);
      p1bis.add(middle);
      p2bis.add(p1bis);
    
      rect(p1bis.x,p1bis.y,p2bis.x,p2bis.y);
    }
  }
  popMatrix();
  
  translate(250,250);
  rotate(mult);
  translate(-250,-250);
  
  for(int i=0;i<parts.size();i+=2) {
    PVector p1 = parts.get(i);
    PVector p2 = parts.get(i+1);
    PVector p2bis = p2.get();
    p2bis.sub(p1);
    PVector p1bis = p1.get();
    p1bis.sub(middle);
    p1bis.mult(1.0+ss);
    p1bis.add(middle);
    p2bis.add(p1bis);
    
    if(random(1)<0.02) {
      stroke(255,83,92);
      fill(255,63,72); 
    } else {
      stroke(28,19,20);
      fill(28,19,20);
    }
    
    rect(p1bis.x,p1bis.y,p2bis.x,p2bis.y);
  }

  mult+=step;
}
