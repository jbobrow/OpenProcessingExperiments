
import processing.opengl.*;
Pyramid[] _pyramidArr = {};

int _num = 10;
float xlast, ylast, zlast;



void setup() {
  size(600, 400, OPENGL);
  
  //strokeWeight(1);
  //fill(255, 255, 255);
  drawPyramids();
}

void draw() {
  smooth();
  background(150);
  
  //---------moves with mouse
  /*translate(width / 2, height / 2);
  rotateY(map(mouseX, 0, width, 0, PI));
  rotateZ(map(mouseY, 0, height, 0, -PI));*/
  
  for (int i=0; i< _pyramidArr.length; i++) {
    Pyramid thispyra = _pyramidArr[i];
    thispyra.updateMe();
    xlast = thispyra.x;
    ylast = thispyra.y;
    zlast = thispyra.z;
  }
}

void mouseReleased() {
  drawPyramids();
}

void drawPyramids() {
  for (int i=0; i< _num; i++) {
    Pyramid thispyra = new Pyramid();
    thispyra.drawMe();
    _pyramidArr = (Pyramid[])append(_pyramidArr, thispyra);
  }
}
//=======================objects

class Pyramid {
  float x,y,z;
  //float radius;
  //color linecol, fillcol;
  //float alph;
  float xmove, ymove, zmove;
  
  
  Pyramid() {
    x = random(200,400);
    y = random(100,300);
    z = random(50);
    //radius = random(100) + 10;
    //linecol = color(random(255), random(255), random(255));
    //fillcol = color(random(255), random(255), random(255));
    //alph = random(255);
    xmove = random(2) -1;
    ymove = random(2) -1;
    zmove = random(2) -1;
  }
  
  void drawMe() {
    //noStroke();
    //fill(fillcol, alph);
    stroke(0);
    
    pushMatrix();
    translate(x, y, z);
    
    box(5);
    
    rotateX(PI/2);
   
    beginShape(TRIANGLES);
    //noStroke();
    fill(2, 89, 89);
    vertex(-10, -10, -10);
    vertex( 10, -10, -10);
    vertex(  0,   0,  10);
    
    //noStroke();
    fill(2, 89, 89);
    vertex( 10, -10, -10);
    vertex( 10,  10, -10);
    vertex(  0,   0,  10);
    
    //noStroke();
    fill(2, 89, 89);
    vertex( 10, 10, -10);
    vertex(-10, 10, -10);
    vertex(  0,  0,  10);
    
    //noStroke();
    fill(2, 89, 89);
    vertex(-10,  10, -10);
    vertex(-10, -10, -10);
    vertex(  0,   0,  10);
    endShape();
    
    beginShape(QUAD);
    fill(0, 0, 0);
    vertex(-10, -10, -10);
    vertex(-10,  10, -10);
    vertex( 10,  10, -10);
    vertex( 10, -10, -10);
    endShape();
    
    popMatrix();
    
    stroke(255);
    line(x,y,z, xlast, ylast, zlast);
  }


void updateMe() {
  x += (xmove = random(2)-1);
  y += (ymove = random(2)-1);
  z += (zmove = random(2)-1);
  //x += xmove;
  //y += ymove;
  
  /*if (x>(width+radius)) {x=0-radius;}
  if (x<(0-radius)) {x=width+radius;}
  if (y>(height+radius)) {y=0-radius;}
  if (y<(0-radius)) {y=height+radius;}
  */
  
  drawMe();
   
  }
}
  
  


