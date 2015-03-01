
float delta = 5;
float delta2 = 20;
float r = 200;
boolean a = false;
float tY = 0; // tear Y position
float t = 1000;

boolean c = false; // click
float count = 0; // count 


void setup() {
  size(600, 600, P3D);
  frameRate(200);
}


void draw() {

  background(0);
  translate(width/2, height/2, 0);
  rotateX(radians(mouseY));
  rotateY(radians(mouseX));
  
  noStroke();
  if (c == true){
  drawTear(0, tY, 0, 20);
  tY += 10;
  }
  
  else if (c == false){
   tY = 0; 
  }
  
  
  stroke(0);
  fill(255);
  for (float deg = 0; deg < 360; deg += delta) {
    for (float deg2 = 0; deg2 < 360; deg2 += delta) {
      float theta = radians(deg);
      float phi = radians(deg2);
      float x1 = r * sin(phi) * cos(theta);
      float y1 = r * sin(phi) * sin(theta);
      float z1 = r * cos(phi);
      stroke(0);
      box(x1, y1, z1);
      
      float x2 = r*2.5 * sin(phi) * cos(theta);
      float y2 = r*2.5 * sin(phi) * sin(theta);
      float z2 = r*2.5 * cos(phi);
      stroke(255);
      point(x2,y2,z2);
    }
  }

  if (r>=210)
  {
    a = true;
  } else if (r<=190)
  {
    a=false;
  }

  if (a==true) {
    r --;
  } else if (a == false) {
    r ++;
  }   
  if (r>=210)
  {
    a = true;
  } else if (r<=190)
  {
    a=false;
  }

  if (a==true) {
    r--;
  } else if (a == false) {
    r++;
  } 




  float lx=0, ly=0, lz=1;

  float x = random(-300, 300);
  float y = random(-300, 300);
  float z = random(-300, 300);

  float rx = random(-300, 300);
  float ry = random(-300, 300);
  float rz = random(-300, 300);

  float sx = random(-25, 25);
  float sy = random(-25, 25);
  float sz = random(-25, 25);

  float cx = (ry*sz-ry*sy);
  float cy = (rx*sz-rz*sx);
  float cz = (rx*sy-ry*sx);

  float size = sqrt(cx*cx + cy*cy + cz*cz);
  cx = cx/size;
  cy = cy/size;
  cz = cz/size;

  float brightness = abs(cx*lx + cy*ly + cz*lz);

  fill(brightness*255);
  beginShape();
  vertex(x, y, z);
  vertex(x+rx, y+ry, z+rz);
  vertex(x+sx, y+sy, z+sz);
  endShape();
}


void mouseClicked(){
 
 count ++;
 if (count%2 == 1){
   c = true;
 } 
 
 else if (count%2 == 0){
   c = false;
 }
 
}


void drawTear(float x, float y, float z, float radius) {
  pushMatrix();
  translate(x, y, z);
  sphere(radius); 
  popMatrix();
}


