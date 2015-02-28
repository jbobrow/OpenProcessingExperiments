
PImage img;
void setup(){
  size(400,400,P3D);
}
int n=0;
int m=0;
float cameraX, cameraY;
void draw() {
  img=loadImage("star.jpg");
  background(img);
  lights();
  //translate the coordinates
  translate(width/2,height/2,0);
  //camera
  cameraX = radians(map(mouseX, 0, width, 180, 45));
  cameraY = radians(map(mouseY, 0, height, 45, 180));
  camera(500 * cos(cameraX * 2),-100,500 * sin(cameraY * 2),0,0,0,1,1,-1);
  //sun
  noStroke();
  rotateY(n*-PI/6*0.05);
  fill(255,150,10);
  sphere(50);
  //earth path
  stroke(255,255,10,50);
  strokeWeight(5);
  noFill();
  rotateX(-PI/2);
  ellipse(0,0,2*width/3,2*width/3);
  n++;
  //earth
  noStroke();
  fill(10,150,255);
  translate(width/3,0,0);
  rotateZ(m*-PI/6*0.05);
  //rotateZ(radians(m));
  //translate(30,height/2, 30);
  sphere(10);
  m+=5;
  //moon path
  stroke(255,255,150,50);
  strokeWeight(2);
  noFill();
  rotateX(-PI/8);
  ellipse(0,0,2*width/13,2*width/13);
  //moon
  noStroke();
  fill(200,200,150);
  translate(width/13,0,0);
  sphere(5);
}

