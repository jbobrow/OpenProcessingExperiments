



void setup(){
 size (800,600, P3D);
 background(255);
smooth(); 
colorMode(RGB, 1);

  
}


void draw (){
translate (random(width), height/10);

;pushMatrix();
translate(random(130), random(height), 0);
 lightSpecular(random(1), random(1), 0);
  directionalLight(0.8, 0.8, 0.8, 0, 0, -1);
  float s = random(90)/ random(255);
  specular(s, s, s);
rotateY(1.25);
rotateX(-0.4);
box(100);
popMatrix();

rotate(90);
translate (random(width), -height/10);

  
}

