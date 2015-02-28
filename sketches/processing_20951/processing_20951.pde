
void setup(){
  size(400,400,P3D);
}

float cameraX, cameraY;

void draw(){
   PImage img ;
  img = loadImage("1.jpg");
  background( img );
  lights();
  translate(width/2,height/2,0);
  fill(250,250,100);
  sphere(60);
  rotateX(-PI/2);
  noFill();
  stroke(200,90);
  strokeWeight(5);
  ellipse(0,0,400,400);

  pushMatrix();
  noStroke();
  rotateZ(frameCount*-PI/6*0.05);
  translate(200,0,0);
  fill(100,150,200);
  sphere(30);
   
  rotateZ(frameCount*-PI*0.05);
  translate(50,0,0);
  noStroke();
  fill(200,200,100);
  sphere(10);
  popMatrix();


cameraX = radians(map(mouseX, 0, width, -135, 45));
  cameraY = radians(map(mouseY, 0, height, 180, 0));
  
  println(cos(cameraX));
  
  camera(500 * cos(cameraX * 2), 0, 500 * sin(cameraX * 2), width/2, height/2, 0, 0, 1, 0);

 
}

