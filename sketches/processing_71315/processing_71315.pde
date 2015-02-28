
class Strawberry {
  //Strawberry images
  PImage straw1 /*straw2*/;
  //color c;
  float xPos;
  float yPos;
  float ySpeed; //speed up and down
  float acc; //gathering speed

  Strawberry(float tempX, float tempY) { //same as class
  //strawberry(float tempYSpeed) { //feeding my donut //to make 1 a different speed
  straw1 = loadImage("straw1.png");
  //straw2 = loadImage("straw2.png");
  


    //c = color(0, 0, 0);
    xPos = random(0, width);
    yPos = height/2;
    ySpeed = 2; //tempYSpeed// take away the # value to change the speed
    acc = random(0.05, 0.3);
  }

  void display() { //can add aggument to change the color
    noStroke();//

   image(straw1, xPos, yPos, 100, 100);
   //image(straw2, xPos, yPos, 50, 50);
 
    }

  void move() {
    ySpeed += acc;
    yPos += ySpeed;
    
    if ((yPos >= height) || (yPos == 0)) {
      ySpeed *= -1;
      
     
      
    }
  }
}




