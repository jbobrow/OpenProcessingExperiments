
int particleCount = 500;
int radius = 800; 
float theta = -PI/2;

//particle
float[] px = new float[particleCount];
float[] py = new float[particleCount];
float[] pw = new float[particleCount];
float[] ph = new float[particleCount];
float[] rad = new float[particleCount];
float[] spdX = new float[particleCount];
float[] spdY = new float[particleCount];
float[] gravity = new float[particleCount];

void setup() {

  size(800, 800);
  background(225);
  bgColor();


  for ( int i=0; i<particleCount; i+=1) {
    px[i] = random(110, 475);
    py[i] = 0;

    pw[i] = 8;
    ph[i] = 8;
    rad[i] = pw[i]/2;

    spdX[i] = random(-3.5, 3.5);
    spdY[i] = random(-2.4, 2.4);
    gravity[i] = .05;
  }
}

void draw() {
  
 // bgColor(); - runs too slow if I put it in draw

  //snowglobe circle
  fill(255);
  pushMatrix();
   translate(400, 400);
   ellipse(0, 0, 710, 690);
   popMatrix();

   //inside snowglobe
  //trees
  fill(3,57,4);
  tree3(225,150);
  tree3(350,150);
  tree3(300,150);
  tree3(150,150);
  tree(170,150);
  tree(200,150);
  tree2(290,150);
  tree2(180,150);
  tree2(325,150);
  tree2(450,150);
  tree2(550,150);
  tree2(250,150);
  tree3(610,150);
  tree3(590,140);
  tree2(575,120);
  tree(600,150);
  tree3(480,150);
  tree(430,150);
  tree(470,150);
  tree(390,150);
 
 //house
 house(150,150);
 house(400,150);
 
  pushMatrix();
  translate(150, 150); 
  particles();
  popMatrix();
  
  
  
  fill(157,106,108);
  //snowglobe stand
  beginShape();
  vertex(0,800);
  vertex(152,650);
  vertex(647,650);
  vertex(800,800);
  endShape(CLOSE);
}

void particles() {

  fill(255);
  for ( int i=0; i<particleCount; i+=1) {
    ellipse(px[i], py[i], pw[i], ph[i]);

    px[i] += spdX[i];
    py[i] += spdY[i];
    spdY[i] += gravity[i];

    if (px[i] > 500-rad[i]) {
      px[i] = 500-rad[i];
      spdX[i] *= -1;
    }

    if (px[i] < rad[i]) {
      px[i] = rad[i];
      spdX[i] *= -1;
    }

    if (py[i] > 500-rad[i]) {
      py[i] = 500-rad[i];
      spdY[i] *= -1;
    }

    if (py[i] < rad[i]) {
      py[i] = rad[i];
      spdY[i] *= -1;
    }
  }
}

void tree(int x, int y){
  //medium
  pushMatrix();
  translate(x, y);
  triangle(0,550,30,550,15,320);
  popMatrix();
}

void tree2(int x, int y){
  //small
  pushMatrix();
  translate(x, y);
  triangle(0,550,34,550,17,350);
  popMatrix();
}

void tree3(int x, int y){
  //large
  pushMatrix();
  translate(x, y);
  triangle(0,550,40,550,20,250);
  popMatrix();
}

void house(int x, int y){
  pushMatrix();
  translate(x,y);
  fill(72,1,18);
  rect(100,430,70,70);
  triangle(90,430,180,430,135,355);
  popMatrix();

}

