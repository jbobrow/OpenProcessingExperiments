
int eventTime = 5000;
float timePassed; 
float py, px, vx, vy;
int fill1, fill2, fill3;
int fill4, fill5, fill6;
int[] justice1 = new int[50];
int[] justice2 = new int[50];
int[] justiceX = new int[50];
int[] justiceY = new int[50];
int height1, height2, height3, height4, height5, height6;

 
void setup(){
  size(400,400);
  smooth();
  for(int i = 0; i < 50; i++){
    justice1[i] = -5;
    justice2[i] = -5;
  }
  fuse(); 
}
 
void draw(){
  background(255);
  
  noStroke();
  fill(fill1, fill2, fill3);
  rect(0,0,400,400);
  
  stroke(0);
  py += vy;
  vy *= 1.01;
  drawShape(px, py);
  
  fill(222, 192, 85);
  for(int i = 0; i < 50; i++){
    justice1[i] += justiceX[i];
    justice2[i] += justiceY[i];
    ellipse(justice1[i], justice2[i], 5, 5); 
  }
  
  noStroke();
  fill(222, 192, 85);
  rect(0,325,400,400);
  stroke(0);
  
  fill(198, 62, 62);
  beginShape();
  stroke(fill4, fill5, fill6);
  strokeWeight(2);
  vertex(175, 325);
  vertex(170, 310 - height1);
  vertex(185, 310 - height2);
  vertex(195, 310 - height3);
  vertex(205, 310 - height4);
  vertex(215, 310 - height5);
  vertex(230, 310 - height6);
  vertex(225, 325);
  endShape(CLOSE);
  
  if ((millis() >= eventTime) && (millis() <= eventTime + 20)) {
    event();
  }
  if(millis() >= eventTime){
    event2();
  }
}
 
void mousePressed(){
  eventTime = millis() + 5000;
  fuse();
}

void drawShape(float x, float y){
  noStroke();
  fill(66, 226, 242);
  rect(x - 23, 0, 46, y);
  ellipse(x, y, 47, 46);
  fill(198, 62, 62);
  rect(x - 20, 0, 40, y);
  ellipse(x, y, 41, 40);
}
 
void fuse(){
  px = 200;
  py = 0;
  vy = .25;
  
  for(int i = 0; i < 50; i++){
    justiceX[i] = (int) random(-10, 10);
    justiceY[i] = (int) random(-10, 0);
  }
  
  fill1 = 71;
  fill2 = 155;
  fill3 = 196;
  fill4 = 222;
  fill5 = 192;
  fill6 = 85;
  
  height1 = height2 = height3 = height4 = height5 = height6 = -15;
}
 
void event(){
  fill1 = (int)random(0, 131);
  fill2 = (int)random(0, 131);
  fill3 = (int)random(0, 131);
   
  for(int i = 0; i < 50; i++){
    justice1[i] = 200;
    justice2[i] = 330;
  }
} 
  
void event2(){
  fill4 = 66;
  fill5 = 226;
  fill6 = 242;
  height1 = (int)random(0, 15);
  height2 = (int)random(0, 15);
  height3 = (int)random(0, 15);
  height4 = (int)random(0, 15);
  height5 = (int)random(0, 15);
  height6 = (int)random(0, 15);
}

