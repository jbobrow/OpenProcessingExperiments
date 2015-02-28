
void setup(){
  size(400,400,P3D);
}
int n=0;
int m=0;
float cameraX, cameraY;
void draw() {

  background(0,10);

  //translate the coordinates
  translate(width/2,height/2,0);
  //camera
  cameraX = radians(map(mouseX, 0, width, 238, 145));
  cameraY = radians(map(mouseY, 0, height, 145, 190));
  camera(450 * cos(cameraX * 1),-60,450 * sin(cameraY * 1),0,0,0,1,1,-1);
  //sun
  noStroke();
  rotateY(n*-PI/6*0.05);
  fill(255,150,10,0);
  sphere(1);
  //earth path
  stroke(0);
  strokeWeight(5);
  noFill();
  rotateX(-PI/3);
  ellipse(0,0,2*width/3,2*width/3);
  n++;
  //earth
  noStroke();
  fill(0);
  translate(width/3,0,0);
  rotateZ(m*-PI/6*0.05);
  //rotateZ(radians(m));
  //translate(30,height/2, 30);
  sphere(6);
  m+=6;
  //moon path
  stroke(0);
  strokeWeight(1);
  noFill();
  rotateX(-PI/8);
  ellipse(0,0,2*width/13,2*width/13);
  //moon
  noStroke();
  fill(0);
  translate(width/13,0,0);
  sphere(2);
}

                
                                                                                
