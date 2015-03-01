
void setup() {

  font= loadFont("HarlowSolid-48.vlw");
  photo1 = loadImage ("chicken.png");
  photo2 = loadImage ("barn.png");

  size (800, 600);

  mary = new Sprite(40, 600, 2);  //Mary start

  J = new Sprite(60, 600,2);
  J.posX = 50;
  mary.fillColor(255, 255, 255);
  J.fillColor(300, 0, 0);
}


void draw() {
  if(screen==0)
  {
   background(0);
  textFont(font);
  text("Press Space to Begin", 200, 300); 
  }

  if(screen == 1)
  {
    fill(255);
    image(photo2, 0, 0, width, height);
    // Adjust location of elevator
    if (goingUp) elevatorY -= speed;
    else elevatorY += speed;
    if (elevatorY >= elevatorMax) goingUp = true;
    if (elevatorY <= elevatorMin) goingUp = false;
  
    drawPlatform(400, elevatorY + 7.5, 80, 20);
  
    // Adjust location of slider 
    if (goingRight) sliderX += sliderSpeed;
    else sliderX -= sliderSpeed;
    if (sliderX >= sliderMax) goingRight = false;
    if (sliderX <= sliderMin) goingRight = true;
  
    drawPlatform(sliderX + 7.5, 140, 60, 20);
  
    mary.update();
  
    fill(255);
    drawPlatform (250, 500, 20, 800); //mainpole
    drawPlatform (200, 525, 80, 20); //mainright
    drawPlatform (40, 475, 80, 20); //mainleft
    drawPlatform (200, 400, 80, 20);
    drawPlatform (40, 350, 80, 20);  
    drawPlatform (200, 275, 80, 20);
    drawPlatform (40, 225, 80, 20); 
    drawPlatform (200, 150, 80, 20);
    drawPlatform (320, 0, 20, 1100); //secondpole
    drawPlatform (480, 500, 20, 700); //thirdpole
    drawPlatform (480, 140, 55, 20);
    drawPlatform (730, 340, 20, 420); //fourthpole
    fill(255, 0, 0);
    drawPlatform (605, 175, 230, 50); //lava
    fill(255);
    drawPlatform (628, 535, 55, 20);
    drawPlatform (573, 515, 55, 20);
    drawPlatform (518, 495, 55, 20);
    drawPlatform (585, 420, 55, 20);
    drawPlatform (640, 400, 55, 20);
    drawPlatform (695, 380, 55, 20);
    drawPlatform (544, 288, 110, 20);
    drawPlatform (628, 308, 55, 20);
  
  
  
  
  
    //elevator
  
  
    J.update();
    mary.display();
    J.display();
  
  
  
    image(photo1, 500, 200, 90, 90);
    if (dist(mary.posX, mary.posY, 500, 200) < 90) {
      textFont(font);
      fill(255);
      textSize(65);
      text("Sauce Wins!", 415, 70);
  
      if (dist(J.posX, J.posY, 500, 200) < 90) {
        textFont(font);
        fill(255);
        textSize(65);
        text("Broshahb Wins!", 415, 70);       
      }
    }
  }
}
  void drawPlatform(float x, float y, float w, float h) {
    rectMode(CENTER);
    rect(x, y, w, h);
    mary.repel(x, y, w, h);
    J.repel(x, y, w, h);
  }



void keyPressed() {
  if (key == 's')
  {
    mary.crouch();
  }
  if (key == 'a') {
    mary.moveLeft();
  }
  if (key == 'd') {
    mary.moveRight();
  }
  if(key == ' ')
    screen =1;
  if (key =='w') {
    mary.jump();
  }
  if (key == CODED) {
    if (keyCode == UP)
    {
      J.jump();
    }
    if (keyCode == LEFT) {
      J.moveLeft();
    }
    if (keyCode == RIGHT) {
      J.moveRight();
    }
    if (keyCode == DOWN) {
      J.crouch();
    }
  }
}

