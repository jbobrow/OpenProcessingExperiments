
import processing.opengl.*;

// pendulem 
float noisy = 0.0;
float noiseScale = .02;
float noiseVal = .02;
float clickRand = 0.0;

float rColorR = random(100, 255);
float rColorG = random(50, 20);
float rColorB = random(100, 150);

PImage bg;


//rotation or tent Y
float rot = 0;


void setup() {
  size(800, 800, OPENGL);
  
}


void draw() {
  frameRate(24);

  smooth();
  bg = loadImage("BG.png");
  background(66,66,66);
  pushMatrix();
  translate(0,0,-800);
  imageMode(CENTER);
  image(bg, width/2, height/2, width*2.5, height*2.5);
  popMatrix();

  lights();
  pointLight(0, 500, 255, 0, 0, 10);


  translate(width/2, height/2, -200);
  //  rotateX(radians(90));

  if (mousePressed == true) {
    rotateX(radians(mouseY));
    rotateY(radians(mouseX));
  }
  rotateX(radians(50));
  starFish(rColorR, rColorG, rColorB);
  rotateZ(radians(15));
//  translate(0, 0, -20);
//  starFish(255, 100, 200);
  translate(0, 0, -40);
  starFish(0, 0, 0);
}

// function to make tentical

void makeTent(float R, float G, float B) {
  float ang = .05;
  for (int i=0; i<60; i++) {
    translate(0, 10, 1);
    ang += mouseX;
    rotateZ(radians(sin(frameCount/2*noise(i))*i)/2);

    translate(0, 0, .5);
    noiseDetail(2, .005);
    rotateZ(radians(noise(clickRand/2)*i));
    rotateY(radians(rot));
    noStroke();
    fill(R, G, B, 100);
    lightSpecular(204, 204, 204); 
    shininess(50);
    specular(0, 255, 0);  
    box(60-i);
  }
}


// calls make tent and rotates it 
void starFish(float R, float G, float B) {
  for (int i=0; i<12; i++) {

    rotateZ(radians(30));
    pushMatrix();

    makeTent(R, G, B);
    popMatrix();
  }
}



// keys to change RGB value to random
void keyPressed() {
  if (keyPressed) {
    if (key == 'R' || key == 'r') {
      rColorR = random(255);
    } 
    else if (key == 'G' || key == 'g') {
      rColorG = random(255);
    } 
    else if (key == 'B' || key == 'b') {
      rColorB = random(255);
    }
    else if (key == 'T' || key == 't') {
      clickRand = random(width);
    }
    if (key == '0') {
      rot = 0;
    } 
    if (key == '1') {
      rot = 10;
    } 
    if (key == '2') {
      rot = 20;
    } 
    if (key == '3') {
      rot = 30;
    } 
    if (key == '4') {
      rot = 40;
    } 
    if (key == '5') {
      rot = 50;
    } 
    if (key == '6') {
      rot = 60;
    } 
    if (key == '7') {
      rot = 70;
    } 
    if (key == '8') {
      rot = 80;
    } 
    if (key == '9') {
      rot = 90;
    }
  }
}


