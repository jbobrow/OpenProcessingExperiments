


void setup (){size(950, 700, P3D);
 background (0);}

void draw (){
 
//rect (0,0,800,500);
noFill();
float fov = PI/3.0;
float cameraZ = (height/2.0) / tan(fov/2.0);
perspective(fov, float(width)/float(height), 
            cameraZ/10.0, cameraZ*10.0);
translate(mouseX, mouseY, 0);
rotateX(10);
rotateY(100);
rotateZ (29);
stroke (50+mouseY,mouseX,mouseY,mouseX-10);
box(200);

}

//void keyPressed (){
  //saveFrame ("1.jpg");}

void mousePressed (){
  background (0);
}
 
  

