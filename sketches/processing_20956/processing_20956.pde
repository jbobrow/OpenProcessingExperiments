
PImage img;

void setup(){
  size(700,700,P3D);
  noStroke();
  img = loadImage("Stars.jpg");
  camera(height/4, 0, 500, height/2, height/2 , 0, 0, 1, 0);
  
}

int y = 0;


void draw (){ 
background(img);

// Binary Stars
pushMatrix();
lights();

  translate(height/2,height/5);
  rotateY(y*PI/40);
  translate(-height/12,height/4,0);
  
  fill(252,131,0);
  sphere(50); 
  popMatrix();
 
  pushMatrix();
  lights();

  translate(height/2,height/5);
  rotateY(y*PI/40);
  translate(height/12,height/4,0);
 
  fill(252,131,0);
  sphere(50);
  

  popMatrix();
  
  // Planet
  
  
  pushMatrix();
  lights();
  translate(height/3,height/8,25);
  rotateY(y*PI/200);
  translate(-height/6,height/4,0);
  rotateX(y*PI/200);
  translate(height/6,height/4,0);
 
  fill(0,11,252);
  sphere(20);
  
  // Moon
  rotateY(y*PI/25);
  translate(30,0,0);
  
  fill(100);
  sphere(5);
  popMatrix();
  
  // Ringed Planet
  pushMatrix();
  
  lights();
  translate(height/2,height/6,25);
  rotateY(y*PI/200);
  translate(height/4,height/4,25);
  rotateX(y*PI/150);
  translate(height/6,height/10);
  
  fill(255,28,28);
  sphere(30);
  fill(50,95);
  rotateZ(PI/3);
  ellipse(0,0,150,150);
  
  //Comets
  for(int k = 20; k < 30; k++){
 
  rotate(y*PI/200);
  translate(k*10,0,0);
  fill(100);
  sphere(2);
  }
 
  popMatrix();  
y++;
  }  



