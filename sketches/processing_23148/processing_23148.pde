


void setup (){size(1000, 800, P3D);
 background (0);}

void draw (){
 
//rect (0,0,800,500);
noFill();
float fov = PI/3.0;
float cameraZ = (height/2.0) / tan(fov/2.0);
perspective(fov, float(width)/float(height), 
            cameraZ/10.0, cameraZ*10.0);
translate(mouseX, mouseY, mouseY);
rotateX(10);
rotateY(100);
rotateZ (29);
stroke (100+mouseY,mouseX+10,mouseY+20,mouseX-30);
//strokeWeight (mouseY/20);
//box(200);
line (0,0,100,100);

}

void keyPressed (){
  //saveFrame ("1,2,3.jpg");
 noLoop ();}

void mousePressed (){
  //background (0);
  loop();
}
 
  

