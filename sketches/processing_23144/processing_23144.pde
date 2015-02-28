

int a=10;
void setup (){size(800, 500, P3D);
background (0);
}

void draw (){
  noFill();
  stroke (a,a,a,a);
float fov = PI/3.0;
float cameraZ = (height/2.0) / tan(fov/2.0);
perspective(fov, float(width)/float(height), 
            cameraZ/10.0, cameraZ*10.0);
translate(mouseX, mouseY, mouseX/2);
rotateX(-PI/6);
rotateY(PI/3);
box(45);
a=a+1;}
void mousePressed (){
  a=20;}
  void keyPressed (){
  background (0);}

