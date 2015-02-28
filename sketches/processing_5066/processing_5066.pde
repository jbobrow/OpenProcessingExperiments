

/*
Black&Pink Playground
veronyu@hotmail.com
September, 2009

*/

void setup(){
  size(1000, 1000,P3D);
  background(40);
 
};

void draw() {
  background(255);
  noStroke();
  lights();
  
  
  translate(width/2, height/2);
  
  rotateX((float)mouseX/width*(PI * 2));
  rotateY((float)mouseY/width*(PI * 2));
  fill(0);
  box(0);
  
  pushMatrix();

 
  translate(80,0);
  box(0);
  
  popMatrix();
  
  pushMatrix();
  

  translate(-150,0);
  fill(255,100,100);
  box(200);
  
  popMatrix();
  
  pushMatrix();
  translate(-40,0);
  fill(0);
  sphere(40); 
  
  popMatrix();
  
  
  pushMatrix();
  
  
  translate(160,0);
  fill(0);
  sphere(40); 
  
  popMatrix();
  
  
  pushMatrix();
  
 
  translate(0,0,-160);
  fill(0);
  sphere(40);
  
  popMatrix();
  
   pushMatrix();
  
 
  translate(0,-160,0);
  fill(0);
  sphere(40);
  
  popMatrix();
 
  pushMatrix();
  
 
  translate(100,0,-160);
  fill(0);
  sphere(40);
  
  popMatrix();
  
   pushMatrix();
  
 
  translate(50,0,-160);
  fill(0);
  sphere(40);
  
  popMatrix();
  
   pushMatrix();
  
 
  translate(200,0,-160);
  fill(0);
  sphere(40);
  
  popMatrix();
  
   pushMatrix();
  
 
  translate(150,0,-160);
  fill(0);
  sphere(40);
  
  popMatrix();
  
   pushMatrix();
  
 
  translate(250,0,-160);
  fill(0);
  sphere(40);
  
  popMatrix();
  
   pushMatrix();
  
 
  translate(300,0,-160);
  fill(0);
  sphere(40);
  
  popMatrix();
  
   pushMatrix();
  
 
  translate(350,0,-160);
  fill(0);
  sphere(40);
  
  popMatrix();
  
   pushMatrix();
  
 
  translate(400,0,-160);
  fill(0);
  sphere(40);
  
  popMatrix();
  
  
  
   pushMatrix();
  translate(0,0, 150);
  fill(0);
  box(40); 
  
  popMatrix();
  
  pushMatrix();
  translate(0,-50,150);
  fill(0);
  box(40); 
  
  popMatrix();
  
  
   pushMatrix();
  
  //Draw a blue sphere
  translate(0,-100, 150);//150 is the z-value, the first two values are x and y
  fill(0);
  box(40); //the value is the radius of the sphere
  
  popMatrix();
  
  
   pushMatrix();
  
  translate(0,-150, 150);
  fill(0);
  box(40); 
  
  popMatrix();
  
  
   pushMatrix();
  
  
  translate(0,-200, 150);
  fill(0);
  box(40); 
  
  popMatrix();
  
  
   pushMatrix();
  
  
  translate(0,-50, 150);
  fill(0);
  box(40); 
  
  popMatrix();
  
  pushMatrix();
  
  
  translate(0,-100, 150);
  fill(0);
  box(40); 
  
  popMatrix();
  
    pushMatrix();
  
  
  translate(0,-150, 150);
  fill(0);
  box(40); 
  
  popMatrix();
  
  
  
  
  pushMatrix();
  
  
  
  translate(-50,-200, 150);
  fill(0);
  box(40); 
  
  popMatrix();
  
  pushMatrix();
  
  
  translate(-100,-200, 150);
  fill(0);
  box(40); 
  
  popMatrix();
  
  pushMatrix();
  
  
  translate(-150,-200, 150);
  fill(0);
  box(40); 
  
  popMatrix();
  
  pushMatrix();
  
  
  translate(-200,-200, 150);
  fill(0);
  box(40); 
  
  popMatrix();
  
  pushMatrix();
  
  
  translate(-200,-200, 200);
  fill(0);
  box(40); 
  
  popMatrix();
  
  pushMatrix();
  
  
  translate(-200,-200, 150);
  fill(0);
  box(40); 
  
  popMatrix();
  
  pushMatrix();
  
  
  translate(-200,-200, 100);
  fill(0);
  box(40); 
  
  popMatrix();
  
  pushMatrix();
  
  
  translate(-200,-200, 50);
  fill(0);
  box(40); 
  
  popMatrix();
  
  pushMatrix();
  
  
  translate(-200,-200, 0);
  fill(0);
  box(40); 
  
  popMatrix();
  
  pushMatrix();
  
  
  translate(-200,-150, 150);
  fill(0);
  box(40); 
  
  popMatrix();
  
  pushMatrix();
  
  
  translate(-200,-100, 150);
  fill(0);
  box(40); 
  
  popMatrix();
  
  pushMatrix();
  
  
  translate(-200,-50, 150);
  fill(0);
  box(40); 
  
  popMatrix();
  
  pushMatrix();
  
  
  translate(-200,0, 150);
  fill(0);
  box(40); 
  
  popMatrix();
  
  
  
};








