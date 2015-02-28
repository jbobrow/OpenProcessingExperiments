
void setup() {
size(750,500,P3D);
background(200,0,0);
smooth();
}

float w = 100;
float l = 100;
float h = 100;

void draw() {
  
  translate (300,200,0);
  background(200,0,0);
  
    for(int i = 0; i<200; i++) {
      box(w,l,h);
      scale (0.9);
      rotateZ(radians(10+(mouseY*2/75)));
      translate(50,0,0);   
  }
  
  
   for(int i = 0; i<200; i++) {
      box(w,l,h);
      scale (0.9);
      rotateZ(radians(10+(mouseY*2/75)));
      translate(50,0,0);   
  }
 
}
