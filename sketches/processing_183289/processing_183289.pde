
//int x =0;
float speed = (random(.2,3));
float speedY =(random(.2,3));
float w=width;
float h = height;
float balloonX=100;
float balloonY=100;
float balloonW=50; //balloon width
float balloonH = 50; //balloon height


//int getRandomColor() {
//return color(random(110, 255), random(255), random(255));
//}

void setup() {
  size(300, 300);
} 
void draw() {
  background(150);   
  move();
  //lineE=(balloonX+balloonW/3);
  displayHouse();
    if (balloonX < 0) {
    }
    //(balloonX+speed);
    if (balloonX+balloonW/2 > width || balloonX-balloonW/2   < 0) {
      speed = speed * (-1);
    }
        if (balloonY < 0) {
    }

    if (balloonY+balloonH/2 > height || balloonY-balloonH/2  < 0) {
      speedY = speedY * (-1);
    }
  displayBalloon();

  
  //}
  // else if(balloonX>width); 
  //  {(balloonX-1);
  //}
  displayHouse2();
  }



  void displayBalloon() {
    int c = color(200, 10, 110);

    fill(c);                           //(getRandomColor()); //balloon color
    ellipseMode(CENTER);
    ellipse(balloonX, balloonY, balloonW, balloonH);
    line(balloonX, balloonY+balloonH/2, balloonX+balloonW/3, balloonY+balloonH/2+balloonW/3);
  }

  void move() {
    balloonX = balloonX+ speed;
    balloonY = balloonY + speedY;
  }
  void displayHouse() {
    fill(255);
    float topY = 200;
    float topX = 20;
    float houseW =90;
    float houseH = 90;
    //float doorX =houseW*5/8));
    float doorY =(houseH-(houseW*3/4));
    rect(topX, topY, houseW, houseH-houseH*1/3); //main house 
    rect(topX+houseW*5/8, topY+houseH*3/4-houseH/3, houseW*3/16, houseH/4);  //door 60-22
    triangle(topX, topY, topX+houseW/2, topY-houseH/3, topX+houseW, topY);
    rect(topX+houseW*1/8, topY+houseH/8, houseW/8, houseH/8);  //window
  }
  void displayHouse2() {
    fill(255);
    float topY = 90;
    float topX = 130;
    float houseW =85;
    float houseH = 90;
    //float doorX =houseW*5/8));
    float doorY =(houseH-(houseW*3/4));
    rect(topX, topY, houseW, houseH-houseH*1/3); //main house 
    rect(topX+houseW*5/8, topY+60-22, houseW*3/16, houseH/4);  //door
    triangle(topX, topY, topX+houseW/2, topY-houseH/3, topX+houseW, topY);
    rect(topX+houseW*1/8, topY+houseH/8, houseW/8, houseH/8);  //window
  }



