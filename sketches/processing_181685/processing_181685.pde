
//rotating rings timing concept
int d;
float xPos;
float yPos;
color c;
int stkWt;
float rotSpeed;
float rotX;
float rotY;
float rotZ;

color[] colArray = {#E0401C, #E5B051, #272F30, #F7EDB7, #9E2B20};
color col = colArray[int(random(5))];

float startTime = millis();

int rotV = 1;

Ring randRing;
Ring ring1;
Ring ring;
Ring ring2;

boolean f = true;
boolean flag = true;
boolean flag2 = true;

float offset = 1;
float offset2 = 1;

void setup(){
  size(800, 800, P3D);
  smooth();
  randRing = new Ring(int(random(1, 400)), 0.0, 0.0, col, int(random(21)), rotV);	
  ring = new Ring(d, 0.0, 0.0, col, stkWt, 0.0);

  

}


void draw(){
  translate(400, 400);
  background(40);
  noFill();
  //create first ring and slowly accelerate into rotation
  pushMatrix();
  int counter = 1;
  if(millis() > 1000){
  }
  if(millis() > startTime && millis() < startTime + 1000 + (1000/3)){
    
    stroke(colArray[3]);
    stkWt = int(random(0, 21));
    strokeWeight(3);
    ellipse(0, 0, 200, 200);
  } else if(millis() > startTime + 1000 + (1000/3) && millis() < startTime + 1000 +((1000/3)*2)){
    
    stroke(colArray[3]);
    stkWt = int(random(0, 21));
    strokeWeight(5);
    ellipse(0, 0, 400, 400);
  } else if(millis() > startTime + 1000 + (1000/3)*2 && millis() < startTime + 1000+ ((1000/3)*3)){
    rotateY(radians(counter*5));
    stroke(colArray[3]);
    stkWt = int(random(0, 21));
    strokeWeight(8);
    ellipse(0, 0, 300, 300);
  } else if(millis() > startTime + 1000 + (1000/3)*3 && millis() < startTime + 1000 + ((1000/3)*4)){

  }
  
  
  if (flag == true){
    float timeStop1 = millis();
    flag = false;
  }
  if (millis() > startTime + 3300 && offset < 361){ 
    rotateY(radians(offset));
    ring1 = new Ring(400, 0.0, 0.0, col, stkWt, 2);
    ring1.make();
    pushMatrix();
    rotateY(radians(offset * 1.2));
    ring.setSize(300);
    ring.make();
    popMatrix();
  }
  offset = offset + (offset*.01);
  
  if (offset > 361){
    pushMatrix();
    rotateY(radians(offset2));
    rotateX(radians(offset2*1.3));
    stroke(col);
    stkWt = int(random(0, 21));
    strokeWeight(stkWt);
    ellipse(0, 0, 300, 300);
    popMatrix();
    pushMatrix();
    rotateY(radians(offset2/2));
    col = colArray[int(random(5))];
    strokeWeight(int(random(0, 21)));
    ellipse(0, 0, 320, 320);
    popMatrix();
    pushMatrix();
    rotateX(radians(offset2*1.5));
    rotateY(radians(offset2*2));
    stroke(colArray[4]);
    ellipse(0, 0, 340, 340);
    popMatrix();
    if (offset2 > 720){
      flag2 = false;
    }
    if (flag2 == false){
      offset = 0;
    } else {
      offset2 = offset2 * 1.01;
    }
  
  }

  
  popMatrix();

  println(startTime);
  counter++;
  
  
}
          
class Ring {
  
  int tD;

  Ring(int tD, float tXPos, float tYPos, color tCol, int tStkWt, float tRotSpeed) {
    d = tD;
    xPos = tXPos;
    yPos = tYPos;
    c = tCol;
    stkWt = tStkWt;
    rotSpeed = tRotSpeed;
  }  

  void generate(){
    d = int(random(400));
    stroke(col);
    strokeWeight(stkWt);
    ellipse(xPos, yPos, d, d);
  }

  void setSize(int setD){
    d = setD;
  }

  void newCol(){
    color col = colArray[int(random(5))];
  }

  void make(){
    stroke(col);
    strokeWeight(stkWt);
    ellipse(xPos, yPos, d, d);
  }
  
  void update(){
    d = int(random(400));
    col = colArray[int(random(5))];
    stkWt = int(random(0, 21));
    rotX++;
    rotY++;
    rotZ++;
  }

  void hide(){
    d = 0;
    stroke(40);
  }
}


