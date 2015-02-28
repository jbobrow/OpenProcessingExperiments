
//import processing.opengl.*;
float theta = 0.0;
PImage bg;
PImage vig;

float x = random(360);
float y = random(360);
float z = random(360);
float s = random(40, 120);


void setup() {
  size(800, 800, P3D);

  drawBG();
}


void draw () {
  frameRate(10);

  if (mousePressed == true) {
    s = random(30, 120);
    x = random(360);
    y = random(360);
    z = random(360);
    
    drawBG();
  }

  smooth();
  noStroke();
  lights();
  pointLight(0, 500, 255, 0, 0, 10);
  pointLight(x, y, z, 800, 0, 10);

  drawSphere();
}

void drawSphere() {


  float fC = frameCount;

  //move to center
  translate(width/2, width/2, 0);

  for (int i = 10; i<s; i++) {

    pushMatrix();
    rotateX(radians(x*frameCount));
    rotateY(radians(y*noise(200))+fC);
    rotateZ(radians(z*noise(300))+fC);
    translate(0, 0, 300-i);

    fill(random(90, 255), random(150, 200), random(100, 150), random(10, 100));
    lightSpecular(204, 204, 204); 
    shininess(50);
    specular(0, 255, 0);
    pushMatrix();
    scale(i/s);
    scale(.7);
    customShape();
    popMatrix();
    popMatrix();

    for (int j = 10; j<15; j++) {
      pushMatrix();
      rotateX(radians(x*frameCount));
      rotateY(radians(y*noise(200))+fC);
      rotateZ(radians(z*noise(300))+fC);
      translate(0, 0, i+100);
      noStroke();
      lightSpecular(204, 204, 204); 
      shininess(50);
      specular(0, 255, 0);  
      fill(random(200, 255), random(100, 255), random(1, 150), 0+j);
      ellipse(0, 0, 10, 10);
      popMatrix();
    }
  }
}

void drawBG() {
  bg = loadImage("BG.png");
  background(70);
  pushMatrix();
  translate(0, 0, -800);
  imageMode(CENTER);
  image(bg, width/2, height/2, width*2.5, height*2.5);
  popMatrix();
}

void vignette() {
  vig = loadImage("vig.png");
  pushMatrix();
  translate(0, 0, 0);
  imageMode(CENTER);
  image(vig, 0, 0);
  image(vig, width/2, height/2, width*2.5, height*2.5);
  popMatrix();
}


void customShape () {
  beginShape();
noStroke();
fill(random(90, 255), random(150, 200), random(100, 150), random(10, 100));
vertex(51.7,0);
vertex(56.5,-12.1);
vertex(31.7,-55);
vertex(14,-55);
vertex(0,-41.4);
vertex(-14,-55);
vertex(-31.7,-55);
vertex(-56.5,-12.1);
vertex(-51.7,0);
vertex(-56.5,12.1);
vertex(-31.7,55);
vertex(-14,55);
vertex(0,41.4);
vertex(14,55);
vertex(31.7,55);
vertex(56.5,12.1);
vertex(51.7,0);
endShape(CLOSE);
  
}

