


void setup (){size(800, 500, P3D);
 background (0);}

void draw (){
 
//rect (0,0,800,500);
noFill();
float fov = PI/3.0;
float cameraZ = (height/2.0) / tan(fov/2.0);
perspective(fov, float(width)/float(height), 
            cameraZ/10.0, cameraZ*10.0);
translate(400, 250, 0);
rotateX(-PI/6);
rotateY(mouseX/5);
rotateZ (29);
stroke (50+mouseY,mouseX,mouseY,mouseX-10);
box(550);

}

//void keyPressed (){
 // saveFrame ("1.jpg");}

void mousePressed (){
  background (0);
}
 
  

