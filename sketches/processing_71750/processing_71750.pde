
float i = 0;
float theta = 0.0;
float a = 50;
float b = 30;
float c = 1; 
float gamma = -1200;
float angle = 0.01;
float beta = 102;
float sha = 220;
float d = random(50, 100);
PImage eleven;
PImage ten;
PImage nine;
PImage eight;
PImage seven;
PImage six;
PImage five;
PImage four;
PImage three;
PImage two;
PImage one; 

void setup () {
  size(1000, 500, P3D);
  noCursor ();
  
  eleven = loadImage("eleven2.jpg");
  ten = loadImage("ten2.jpg");
  nine = loadImage("nine2.jpg");
  eight = loadImage("eight2.jpg");
  seven = loadImage("seven2.jpg");
  six = loadImage("six2.jpg");
  five = loadImage("five2.jpg");
  four = loadImage("four2.jpg");
  three = loadImage("three2.jpg");
  two = loadImage("two2.jpg");
  one = loadImage("one2.jpg");
    
}

void draw () {
  float delta = i - mouseX;
  background(50);
  smooth();
  
  pushMatrix();
  noStroke();
  PImage bg = loadImage("bg2.jpg");
  tint(random(200, 255), random(255), 0);
  beginShape();
  texture(bg);
  vertex(-1400, -700, -1201, 0, 0);
  vertex(2400, -700, -1201, 900, 0);
  vertex(2400, 1200, -1201, 900, 2000);
  vertex(-1400, 1200, -1201, 0, 2000);
  endShape();
  noTint();
  popMatrix();
  
 


  pushMatrix();
  a = a + 1;
  b = b - .25;
  translate(0, 0, gamma);
  fill(b, 0, a, 0);
  quad(-2000, -1000, -2000, 1500, 1050, sha, 1050, 225);
  if (a>200) a = 50;
  if (b<0) b = 30;
  popMatrix();
  
  noStroke();
  if (mouseX>80) {
  beginShape();
  texture(eleven);
  vertex(0, -20, 0, 10, 10);
  vertex(-900, -555, gamma, 300, 10);
  vertex(-900, 1050, gamma, 600, 500);
  vertex(0, 515, 0, 10, sha);
  endShape();
  }
    
  if (mouseX>150) {
  beginShape();
  texture(ten);
  vertex(42, -15, -100, 100, 100);
  vertex(-500, -400, gamma, 350, 100);
  vertex(-510, 870, gamma, 600, 600);
  vertex(40, 512, -100, 100, 400);
  endShape();
  }
  
  if (mouseX>230) {
  beginShape();
  texture(nine);
  vertex(110, 0, -200, 30, 70);
  vertex(-190, -276, gamma, 400, 30);
  vertex(-190, 745, gamma, 500, 200);
  vertex(108, 492, -200, 50, 500);
  endShape();
  }
 
  if (mouseX>310) {
  beginShape();
  texture(eight);
  vertex(190, 15, -300, 30, 30);
  vertex(60, -170, gamma, 300, 30);
  vertex(60, 640, gamma, 400, 200);
  vertex(190, 475, -300, 30, 500);
  endShape();
  }
  
  if (mouseX>370) {
  beginShape();
  texture(seven);
  vertex(275, 33, -400, 100, 100);
  vertex(200, -110, gamma, 800, 100);
  vertex(210, 572, gamma, 900, 700);
  vertex(275, 450, -400, 100, 700);
  endShape();
  }
  
  if (mouseX>420) {
  beginShape();
  texture(six);
  vertex(330, 40, -500, 50, 120);
  vertex(320, -70, gamma, 700, 50);
  vertex(320, 530, gamma, 600, 800);
  vertex(330, 435, -500, 70, 400);
  endShape();
  }
  
  if (mouseX>480) {
  beginShape();
  texture(five);
  vertex(385, 47, -600, 10, 50);
  vertex(450, -20, gamma, 400, 80);
  vertex(450, 470, gamma, 600, 700);
  vertex(385, 430, -600, 50, 900);
  endShape();
  }


  if (mouseX>550) {
  beginShape();
  texture(four);
  vertex(460, 60, -700, 100, 100);
  vertex(550, 30, gamma, 700, 100);
  vertex(550, 430, gamma, 800, 1000);
  vertex(460, 400, -700, 200, 980);
  endShape();
  }
  
  if (mouseX>640) {
  beginShape();
  texture(three);
  vertex(540, 80, -800, 20, 20);
  vertex(700, 80, gamma, 300, 40);
  vertex(700, 364, gamma, 200, 900);
  vertex(540, 385, -800, 10, 800);
  endShape();
  }

  if (mouseX>740) {
  beginShape();
  texture(two);
  vertex(664, 115, -900, 40, 60);
  vertex(840, 138, gamma, 200, 50);
  vertex(840, 305, gamma, 300, 400);
  vertex(664, 345, -900, 40, 700);
  endShape();
  }

  if (mouseX>860) {
  beginShape();
  texture(one);
  vertex(802, 152, -1000, 70, 0);
  vertex(1050, sha, gamma, 900, 0);
  vertex(1050, 221, gamma, 900, 900);
  vertex(802, 300, -1000, 0, 900);
  endShape();
  }

  directionalLight(beta, beta, beta, 0, 0, -1);
  lightSpecular(204, 204, 204);
  directionalLight(beta, beta, beta, 0, 1, -1);
  lightSpecular(beta, beta, beta);
  //specular(beta, beta, beta);
  
  pushMatrix();
  stroke(0);
  translate(mouseX+20, 225, delta); 
  rotateY(theta);
  fill(30, 0, 250-mouseX/8);
  box(75, 125, 75);
  theta += 0.06;
  popMatrix();

  pushMatrix();
  translate(mouseX+20, 165, delta); 
  rotateY(theta);
  fill(30, 0, 250-mouseX/8);
  box(80, 12, 80);
  popMatrix();

  pushMatrix();
  translate(mouseX+20, 155, delta); 
  rotateY(theta);
  fill(30, 0, 250-mouseX/8);
  box(70, 10, 70);
  popMatrix();
  
  pushMatrix();
  translate(mouseX+20, 290, delta); 
  rotateY(theta);
  fill(30, 0, 250-mouseX/8);
  box(82, 15, 82);
  popMatrix();

  pushMatrix();
  translate(mouseX+20, 150, delta); 
  rotateY(theta);
  fill(30, 0, 250-mouseX/8);
  box(60, 10, 60);
  popMatrix();
  
  pushMatrix();
  translate(mouseX+20, 140, delta); 
  rotateY(theta);
  fill(250);
  box(10, 30, 10);
  popMatrix();

  pushMatrix();
  translate(mouseX+20, 125, delta); 
  rotateY(theta);
  fill(30, 0, 250-mouseX/8);
  box(10, 5, 10);
  popMatrix();

}


