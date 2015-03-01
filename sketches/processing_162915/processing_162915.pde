
float rotateM = 0;
float rotateR;
float rotateL;

float count_1;
float count_2;
float count_3;

float lineAcc;

float dir = 200;
float acc = 1;

void setup(){
  frameRate(500);
  size(595, 742);
  background(255);
  noStroke();
}

void draw() {

 rotateR = random(0,100); 
 lineAcc = random(-2);
 
 rotateM = rotateM + rotateR;
 rotateL = rotateL + 1;
  
 
 dir += acc;
 
 if (count_1%100 == 0) acc = acc * lineAcc;
 
 println("acc: "+acc); 
 println("dir: "+dir);
 
 count_1++;
 
  
 fill(255);
  
 pushMatrix();
  translate(width/2, height/2);
  rotate(radians(rotateL));
  
  stroke(000,000,100,50);
  noFill();

  bezier(dir, dir, dir, 20, 20, 1, 20, 20);
    
 popMatrix(); 
}


void mousePressed(){
  stop();
}
