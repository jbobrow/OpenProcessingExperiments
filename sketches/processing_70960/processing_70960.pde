
//hw6
//Sun Kyung Park
//Copyright Sun Kyung Park Sept 2012

float bx, by, bdiam, bxSpeed, bySpeed;



void setup() {
  size(500,500);
  smooth();

  bx=width/2;
  by=random(height);
  bdiam=50;
  bxSpeed=random(1,4);
  bySpeed=3;
  
}

void draw() {
  background(240,240,240);
  bounceInitials();
  
 
  drawInitials(bx, by, bdiam);

}


void drawInitials(float x, float y, float diam) {
  
//initial

  
  //outer circle

  fill(130,130,130);
  ellipseMode(CENTER);
  ellipse(x, y, diam+20, diam+20);
  
  //innter circle
  noStroke();
  fill(70,70,70);
  ellipseMode(CENTER);
  ellipse(x, y, diam, diam);
  
  //inner most circle
  noStroke();
  fill(200,200,200);
  ellipseMode(CENTER);
  ellipse(x, y, diam-20, diam-20);
  
  //s
  stroke(255,118,55);
  strokeWeight(8);
  noFill();
  beginShape();
  curveVertex(x+diam/12, y-diam/12);
  curveVertex(x, y-diam/6);
  curveVertex(x-diam/6, y-diam/3);
  curveVertex(x-diam/3, y-diam/6);
  curveVertex(x-diam/6, y);
  curveVertex(x, y+diam/6);
  curveVertex(x-diam/6, y+diam/3);
  curveVertex(x-diam/3, y+diam/6);
  curveVertex(x-diam/2, y+diam/6);
  endShape();
  
  //p
  stroke(255,118,55);
  strokeWeight(8);
  noFill();
  beginShape();
  curveVertex(x, y-diam/3);
  curveVertex(x+diam/12, y-diam/3);
  curveVertex(x+diam/6, y-diam/3);
  curveVertex(x+diam/3, y-diam/6);
  curveVertex(x+diam/6, y);
  curveVertex(x+diam/12, y);
  //line in p
  curveVertex(x+diam/12, y-diam/3);
  curveVertex(x+diam/12, y-diam/6);
  curveVertex(x+diam/12, y);
  curveVertex(x+diam/12, y+diam/6);
  curveVertex(x+diam/12, y+diam/3);
  curveVertex(x+diam/12, y+diam/2);
  endShape();
  
}


void bounceInitials() {
  bx=bx+bxSpeed;
  if (bx>width || bx < 0) {
    bxSpeed=-bxSpeed;
  }
  
  by=by+bySpeed;
  
  if (by> height || by < 0) {
    bySpeed=-bySpeed;
  }

  
  

}


