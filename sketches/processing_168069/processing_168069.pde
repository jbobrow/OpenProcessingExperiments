
float delta = 2;
float r =16;
float burnPart = 10;
void setup()
{
  size(600, 600, P3D);
  background(255);
  
}
void draw()
{ 
  translate(20, height/2, 0);
  rotateY(radians(335));
  
  drawBox();
  
  strokeWeight(1.5);
  stroke(#D8D8D8);

  // cylinder
  fill(255);
  for (float x = 0; x<200; x+=5) {
    beginShape();
    if (x>(200-burnPart)) fill(255, 0, 0);
    else if (x < 60) fill(#EA9407);
    else fill(255);  
    
    for (float deg = 0; deg < 360; deg += delta) {
      float theta = radians(deg);
      float y = r * cos(theta);
      float z = r * sin(theta);
      vertex(x, y, z);
    }
    endShape();
  }
}


void mousePressed() {

  if ( burnPart>120) { // reset
    burnPart = 10;

    background(255);
    return;
  }

  burnPart+=10;

  drawSmoke();
}


void drawSmoke() {
  noStroke();
  
  pushMatrix();
  translate(200, -height/2, 0);

  for (int i=0; i<200; i++) {

    float lx=0, ly=0, lz=1;
    float ax = random(0, 600);
    float ay = random(0, 600);
    float az = random(0, 600);

    float rx = random(0, 100);
    float ry = random(0, 100);
    float rz = random(0, 100);

    float sx = random(0, 100);
    float sy = random(0, 100);
    float sz = random(0, 100);

    float cx =(ry*sz-ry*sy);
    float cy =-(rx*sz-rz*sx);
    float cz =(rx*sy+ry*sx);

    float size = sqrt( cx*cx + cy*cy + cz*cz);
    cx = cx/size;
    cy = cy/size;
    cz = cz/size;

    float brightness = abs(cx*lx + cy*ly + cz*lz);

    fill(brightness*255, 50);
    beginShape();
    vertex(ax, ay, az);
    vertex(ax+rx, ay+ry, az+rz);
    vertex(ax+sx, ay+sy, az+sz);
    endShape();
  }
  popMatrix();
}


void drawBox(){
  
    //upper box
  pushMatrix();
  noStroke();
  fill(255);
  translate(0, -280, 0);
  rotateX(radians( 45 ) );
  box(590, 560, 200);
  popMatrix();
  
  //bottom box
  pushMatrix();
  noStroke();
  fill(255);
  translate(0, 280, 0);
  rotateX(radians( -45 ) );
  box(590, 560, 200);
  popMatrix();
}


