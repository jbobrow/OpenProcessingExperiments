
Human newPerson;

crowdLeft newCrowd1;
crowdLeft newCrowd2;
crowdLeft newCrowd3;
crowdLeft newCrowd4;

crowdRight newCrowdR1;
crowdRight newCrowdR2;
crowdRight newCrowdR3;
crowdRight newCrowdR4;

carLeft newCarL1;

carRight newCarR1;

void setup() {
  size(400,200);
  smooth();
  fill(255);
  frameRate(10);
  
  newPerson = new Human(150,150);
  
  newCrowd1 = new crowdLeft(80,150,2);
  newCrowd2 = new crowdLeft(50,150,3);
  newCrowd3 = new crowdLeft(20,150,1);
  newCrowd4 = new crowdLeft(40,150,4);
  
  newCrowdR1 = new crowdRight(380,150,2);
  newCrowdR2 = new crowdRight(350,150,3);
  newCrowdR3 = new crowdRight(320,150,1);
  newCrowdR4 = new crowdRight(340,150,4);
  
  newCarL1 = new carLeft(120,0,3);
  newCarR1 = new carRight(220,200,3);
  
}

void draw() {
  background(255);
  
  //background
  noStroke();
  fill(140);
  rect(0,0, 100, height);
  rect(300,0, 100, height);
  fill(20);
  rect(100,0,200,height);
  fill(255,255,0);
  rect(195,10,10,20);
  rect(195,50,10,20);
  rect(195,90,10,20);
  rect(195,130,10,20);
  rect(195,170,10,20);
    
  newCrowd1.display2();
  newCrowd2.display2();
  newCrowd3.display2();
  newCrowd4.display2();
    
  newCrowdR1.display3();
  newCrowdR2.display3();
  newCrowdR3.display3();
  newCrowdR4.display3();
    
  newCrowd1.moveCrowdLeft();
  newCrowd2.moveCrowdLeft();
  newCrowd3.moveCrowdLeft();
  newCrowd4.moveCrowdLeft();
    
  newCrowdR1.moveCrowdRight();
  newCrowdR2.moveCrowdRight();
  newCrowdR3.moveCrowdRight();
  newCrowdR4.moveCrowdRight();
  
  newCarL1.display();
  newCarR1.display();
  
  newCarL1.move();
  newCarR1.move();
  
  newPerson.display1();
}

void keyPressed() {
  if(key == 'd'){
    newPerson.moveRight();
  }  

if(key == 'a'){
    newPerson.moveLeft();
  }  

if(key == 'w'){
    newPerson.moveUp();
  }

if(key == 's'){
    newPerson.moveDown();
  }
}




class Human{
  
  float rightArmX1,rightArmY1;
  
  Human(float xpos, float ypos){
    rightArmX1 = xpos;
    rightArmY1 = ypos;
  }
  
  void display1(){
    stroke(0,0,255);
    fill(0,0,255);
    ellipse(rightArmX1, rightArmY1-10, 20, 20);
    
    line(rightArmX1,rightArmY1,rightArmX1+10,rightArmY1+10);
    line(rightArmX1,rightArmY1,rightArmX1-10,rightArmY1+10);
    
    line(rightArmX1,rightArmY1+30,rightArmX1+10,rightArmY1+40);
    line(rightArmX1,rightArmY1+30,rightArmX1-10,rightArmY1+40);
    
    line(rightArmX1,rightArmY1,rightArmX1,rightArmY1+30);
  }
  
  void moveRight(){
    stroke(0,0,255);
    line(rightArmX1+10,rightArmY1+10,rightArmX1+15,rightArmY1+5);    
    line(rightArmX1-10,rightArmY1+10,rightArmX1-5,rightArmY1+15);
    
    rightArmX1++;
  }
  
  void moveLeft(){
    stroke(0,0,255);
    line(rightArmX1+10,rightArmY1+10,rightArmX1+5,rightArmY1+15);
    line(rightArmX1-10,rightArmY1+10,rightArmX1-15,rightArmY1+5);
    
    rightArmX1--;
  }
  
  void moveUp(){
    stroke(0,0,255);
    line(rightArmX1+10,rightArmY1+10,rightArmX1+10,rightArmY1+15);
    line(rightArmX1-10,rightArmY1+10,rightArmX1-10,rightArmY1+5);
    
    rightArmY1--;
  }
  
  void moveDown(){
    stroke(0,0,255);
    line(rightArmX1+10,rightArmY1+10,rightArmX1+10,rightArmY1+5);    
    line(rightArmX1-10,rightArmY1+10,rightArmX1-10,rightArmY1+15);
    
    rightArmY1++;
    }   
  
}




class carLeft{
  
  float xpos, ypos, speed;
  
  carLeft(float x, float y, float s){
    xpos = x;
    ypos = y;
    speed = s;
  }
  
  void display(){
    rect(xpos,ypos, 50, 60);
  }
  
  void move(){
    ypos++;
    if (ypos >= height){
      ypos = 0; 
    } 
  }
  
}



class carRight{
  
  float xpos, ypos, speed;
  
  carRight(float x, float y, float s){
    xpos = x;
    ypos = y;
    speed = s;
  }
  
  void display(){
    rect(xpos,ypos, 50, 60);
  }
  
  void move(){
    ypos--;
    if (ypos <= 0){
      ypos = height; 
    } 
  }
  
}




class crowdLeft{
  
  float rightArmX1,rightArmY1, speed;
  
  crowdLeft(float xpos, float ypos, float s){
    rightArmX1 = xpos;
    rightArmY1 = ypos;
    speed = s;
  }
  
  void display2(){
    stroke(255);
    fill(255);
    ellipse(rightArmX1, rightArmY1-10, 20, 20);
    
    line(rightArmX1,rightArmY1,rightArmX1+10,rightArmY1+10);
    line(rightArmX1,rightArmY1,rightArmX1-10,rightArmY1+10);
    
    line(rightArmX1,rightArmY1+30,rightArmX1+10,rightArmY1+40);
    line(rightArmX1,rightArmY1+30,rightArmX1-10,rightArmY1+40);
    
    line(rightArmX1,rightArmY1,rightArmX1,rightArmY1+30);
    
    line(rightArmX1+10,rightArmY1+10,rightArmX1+10,rightArmY1+15);
    line(rightArmX1-10,rightArmY1+10,rightArmX1-10,rightArmY1+5);
  }
  
  void moveCrowdLeft(){
    rightArmY1 -= speed;
    if (rightArmY1+30 <= 0){
      rightArmY1 = height;
    }
  }
  
}





class crowdRight{
  
  float rightArmX1,rightArmY1, speed;
  
  crowdRight(float xpos, float ypos, float s){
    rightArmX1 = xpos;
    rightArmY1 = ypos;
    speed = s;
  }
  
  void display3(){
    stroke(255);
    fill(255);
    ellipse(rightArmX1, rightArmY1-10, 20, 20);
    
    line(rightArmX1,rightArmY1,rightArmX1+10,rightArmY1+10);
    line(rightArmX1,rightArmY1,rightArmX1-10,rightArmY1+10);
    
    line(rightArmX1,rightArmY1+30,rightArmX1+10,rightArmY1+40);
    line(rightArmX1,rightArmY1+30,rightArmX1-10,rightArmY1+40);
    
    line(rightArmX1,rightArmY1,rightArmX1,rightArmY1+30);
    
    line(rightArmX1+10,rightArmY1+10,rightArmX1+10,rightArmY1+5);    
    line(rightArmX1-10,rightArmY1+10,rightArmX1-10,rightArmY1+15);
  }
  
  void moveCrowdRight(){
    rightArmY1 += speed;
    if (rightArmY1+30 >= height){
      rightArmY1 = 0;
    }
  }
  
}

