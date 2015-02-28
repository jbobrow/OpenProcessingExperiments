

float rotationX;
float rotationY;
float hRotationXY = 0.01;
Hyperbox hyperbox;
PImage iBackground;

void setup() {
  size(800, 800, P3D);
  iBackground = loadImage ("LogoBackground.jpg");
  hyperbox = new Hyperbox(200, 200, 200, 200);
}

void draw() {
  background(iBackground);
  translate(width/2, height/2);
  rotateX(rotationX);
  rotateY(rotationY);
  
  hyperbox.rotateXY(hRotationXY);
  hyperbox.display();
  
  rotationX += radians(mouseY - (width/2)) / 1000;
  rotationY += -radians(mouseX - (height/2)) / 1000;
}


//Hyperbox class
class Hyperbox {
  Vector4D point1, point2, point3, point4, 
           point5, point6, point7, point8,
           point9, point10,point11, point12,
           point13, point14, point15, point16;
  
  Hyperbox(float w, float h, float d, float l) {
    w /= 2;
    h /= 2;
    d /= 2;
    l /= 2;
    
    point1 = new Vector4D (-w, -h, -d, -l);
    point2 = new Vector4D (w, -h, -d, -l);
    point3 = new Vector4D (-w, -h, d, -l);
    point4 = new Vector4D (w, -h, d, -l);
    
    point5 = new Vector4D (-w, h, -d, -l);
    point6 = new Vector4D (w, h, -d, -l);
    point7 = new Vector4D (-w, h, d, -l);
    point8 = new Vector4D (w, h, d, -l);
    
    point9 = new Vector4D (-w, -h, -d, l);
    point10 = new Vector4D (w, -h, -d, l);
    point11 = new Vector4D (-w, -h, d, l);
    point12 = new Vector4D (w, -h, d, l);
    
    point13 = new Vector4D (-w, h, -d, l);
    point14 = new Vector4D (w, h, -d, l);
    point15 = new Vector4D (-w, h, d, l);
    point16 = new Vector4D (w, h, d, l);
  }
  // Method to rotate Hypercube
  void rotateXY(float a) {
    point1.rotateXY(a);
    point2.rotateXY(a);
    point3.rotateXY(a);
    point4.rotateXY(a);
    point5.rotateXY(a);
    point6.rotateXY(a);
    point7.rotateXY(a);
    point8.rotateXY(a);
    point9.rotateXY(a);
    point10.rotateXY(a);
    point11.rotateXY(a);
    point12.rotateXY(a);
    point13.rotateXY(a);
    point14.rotateXY(a);
    point15.rotateXY(a);
    point16.rotateXY(a);
  }
  
  // Method to display
  void display() {
    Vector4D point1b, point2b, point3b, point4b, 
           point5b, point6b, point7b, point8b,
           point9b, point10b,point11b, point12b,
           point13b, point14b, point15b, point16b; 
    
    point1b = point1.persProject();
    point2b = point2.persProject();
    point3b = point3.persProject();
    point4b = point4.persProject();
    
    point5b = point5.persProject();
    point6b = point6.persProject();
    point7b = point7.persProject();
    point8b = point8.persProject();
    
    point9b = point9.persProject();
    point10b = point10.persProject();
    point11b = point11.persProject();
    point12b = point12.persProject();
    
    point13b = point13.persProject();
    point14b = point14.persProject();
    point15b = point15.persProject();
    point16b = point16.persProject();
    
    stroke(0);
    strokeWeight(4);
    beginShape(POINTS);
    vertex(point1b.x, point1b.y, point1b.z);
    vertex(point2b.x, point2b.y, point2b.z);
    vertex(point3b.x, point3b.y, point3b.z);
    vertex(point4b.x, point4b.y, point4b.z);
    
    vertex(point5b.x, point5b.y, point5b.z);
    vertex(point6b.x, point6b.y, point6b.z);
    vertex(point7b.x, point7b.y, point7b.z);
    vertex(point8b.x, point8b.y, point8b.z);
    
    vertex(point9b.x, point9b.y, point9b.z);
    vertex(point10b.x, point10b.y, point10b.z);
    vertex(point11b.x, point11b.y, point11b.z);
    vertex(point12b.x, point12b.y, point12b.z);
    
    vertex(point13b.x, point13b.y, point13b.z);
    vertex(point14b.x, point14b.y, point14b.z);
    vertex(point15b.x, point15b.y, point15b.z);
    vertex(point16b.x, point16b.y, point16b.z);
    endShape();
    
    stroke(100);
    strokeWeight(1);
    fill(0,20);
    beginShape(QUADS);
    vertex(point1b.x, point1b.y, point1b.z);
    vertex(point2b.x, point2b.y, point2b.z);
    vertex(point4b.x, point4b.y, point4b.z);
    vertex(point3b.x, point3b.y, point3b.z);
    
    vertex(point5b.x, point5b.y, point5b.z);
    vertex(point6b.x, point6b.y, point6b.z);
    vertex(point8b.x, point8b.y, point8b.z);
    vertex(point7b.x, point7b.y, point7b.z);
    
    vertex(point1b.x, point1b.y, point1b.z);
    vertex(point3b.x, point3b.y, point3b.z);
    vertex(point7b.x, point7b.y, point7b.z);
    vertex(point5b.x, point5b.y, point5b.z);
    
    vertex(point1b.x, point1b.y, point1b.z);
    vertex(point2b.x, point2b.y, point2b.z);
    vertex(point6b.x, point6b.y, point6b.z);
    vertex(point5b.x, point5b.y, point5b.z);
    
    vertex(point2b.x, point2b.y, point2b.z);
    vertex(point4b.x, point4b.y, point4b.z);
    vertex(point8b.x, point8b.y, point8b.z);
    vertex(point6b.x, point6b.y, point6b.z);
    
    vertex(point3b.x, point3b.y, point3b.z);
    vertex(point4b.x, point4b.y, point4b.z);
    vertex(point8b.x, point8b.y, point8b.z);
    vertex(point7b.x, point7b.y, point7b.z);
    
    
    vertex(point9b.x, point9b.y, point9b.z);
    vertex(point10b.x, point10b.y, point10b.z);
    vertex(point12b.x, point12b.y, point12b.z);
    vertex(point11b.x, point11b.y, point11b.z);
    
    vertex(point13b.x, point13b.y, point13b.z);
    vertex(point14b.x, point14b.y, point14b.z);
    vertex(point16b.x, point16b.y, point16b.z);
    vertex(point15b.x, point15b.y, point15b.z);
    
    vertex(point9b.x, point9b.y, point9b.z);
    vertex(point11b.x, point11b.y, point11b.z);
    vertex(point15b.x, point15b.y, point15b.z);
    vertex(point13b.x, point13b.y, point13b.z);
    
    vertex(point9b.x, point9b.y, point9b.z);
    vertex(point10b.x, point10b.y, point10b.z);
    vertex(point14b.x, point14b.y, point14b.z);
    vertex(point13b.x, point13b.y, point13b.z);
    
    vertex(point10b.x, point10b.y, point10b.z);
    vertex(point12b.x, point12b.y, point12b.z);
    vertex(point16b.x, point16b.y, point16b.z);
    vertex(point14b.x, point14b.y, point14b.z);
    
    vertex(point11b.x, point11b.y, point11b.z);
    vertex(point12b.x, point12b.y, point12b.z);
    vertex(point16b.x, point16b.y, point16b.z);
    vertex(point15b.x, point15b.y, point15b.z);
    
    
    vertex(point1b.x, point1b.y, point1b.z);
    vertex(point9b.x, point9b.y, point9b.z);
    vertex(point11b.x, point11b.y, point11b.z);
    vertex(point3b.x, point3b.y, point3b.z);
    
    vertex(point3b.x, point3b.y, point3b.z);
    vertex(point11b.x, point11b.y, point11b.z);
    vertex(point12b.x, point12b.y, point12b.z);
    vertex(point4b.x, point4b.y, point4b.z);
    
    vertex(point2b.x, point2b.y, point2b.z);
    vertex(point10b.x, point10b.y, point10b.z);
    vertex(point12b.x, point12b.y, point12b.z);
    vertex(point4b.x, point4b.y, point4b.z);
    
    vertex(point1b.x, point1b.y, point1b.z);
    vertex(point2b.x, point2b.y, point2b.z);
    vertex(point10b.x, point10b.y, point10b.z);
    vertex(point9b.x, point9b.y, point9b.z);
    
    vertex(point5b.x, point5b.y, point5b.z);
    vertex(point13b.x, point13b.y, point13b.z);
    vertex(point15b.x, point15b.y, point15b.z);
    vertex(point7b.x, point7b.y, point7b.z);
    
    vertex(point7b.x, point7b.y, point7b.z);
    vertex(point15b.x, point15b.y, point15b.z);
    vertex(point16b.x, point16b.y, point16b.z);
    vertex(point8b.x, point8b.y, point8b.z);
    
    vertex(point6b.x, point6b.y, point6b.z);
    vertex(point14b.x, point14b.y, point14b.z);
    vertex(point16b.x, point16b.y, point16b.z);
    vertex(point8b.x, point8b.y, point8b.z);
    
    vertex(point5b.x, point5b.y, point5b.z);
    vertex(point13b.x, point13b.y, point13b.z);
    vertex(point14b.x, point14b.y, point14b.z);
    vertex(point6b.x, point6b.y, point6b.z);
    
    
    vertex(point1b.x, point1b.y, point1b.z);
    vertex(point9b.x, point9b.y, point9b.z);
    vertex(point13b.x, point13b.y, point13b.z);
    vertex(point5b.x, point5b.y, point5b.z);
    
    vertex(point3b.x, point3b.y, point3b.z);
    vertex(point11b.x, point11b.y, point11b.z);
    vertex(point15b.x, point15b.y, point15b.z);
    vertex(point7b.x, point7b.y, point7b.z);
    
    vertex(point4b.x, point4b.y, point4b.z);
    vertex(point12b.x, point12b.y, point12b.z);
    vertex(point16b.x, point16b.y, point16b.z);
    vertex(point8b.x, point8b.y, point8b.z);
    
    vertex(point2b.x, point2b.y, point2b.z);
    vertex(point10b.x, point10b.y, point10b.z);
    vertex(point14b.x, point14b.y, point14b.z);
    vertex(point6b.x, point6b.y, point6b.z);
    
    endShape();
  }
}

// Vector4D class
class Vector4D {
  float x;
  float y;
  float z;
  float w;
  
  Vector4D(float a, float b, float c, float d) {
    x = a;
    y = b;
    z = c;
    w = d;
  }
  
  float getPerspective(float viewDist) {
    return viewDist / (w + viewDist);
  }
  
  Vector4D persProject() {
    float p = getPerspective(300);
    return new Vector4D(p*x, p*y, p*z, 0);
  }
  
  // Method to rotate around XY Plane
  void rotateXY(float a) {
    float ca = cos(a);
    float sa = sin(a);
    
    float tempZ = z * ca - w * sa;
    float tempW = z * sa + w * ca;
    z = tempZ;
    w = tempW;
  }
}






