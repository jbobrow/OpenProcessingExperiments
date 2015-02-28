
void setup() {
  size(800, 800, P3D); 
  background (0);
  smooth ();

}

void draw() {
  stroke(random(255),random(255),random(255));
    translate(random(800), mouseX, random(300));
  rotateX(mouseY * 0.01);
  rotateY(mouseX * 0.90);
  fill(random(205));
  sphereDetail(mouseX / 100);
  sphere(1);
  
 
  stroke(0);
  translate(random(100), random(100), random(100));
  rotateX(random(100) * 0.10);
  rotateY(random(400) * 0.80);
  fill(random(255),random(255),mouseY);
  ambientLight(102, random(255), 102);
lightSpecular(random(255), random(255), random(255)); 
directionalLight(random(255), mouseY, mouseX, random(255), 0, -1); 
specular(random(255), random(255), random(255)); 
shininess(random(255)); 

  sphereDetail(mouseX / 120);
  sphere(random(30));
  
  stroke(random(255));
  line(random(1800),random(1800),random(1800),random(1800));
   line(random(1800),random(1800),random(1800),random(1800));
    line(random(1800),random(1800),random(1800),random(1800));
  curve(random(25), random(5), random(4), random(10), random(10), random(10), random(10), random(20));
  stroke(250,random(65),4);
    line(random(1800),random(1800),random(1800),random(1800));
     stroke(155,255,random(200));
    line(random(4800),random(18550),random(5800),random(2800));
}



