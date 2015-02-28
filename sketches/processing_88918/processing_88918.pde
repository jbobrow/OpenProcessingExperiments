
/**
 * Pacman
 * by Aline De Souza Campelo Lima 
 * 
 * Press the right, left, up and down key arrows to move the pacman.
 * Also, each time you run the application the color of the text
 * will change. 
 */
 
// Class for animating a sequence of GIFs

class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  
  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + nf(i, 4) + ".gif";
      images[i] = loadImage(filename);
    }
  }

  void display(float xpos, float ypos) {
    frame = (frame+1) % imageCount;
    image(images[frame], xpos, ypos);
  }
  
  int getWidth() {
    return images[0].width;
  }
  
  int getHeight() {
    return images[0].height;
  }
}

//Global Variables

 /* @pjs preload="P_down_0000.gif,P_down_0001.gif,
 P_down_0002.gif, P_down_0003.gif, P_down_0004.gif, P_down_0005.gif,
 P_up_0000.gif, P_up_0001.gif, P_up_0002.gif, P_up_0003.gif, P_up_0004.gif,
 P_up_0005.gif, P_left_0000.gif, P_left_0001.gif, P_left_0002.gif,
 P_left_0003.gif, P_left_0004.gif, P_left_0005.gif, P_right_0000.gif,
 P_right_0001.gif, P_right_0002.gif, P_right_0003.gif, P_right_0004.gif.
 P_right_0005.gif"; */
Animation animation1, animation2, animation3, animation4;
float r1_posX, r1_posY, r1_width, r1_height;
float r2_posX, r2_posY, r2_width, r2_height;
float r3_posX, r3_posY, r3_width, r3_height;
float r4_posX, r4_posY, r4_width, r4_height;
float r5_posX, r5_posY, r5_width, r5_height;
float r6_posX, r6_posY, r6_width, r6_height;
float r7_posX, r7_posY, r7_width, r7_height;
float circleLocationX = 100; 
float circleLocationY = 310;
float circleRadius = 5;
PImage image;
int left_flag = 0, right_flag = 0, up_flag = 0, down_flag = 0;
int circle_flag = 0;
float xpos;
float ypos;
int text_color_r, text_color_g, text_color_b;

void setup() {
  size(300, 400);
  background(0, 0, 0);
  frameRate(60);
  animation1 = new Animation("P_right_", 5);
  animation2 = new Animation("P_left_", 5);
  animation3 = new Animation("P_up_", 5);
  animation4 = new Animation("P_down_", 5);
  image = loadImage("P_right_0000.gif");
  rectMode(CORNER);
  ellipseMode(CENTER);
  xpos = 150 - animation1.getWidth()/2;
  ypos = 400 - animation1.getHeight(); 
  textFont(createFont("Georgia", 12));
  text_color_r = (int) random(255);
  text_color_g = (int) random(255);
  text_color_b = (int) random(255);
}

void draw() { 
  //Draw the walls of the game
  drawWalls();
  //Detecting if the pacman is colliding with the walls
  collision(r1_posX,r1_posY,r1_width,r1_height,xpos,ypos);
  collision(r2_posX,r2_posY,r2_width,r2_height,xpos,ypos); 
  collision(r3_posX,r3_posY,r3_width,r3_height,xpos,ypos);
  collision(r4_posX,r4_posY,r4_width,r4_height,xpos,ypos);
  collision(r5_posX,r5_posY,r5_width,r5_height,xpos,ypos);
  collision(r6_posX,r6_posY,r6_width,r6_height,xpos,ypos);
  collision(r7_posX,r7_posY,r7_width,r7_height,xpos,ypos);
  
  //Draw the balls of the game
 // drawBalls();
  
  fill(0,0,255);
  
  //Input keys to move the pacman
  if (keyPressed) {
    if(keyCode == RIGHT) {
      //Condition to see if the right part collided with the wall
      //if yes, it will not move 
      if(right_flag == 1){
        animation1.display(xpos, ypos);
      }
      else {
        animation1.display(xpos++, ypos);
        left_flag = 0; 
        up_flag = 0;
        down_flag = 0;
      }
    }
    if(keyCode == LEFT) {
      //Condition to see if the left part collided with the wall
      //if yes, it will not move
      if(left_flag == 1){        
        animation2.display(xpos, ypos); 
      }
      else {
        animation2.display(xpos--,ypos);
        right_flag = 0;
        up_flag = 0;
        down_flag = 0;
      }
    }
    if(keyCode == UP) {
      //Condition to see if the up part collided with the wall
      //if yes, it will not move
      if(up_flag == 1){
        animation3.display(xpos, ypos);
      }
      else {
        animation3.display(xpos,ypos--);
        right_flag = 0;
        left_flag = 0;
        down_flag = 0;
      }
    }
    if(keyCode == DOWN) {
      //Condition to see if the down part collided with the wall
      //if yes, it will not move
      if(down_flag == 1){        
        animation4.display(xpos, ypos);
      }
      else {
        animation4.display(xpos,ypos++);
        right_flag = 0;
        left_flag = 0;
        up_flag = 0;
      }
    }    
    analysePosition();
  } else {
      image(image,xpos,ypos);
  }

}

//Drawing the blue rectangles (the walls)
void drawWalls() { 
  
  r1_posX = 50;
  r1_posY = 330;
  r1_width = 300;
  r1_height = 20;
  rect(r1_posX,r1_posY,r1_width,r1_height);
 
  r2_posX = 0;
  r2_posY = 250;
  r2_width = 120;
  r2_height = 20;
  rect(r2_posX,r2_posY,r2_width,r2_height);
 
  r3_posX = 180;
  r3_posY = 250;
  r3_width = 220;
  r3_height = 20;
  rect(r3_posX,r3_posY,r3_width,r3_height);
 
  r4_posX = 55;
  r4_posY = 130;
  r4_width = 190;
  r4_height = 60;
  rect(r4_posX,r4_posY,r4_width,r4_height);
 
  fill(text_color_r,text_color_g,text_color_b);
  text("Aline S C Lima - Homework 1", 60, 160);
  fill(0,0,255);
  
  r5_posX = 55;
  r5_posY = 40;
  r5_width = 35;
  r5_height = 40;
  rect(r5_posX,r5_posY,r5_width,r5_height);

  r6_posX = 200;
  r6_posY = 40;
  r6_width = 35;
  r6_height = 40;
  rect(r6_posX,r6_posY,r6_width,r6_height);
  
  r7_posX = 140;
  r7_posY = 0;
  r7_width = 10;
  r7_height = 80;
  rect(r7_posX,r7_posY,r7_width,r7_height);

  fill(0,0,255);
}

//This function is to don't let the pacman go outside the window
void analysePosition(){
 int spr_width = animation1.getWidth();
 int spr_height = animation1.getHeight();
 
 if(xpos<0) 
  xpos = 0;
 if(xpos> (300 - spr_width))
  xpos = 300 - spr_width;
 if(ypos<0)
  ypos = 0;
 if(ypos > (400 - spr_height) )
  ypos = 400 - spr_height; 
}

void drawBalls(){
 //Detecting if the pacman is colliding with the balls
  if(collisionCircleRectangle(circleLocationX, circleLocationY,circleRadius, xpos, ypos, animation1.getWidth(), animation1.getHeight())) {
    fill(0,0,0);
    circle_flag = 1;
    ellipse(circleLocationX, circleLocationY, circleRadius*2.0, circleRadius*2.0);
  }
  else if (circle_flag == 0) {
    fill(255);
    ellipse(circleLocationX, circleLocationY, circleRadius*2.0, circleRadius*2.0);
  }
  
}

boolean collisionCircleRectangle(float circleX, float circleY,float radius,float rectangleX, float rectangleY,float rectangleWidth,float rectangleHeight)
{
    float circleDistanceX = abs(circleX - rectangleX - rectangleWidth/2);
    float circleDistanceY = abs(circleY - rectangleY - rectangleHeight/2);
 
    if (circleDistanceX > (rectangleWidth/2 + radius)) { return false; }
    if (circleDistanceY > (rectangleHeight/2 + radius)) { return false; }
 
    if (circleDistanceX <= (rectangleWidth/2)) { return true; }
    if (circleDistanceY <= (rectangleHeight/2)) {return true; }
 
    float cornerDistance_sq = pow(circleDistanceX - rectangleWidth/2, 2) +
                         pow(circleDistanceY - rectangleHeight/2, 2);
    
    return (cornerDistance_sq <= pow(radius,2));
}


void collision(float r_posX, float r_posY, float r_width, float r_height,float xpos,float ypos) {
  //Rectangle lower edge with pacman upper edge 
  if((r_posY + r_height) == ypos) {
    //UP key collision
    if (!(xpos > (r_posX + r_width))){
      if(!((xpos + (float) animation1.getWidth()) < r_posX)){
        up_flag = 1;
      }
    }
  }
   //Rectangle upper edge with pacman lower edge
   if(r_posY == (ypos + (float) animation1.getHeight())) { 
     //DOWN key collision
     if (!(xpos > (r_posX + r_width))){
       if(!((xpos + (float) animation1.getWidth()) < r_posX)) {  
         down_flag = 1;
       }
     }
   }
   
   //Pacman left edge and rectangle right edge
   if(xpos == (r_posX + r_width)){
     //LEFT key collision
     if(!(ypos > r_posY + r_height)){
       if(!((ypos + (float) animation1.getHeight() < r_posY))) {
         left_flag = 1;
       }
     }
   }
   //Pacman right edge and rectangle left edge
   if((xpos + (float) animation1.getWidth()) == r_posX){
     //RIGHT key collision
      if(!(ypos > r_posY + r_height)){
       if(!((ypos + (float) animation1.getHeight() < r_posY))) {
         right_flag = 1;
       }
      }
   }
}


