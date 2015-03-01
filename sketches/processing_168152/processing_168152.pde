

float e_r=50; // radius of ellipses
float t_r=100; // radius of trace


void setup() {
  size(720, 480, P3D);
  smooth();
  strokeWeight(5);

  frameRate(10);
}



void draw() {

  background(255);

  translate(width/2, height/2, -100);

  rotateX(radians(mouseY));
  rotateY(radians(mouseX));
 noStroke();
  fill(0);
  float s_r=random(10, 15);
  sphere(s_r); noStroke();
 
  
  if(keyPressed){
  outer_world();
  }

  if (mousePressed) {
    background(0);
    inner_world();
  }
}
//the pattern ellipses make represents myself, which is constantly changing 

void inner_world() {
  stroke(random(0, 255), random(0, 255), random(0, 255));
  noFill();

  float delta=random(0, 360);
  for (float deg1 =0; deg1<360; deg1+=delta/4) {
    for (float deg2 =0; deg2<360; deg2+=delta/4) {
      float theta = radians(deg1);
      float vega = radians (deg2);

      float x = t_r * sin(theta) * cos(vega);
      float y = t_r * sin(theta) * sin(vega);

      ellipse(x, y, e_r, e_r);
    }
  }
}  

//triangles represent others 

float unitSize=200;
void outer_world() {
 

  float lx=0, ly=0, lz=1;

  float x=random(-200, 200);
  float y=random(-200, 200);
  float z=random(0, 200);

  float rx=random(0, unitSize);
  float ry=random(0, unitSize);
  float rz=random(0, unitSize);

  float sx=random(0, unitSize);
  float sy=random(0, unitSize);
  float sz=random(0, unitSize);

  float cx=(ry*sz-ry*sy);
  float cy=(rx*sz-rz*sx);
  float cz=(rx*sy-ry*sx);

  float size=sqrt(cx*cx+cy*cy+cz*cz);
  cx=cx/size;
  cy=cy/size;
  cz=cz/size;

  float brightness = abs(cx*lx + cy*ly + cz*lz);

  noStroke();
  colorMode(HSB, 360, 100, 100);
  fill(random(0, 360), 100, brightness*100);

  beginShape();
  vertex(x, y, z);
  vertex(x+rx, y+ry, z+rz);
  vertex(x+sx, y+sy, z+sz);
  endShape();
}


