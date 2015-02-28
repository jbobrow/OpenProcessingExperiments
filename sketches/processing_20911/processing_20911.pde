
PImage img;
void setup(){
  size(400,400,P3D);
  
}

int n=0;
int m=0;
float cameraX, cameraY;

void draw(){
  img=loadImage("images.jpg");
  background(img);
  lights();
  
  cameraX = radians(map(mouseX, 0, width, -135, 45));
  cameraY = radians(map(mouseY, 0, height, 180, 0));

  println(cos(cameraX));

  camera(500 * cos(cameraX * 2), 0, 500 * sin(cameraX * 2), width/2, height/2, 0, 0, 1, 0);

//move origin to center
  translate(width/2,height/2,0);
//orange sun located at the center with radius 25
  pushMatrix();
  noStroke();
  rotateY(n*-PI/6*0.05);
  fill(255,150,10);
  sphere(60);
  popMatrix();
//planet path
  pushMatrix();
  stroke(255,255,10,20);
  strokeWeight(5);
  noFill();
  rotateX(-PI/2);
  ellipse(0,0,2*width/3,2*width/3);
  n++;
  popMatrix();
//planet
  pushMatrix();
  noStroke();
  rotateY(m*-PI/6*0.005);
  fill(10,150,255);
  translate(width/3,0,0);
  sphere(15);
  m+=5;
//orbit
  noStroke();
  fill(200,200,150);
  rotateZ(m*-PI/6*0.05);
  translate(width/13,0,0);
  sphere(5);
  popMatrix();
  
  
  
  /*for(int i = 0; i <200; i++){
    fill(0);
    point(random(0,width), random(0,height), random(0,400));
  }*/
}  

