


void setup (){size(800, 500, P3D);
background (0);


}

void draw (){
  
  noFill();
float fov = PI/3.0;
float cameraZ = (height/2.0) / tan(fov/2.0);
perspective(fov, float(width)/float(height), 
            cameraZ/10.0, cameraZ*10.0);
translate(400, 250, 0);
rotateX(-PI/6);
rotateY(mouseY);
rotateZ (45);
//fill (mouseX-3,mouseX);
smooth ();
stroke (mouseY-2,mouseX+10);
strokeWeight (mouseY/8);
box(250);
noFill();

}
void mousePressed () {
  background (0);
  
}
//void keyPressed (){
 // saveFrame ("1.JPG");
//}

