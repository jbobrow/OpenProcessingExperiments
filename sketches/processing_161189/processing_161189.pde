
int r1 = 0;
int r2 = 0;
int r3 = 0;
int r4 = 0;
int r5 = 0;

void setup() {
  size(500,500);
  frameRate(50);
}

void draw() {
  background(0);
  
  //spaceship
  fill(255);
  ellipse(mouseX,mouseY,random(1,25),random(1,25));
  
  //sun
  translate(width/2, height/2);
  fill(random(200,255),random(200,255),0);
  ellipse(0, 0, 60, 60);
  fill(random(200,255),random(70,125),0);
  ellipse(0, 0, 50, 50);

  //planet 1
  fill(color(random(255),random(255),random(255)) );
  noStroke();
  rotate(radians(++r1));
  ellipse(200,0,20,20);

  //planet 2
  pushMatrix();
    fill(color(random(255),random(255),random(255)) );
    translate(50, 100);
    rotate(radians(++r2));
    ellipse(34, 200, 40, 40);
  popMatrix();
  
  //rotating earth
  pushMatrix();
  fill(#2460FF,random(200,255));
  translate(110,100);
  rotate(radians(++r3));
  ellipse(0, 0, 50, 50);
  
  noStroke();
  fill(27,188,54,random(200,255));
  beginShape();
  curveVertex(0,-25);
  curveVertex(0,-25);
  curveVertex(-1,-15);
  curveVertex(9,-9);
  curveVertex(20,0);
  curveVertex(25,0);
  curveVertex(25,0);
  vertex(25,0);
  curveVertex(25,0);
  curveVertex(25,0);
  curveVertex(21,-12.5);
  curveVertex(17,-17);
  curveVertex(12.5,-21);
  curveVertex(0,-25);
  curveVertex(0,-25);
  endShape();
  
  beginShape();
  curveVertex(-10,4);
  curveVertex(-14,-7);
  curveVertex(-20,0);
  curveVertex(-20,6);
  curveVertex(-13,13);
  curveVertex(-5,20);
  curveVertex(2,17);
  curveVertex(3,14);
  curveVertex(-1,3);
  curveVertex(-10,4);
  endShape();
  popMatrix();

  //planet 3
  fill(random(255),random(255),random(255) );
  translate(20, 200);
  rotate(radians(++r4));
  ellipse(20, 0, 20, 20);    
  translate(20, 20);
  ellipse(5, 5, 8,8);
  ellipse(10,25, 10,10);
  ellipse(40,2, 5,5);

  //planet 4
  fill(random(255),random(255),random(255),190);
  translate(200, 200);
  rotate(radians(++r5));
  ellipse(60, 100, 30, 30);

  //line
  fill(255);
  translate(100, 50);
  ellipse(0, 0, 5,5);
  ellipse(100,100, 5,5);
  ellipse(200,200, 5,5);
  ellipse(300,300, 5,5);
  ellipse(400,400, 5,5);
}



