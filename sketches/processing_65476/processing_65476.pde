
float a;                          // Angle of rotation
float offset = PI/1.5;             // Angle offset between boxes
int num = 20;                     // Number of boxes
color[] colors = new color[num];  // Colors of each box
color safecolor;

boolean pink = true;

void setup() { 
  size(500, 500, P3D);
  stroke(0,0,255,40);  
  for(int i=0; i<num; i++) {
    colors[i] = color(0,0,255 * (i+1)/num,50);
  }
   for(int j=0; j<num; j++) {
    colors[j] = color(0,0,255 * (j+1)/num);
  }
   for(int k=0; k<num; k++) {
    colors[k] = color(0,0,255 * (k+1)/num,30);
  }
  
  lights();
} 
 

void draw() {     
  background(0, 0, 0);
    camera(mouseX/2,mouseY/3, -300, mouseX/2, mouseY/3,0, -1, -0.5, -1);
  translate(width/4, height/6);
  a += 0.05;   
  
  for(int i = 0; i < num; i++) {
    pushMatrix();
    fill(colors[i]);
    rotateY(a/9 + offset*i);
    rotateX(a/3 + offset*i);
     rotateZ(a/5 + offset*i);
    box(i*10);
    popMatrix();
  }
  
translate(width/6, height/6);
     
  
   for(int j = 0; j < num; j++) {
    pushMatrix();
    fill(colors[j]);
    rotateY(a/5 + offset*j);
    rotateX(a/6 + offset*j);
      rotateZ(a/5 + offset*j);
    box(j*3);
    popMatrix();
  }
  
  translate(width/5, height/5);
    
  
   for(int k = 0; k < num; k++) {
    pushMatrix();
    fill(colors[k]);
    rotateY(a/15 + offset*k);
    rotateX(a/2 + offset*k);
      rotateZ(a/5 + offset*k);
    box(80);
    popMatrix();
  }
} 


