
float x;
float y;
float dx;
float dy;
float targetX, targetY;
float easing = 0.05;

float sphSize=1;


void setup(){
size(800, 800, P3D);
frameRate(600);
noStroke();
background(0);
//camera(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 
       //0.0, 1.0, 0.0);
}


void draw(){
  
  
 if (sphSize>=20){
    sphSize=0;
  }  
 
//background(0);
pointLight(mouseX/2, 125, 126, 35, 40, 15);
//ambientLight(102, 102, 102);

fill(100,targetY/5, targetX/5,100);

//ambientLight(102, 102, 102);
lightSpecular(204, 204, 204); 
directionalLight(targetX, targetY, 0, 0, 0, -1); 
specular(255, 255,255); 
translate(x, y, sphSize);
shininess(7.0); 
sphere(mouseY/10);


targetX = mouseX;
  float dx = targetX - x;
  if(abs(dx) > 1) {
    x += dx * easing;
  }
  
  targetY = mouseY;
  float dy = targetY - y;
  if(abs(dy) > 1) {
    y += dy * easing;
  }
  
  //sphSize+=0.05;
}
void mouseClicked(){
    sphSize=0;
  }
  

  





