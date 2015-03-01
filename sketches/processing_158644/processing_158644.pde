

/* gradient using shapes and vertices*/

//mouse position x determines width
//mouse position y determines position
//mouse wheel determines rotation

color c1, c2;
float edge1, edge2, scaleA, scaleB, r;
int number;

void setup() {
  size(400, 400, P3D);//stes up shader
  noStroke();
  c1=color(255);
  c2=color(0);
  //colorMode(HSB);
}

void draw() {
  float  x1 = map(mouseX, 0, width, 0, .5);
  //println(x1);
  scaleA = x1; //decreases the size of the gradient spread. determins the range of gradeint movement?
  float  y1 = map(mouseY, 0, height, -edge1, edge1);
  scaleB = y1;
  edge1 = (scaleA)*width;
  edge2 = (width -2*edge1);



  beginShape(QUAD_STRIP);
  fill(c1);
  //stroke(0,0,255);
  vertex(0-width/4, 0-height/4);
  vertex(0-width/4, height+height/4);
  vertex(edge1-scaleB, 0-height/4);
  vertex(edge1-scaleB, height+height/4);
  fill(c2);
  vertex(edge2+edge1-scaleB, 0-height/4);
  vertex(edge2+edge1-scaleB, height+height/4);
  fill(c2);
  vertex(width+width/4, 0-height/4);
  vertex(width+width/4, height+height/4);
  translate(width/2, height/2); 
  rotate(r);
  translate(-width/2, -height/2);
  
  endShape();
//println(scaleA, scaleB);
}
void keyPressed() {
  if (key == 'r'){
  if (r <= 2*PI) {
    r=r+4*PI/360;
  } else {
    r=0;
  }
  }

//println(r);
}
void mousePressed() {
  
  if (mouseButton == RIGHT) { 
    c1 = (int) random(0x1000000) | #000000;    
  }
  if (mouseButton == LEFT){           
      c2 = (int) random(0x1000000) | #000000;  
  }   
  }




