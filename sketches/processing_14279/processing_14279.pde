

int x= 320;
int y = 125;
int radius=13;

void setup() {

  size(600,600);
  background(0);
  smooth();
}

void draw() {

  //big ellipse
  fill(232,205,138);
  if(keyPressed == true) {
    ellipse(100,520,50,50);
  }
  else {
    stroke(70);
  }


  //small ellipse

  strokeWeight(0);
  ellipseMode(RADIUS);
  float check = dist(x,y,mouseX,mouseY);
  if(check <radius) {
    fill(183,211,222);
    radius++;
  }
  else {
    fill(125);
  }
  ellipse(x,y,radius,radius);
}

void mousePressed() {
  radius=13;

  //background color change
  float mapColorB=map(mouseX,0,700,0,155);
  float mapColorG=map(mouseX,0,width,0,155);
  fill (mapColorB=mapColorB,mapColorG,0);

  rect(0,0,width,height); //black line

  //background big vertex

  fill(205);
  strokeWeight(0);
  beginShape();
  vertex(0,100);
  vertex(340,460);
  vertex(600,400);
  vertex(600,0);
  vertex(0,0);
  vertex(0,100);
  endShape();

  //left vertex

  fill(155,147,128);
  strokeWeight(0);
  beginShape();
  vertex(0,360);
  vertex(145,255);
  vertex(201,312);
  vertex(0,420);
  vertex(0,360);
  endShape();

  //right vertex


  fill(39,36,30);
  strokeWeight(0);
  beginShape();
  vertex(145,255);
  vertex(500,0);
  vertex(600,0);
  vertex(600,100);
  vertex(201,312);
  vertex(145,255);
  endShape();

  //rect in right vertex
  int x =420;
  int y =100;
  int w =25;
  int h =90;

  if((mouseX>x)&&(mouseX<x+w)&&(mouseY>y)&&(mouseY<y+h))
  {
    strokeWeight(0);
    rect(420,100,25,90);
    fill(41,67,77);
  }
  else {
    fill(125);
  }
  rect(x,y,w,h);

  //corner 
  stroke(30);
  fill(30);
  triangle(0,460,0,600,280,600);


  //quad in right vertex
  fill(16,51,64);
  stroke(175);
  quad(540,60,580,80,480,248,440,220);


  //line in right vertex
  strokeWeight(5);
  stroke(91,111,118);
  strokeCap(SQUARE);
  line(340,60,420,320);

  strokeWeight(2);
  stroke(123,150,160);
  line(310,180,373,246);


  // light corner -1 quad 
  strokeWeight(0);
  fill(127,123,160);
  stroke(180,107,118);
  quad(120,0,170,0,78,78,56,56);


  // light corner -2 line
  strokeWeight(15);
  stroke(49,45,72);
  strokeCap(SQUARE);
  line(-10,180,140,60);

  // light corner -3 line

  strokeWeight(2);
  stroke(66,64,80);
  strokeCap(SQUARE);
  line(-10,205,247,0);


  //black oblique line 
  strokeWeight(0);

  int f;
  if (mousePressed && insideQuad(38,0,55,0,530,600,500,600)) {
    f = 255;
  }
  else {
    f= 0;
  }
  fill(f);
  quad(38,0,55,0,530,600,500,600);
}



boolean insideQuad(float x0, float y0, float x1, float y1, float x2, float y2, float x3, float y3) {
  return insideTriangle(x0, y0, x1, y1, x2, y2) || insideTriangle(x2, y2, x3, y3, x0, y0);
}


boolean insideTriangle(float x0, float y0, float x1, float y1, float x2, float y2) {


  float dx0 = x1 - x0;
  float dy0 = y1 - y0;

  float dx1 = x2 - x0;
  float dy1 = y2 - y0;

  float dx2 = mouseX - x0;
  float dy2 = mouseY - y0;

  float dot00 = dx0 * dx0 + dy0 * dy0;
  float dot01 = dx0 * dx1 + dy0 * dy1;
  float dot02 = dx0 * dx2 + dy0 * dy2;
  float dot11 = dx1 * dx1 + dy1 * dy1;
  float dot12 = dx1 * dx2 + dy1 * dy2;

  float invDenom = 1.0f / (dot00 * dot11 - dot01 * dot01);
  float u = (dot11 * dot02 - dot01 * dot12) * invDenom;
  float v = (dot00 * dot12 - dot01 * dot02) * invDenom;

  return (u > 0) && (v > 0) && (u + v < 1);
}


