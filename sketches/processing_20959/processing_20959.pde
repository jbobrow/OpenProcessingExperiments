
//Adam Oaks


void setup() {
  size(400,400,P3D);
}

float cameraX, cameraY;

void draw() {

  cameraX = radians(map(mouseX, 0, width, -180, 0));
  cameraY = radians(map(mouseY, 0, height, 180, 0));
  camera(500 * cos(cameraX * 2), 0, 500 * sin(cameraX * 2), width/2, height/2, 0, 0, 1, 0);
  lights();
  noStroke();
  PImage galaxy;
  galaxy = loadImage("galaxy.jpg");
  background(galaxy);

  //sun
  translate(width/2,height/2,0);
  rotateY(frameCount * 0.1);
  fill(255,255,8,99);
  sphere(90);
  fill(255,200,8);
  sphere(80);

  //planet orbit
  noFill();
  stroke(255,80);
  strokeWeight(3);
  rotateX(radians(90));
  ellipse(0,0,300,300);

  //planet
  fill(89,132,189);
  noStroke();
  translate(150,0,0);
  rotateY(frameCount * 0.1); 
  sphere(15);

  //moon orbit
  noFill();
  stroke(255,80);
  strokeWeight(3);
  rotateZ(radians(0));
  ellipse(0,0,60,60);

  //moon
  fill(204,204,153);
  noStroke();
  rotateZ(frameCount * -0.4);
  translate(30,0,0);
  sphere(8);
}


