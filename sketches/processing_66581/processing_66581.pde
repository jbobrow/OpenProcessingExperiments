
PImage facePic;
int xPos1static;
int yPos1static;
int xPos1;
int yPos1;
int xPos2static;
int yPos2static;
int xPos2;
int yPos2;

int xVelocity1;
int yVelocity1;
int xVelocity2;
int yVelocity2;

void setup (){
  size(500, 400);
  facePic = loadImage("weirdo.jpg");
  //enter image name here. Make sure it is in data folder.
  //facePic.resize(0, 800);
  imageMode(CENTER);
  xPos1 = 232;
  yPos1 = 110;
  xPos2 = 310;
  yPos2 = 110;
  xPos1static = 232;
  yPos1static = 110;
  xPos2static = 310;
  yPos2static = 110;
  //draw two white circles which will act as the eyes. Find coordinates of
  //center of eyes on image, and use that as center of white circles
  //maybe I don't need this, since it will reset itself over and over in the loop
  //White circles
  ellipse(xPos1static, yPos1static, 50, 80);
  //set xPos's and yPos's based on the center of the circle above
  //set velocity (can all be the same probably since they are eyeballs and they move together
  //set ellipses of pupils, which are at center of white eyes
  xVelocity1 = 2;
  xVelocity2 = 2;
  yVelocity1 = 2;
  yVelocity2 = 2;
}

void draw(){
  //image should always be the background. But then the white circles have to be on top of it
  //so do we set the background as image and then the ellipses again?
  image(facePic, width/2, height/2);
  //white circle ellipses
  //eyeballs will change VELOCITY based on the mouseX and mouseY positions
  frameRate(3);
  //left eye
  fill(255);
  ellipse(xPos1static, yPos1static, 33, 20);
  fill(random(0, 255), random(255), random(255));
  ellipse(xPos1, yPos1, 10, 10);
  //right eye
  fill(255);
  ellipse(xPos2static, yPos2static, 33, 20);
  fill(random(0, 255), random(0, 255), random(0, 255));
  ellipse(xPos2, yPos2, 10, 10);
    xPos1 += xVelocity1;
    yPos1 += yVelocity1;
    xPos2 += xVelocity2;
    yPos2 += yVelocity2;
    
   if(mousePressed)
  {
    stroke(255, 0, 0);
    line(xPos1, yPos1, mouseX, mouseY);
    line(xPos2, yPos2, mouseX, mouseY);
    noStroke();
  }
  //break screen up into 4 quadrants like the exercise we did in class. When mouseX is less than width/2, eyeballs move left, etc.
  //left
/*  if(mouseX <= width/2){
    //upper left
    if(mouseY <= height/2){
      xVelocity1 = xVelocity1 + (-1);
      yVelocity1 = yVelocity1 + (-1);
      xVelocity2 = xVelocity2 + (-1);
      yVelocity2 = yVelocity2 + (-1);
//research how to set a "bounding box" of sorts. Or would I do this like the bouncing balls?
    //bottom left  
}if(mouseY > height/2){
    xVelocity1 = xVelocity1 + (-1);
    yVelocity1 = yVelocity1 + 1;
    xVelocity2 = xVelocity2 + (-1);
    yVelocity2 = yVelocity2 + 1;
  }
  
  if(mouseX > width/2){
    if(mouseY < height/2){
      xVelocity1 = xVelocity1 + 1;
      yVelocity1 = yVelocity1 + (-1);
      xVelocity2 = xVelocity2 + 1;
      yVelocity2 = yVelocity2 + (-1);
    }
    if(mouseY > height/2){
      xVelocity1 = xVelocity1 + 1;
      yVelocity1 = yVelocity1 + 1;
      xVelocity2 = xVelocity2 + 1;
      yVelocity2 = yVelocity2 + 1;
  }
  }*/
  
  xPos1=constrain(mouseX, 220, 257);
  xPos2=constrain(mouseY, 298, 322);
  yPos1=constrain(mouseX, 104, 114);
  yPos2=constrain(mouseY, 100, 115);

  }

//I don't know how to do this part!!
   // 207<=xPos1<=257;
    //100<=yPos1<=120;
    //xPos2-25 <=xPos2<=xPos2+25;
    //100<=yPos2<=120;
    //}
//up to here it works except the eyeballs fly off anywhere. I need them to only go to the edges of white circles.

  
  //SOMETHING EXTRA TO ADD:
  //onclick ,see if there is a code like that, change image to another face with a new set of eyes to play with
  //or onclick, laser beams shoot from eyeballs!

