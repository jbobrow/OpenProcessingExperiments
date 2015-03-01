
float r = 500;
float delta=10;
float dx, dy, dz, d = 1000; 
float dv = 20; // decrease d
float count = 0;


void setup() {
  size(700, 700, P3D);
  noStroke();
  fill(100);
  frameRate(8);
}

void draw() {
  
  lights();
  translate(width/2, height/2, 0);
  PVector a = new PVector (mouseX,mouseY);
  PVector b = new PVector (pmouseX,pmouseY);
  float am = sqrt(a.x*a.x+a.y*a.y);
  float bm = sqrt(b.x*b.x+b.y*b.y);
  float alpha = PVector.angleBetween(a,b);
  float o = am*bm*sin(alpha);
  float om = abs(o);
  float c = map(om,0,10000,100,0);
  background(0,c,c);
  
  rotateX(radians(mouseY));
  rotateY(radians(mouseX));

  if (mousePressed) {
    fill(150);
    float fov = PI/3.0; 
    float cameraZ = (height/2.0) / tan(fov/2.0); 
    perspective(fov, float(width)/float(height), cameraZ/2.0, cameraZ*2.0);
  } else {
    ortho(0, width, 0, height);
  }
  translate(width/2, height/2, 0);
  rotateX(-PI/6); 
  rotateY(PI/3); 
  box(200); 

  
  if (count == 1) {
    fill(#FA3A84);
    dx = d;
    dy = 0;
    dz = 0;
    drawSphere(dx, dy, dz, 50); 
    if (d>0)
      d-= dv;
    else if (d == 0) {
      d = 1000;
      count++;
    }
  } else if (count == 2) {
    fill(#4D9EFF);
    dx = 0;
    dy = d;
    dz = 0;
    drawSphere(dx, dy, dz, 80); 
    if (d>0)
      d-= dv;
    else if (d == 0) {
      d = 1000;
      count++;
    }
  } else if (count == 3) {
    fill(#A3FF1C);
    dx = 0;
    dy = 0;
    dz = d;
    drawSphere(dx, dy, dz, 60); 
    if (d>0)
      d-=dv;
    else if (d == 0) {
      d = 1000;
      count++;
    }
  } else if (count == 4) {
    fill(#B03AFA);
    dx = -d;
    dy = 0;
    dz = 0;
    drawSphere(dx, dy, dz, 75);
    if (d>0)
      d-=dv;
    else if (d == 0) {
      d = 1000;
      count++;
     
    }
  } else if (count == 5) {
    fill(#1CFFC8);
    dx = 0;
    dy = -d;
    dz = 0;
    drawSphere(dx, dy, dz, 55); 
    if (d>0)
      d-=dv;
    else if (d == 0) {
      d = 1000;
      count++;
    }
  } else if (count == 6) {
    fill(#FEFF0F);
    dx = 0;
    dy = 0;
    dz = -d;
    drawSphere(dx, dy, dz, 75); 
    if (d>0)
      d-=dv;
  }
 

    else if (d == 0) {
      d = 1000;
      count = 0;
    }
  }


void mouseClicked() {
  count ++;
}
void drawSphere(float x, float y, float z, float radius) {
  pushMatrix();
  translate(x, y, z);
  sphere(radius); 
  popMatrix();



}
