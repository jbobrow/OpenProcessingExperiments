
// Homework #5, 48-757, 11:30AM
// Copyright M. Yvonne Hidle
// M. Yvonne Hidle
// yvonnehidle@gmail.com
 
// A simple game. Move pacman with your mouse.
// Use arrow key UP to make him bigger.
// Use arrow key DOWN to make him smaller.
// Avoid the ghosts for 2000 frames and you win!
// Get hit by the ghosts and you lose :(
// To restart the game press your left mouse button.
 
//variables stated
//variables - general
color col;
//variables - pacman
float circleX;
float circleY;
float circleW;
float circleH;
float pmouthA;
float pmouthB;
//variables - ghost
float ghostX;
float ghostY;
float ghostX2;
float ghostY2;
float ghostX3;
float ghostY3;
float ghostX4;
float ghostY4;
float ghostX5;
float ghostY5;
float ghostW;
float ghostH;
 
 
void setup()
{
  //general setup
  size(800, 400);
  smooth();
 
  //variable values
  //variables - general
  col=color(random(255), random(255), random(255));
  //variables - pacman
  circleX = 50;
  circleY = 50;
  circleW = 75;
  circleH = circleW;
  pmouthA = radians(-30);
  pmouthB = radians(30);
  //variables - ghost
  ghostX = 100;
  ghostY = 150;
  ghostX2 = 100;
  ghostY2 = 300;
  ghostX3 = 400;
  ghostY3 = 300;
  ghostX4 = 700;
  ghostY4 = 300;
  ghostX5 = 200;
  ghostY5 = 300;
  ghostW = 45;
  ghostH = 45;
}
 
 
void draw()
{
 
  background(255);
  //frame count on top
  textSize(10);
  fill(0);
  text("Frames: "+frameCount+"/2000 to WIN", width*.83, height*.96);
 
  //putting ghost on the stage
  ghost(ghostX, ghostY, ghostW, ghostH); 
  ghost(ghostX2, ghostY2, ghostW, ghostH); 
  ghost(ghostX3, ghostY3, ghostW, ghostH); 
  ghost(ghostX4, ghostY4, ghostW, ghostH); 
  ghost(ghostX5, ghostY5, ghostW, ghostH);
  ghostX=(ghostX+1)%width;
  ghostY=(ghostY+random(10))%height;
  ghostX2=(ghostX2+1)%width;
  ghostY3=(ghostY3+random(10))%height;
  ghostY4=(ghostY4+1)%height;
  ghostX5=(ghostX5+random(10))%height;
  ghostY5=(ghostY5+1)%height;
 
  //ghosts get faster as more frames go by
  if (frameCount>100)
  {
    ghostX=(ghostX+1)%width;
    ghostY=(ghostY+1)%width;
    ghostX2=(ghostX2+1)%width;
    ghostY3=(ghostY3+1)%width;
    ghostY4=(ghostY4+1)%width;
  }
   
    if (frameCount>200)
  {
    ghostX=(ghostX+1)%width;
    ghostY=(ghostY+1)%width;
    ghostX2=(ghostX2+1)%width;
    ghostY3=(ghostY3+1)%width;
    ghostY4=(ghostY4+1)%width;
  }
   
  if (frameCount>300)
  {
    ghostX=(ghostX+1)%width;
    ghostY=(ghostY+1)%width;
    ghostX2=(ghostX2+1)%width;
    ghostY3=(ghostY3+1)%width;
    ghostY4=(ghostY4+1)%width;
  }
 
  //putting pacman on the stage
  //making him move with your mouse 
  pacman(mouseX, mouseY, circleW, circleH, pmouthA, pmouthB);
 
  //you lose if pacman and ghost have the same X and Y
  if (mouseX>ghostX-ghostW*1.2 && mouseX<ghostX+ghostW*1.2 && mouseY>ghostY-ghostH*1.2 && mouseY<ghostY+ghostH*1.2)
  {
    lose();
  }
 
  else if (mouseX>ghostX2-ghostW*1.2 && mouseX<ghostX2+ghostW*1.2 && mouseY>ghostY2-ghostH*1.2 && mouseY<ghostY2+ghostH*1.2)
  {
    lose();
  }
   
  else if (mouseX>ghostX3-ghostW*1.2 && mouseX<ghostX3+ghostW*1.2 && mouseY>ghostY3-ghostH*1.2 && mouseY<ghostY3+ghostH*1.2)
  {
    lose();
  }
   
  else if (mouseX>ghostX4-ghostW*1.2 && mouseX<ghostX4+ghostW*1.2 && mouseY>ghostY4-ghostH*1.2 && mouseY<ghostY4+ghostH*1.2)
  {
    lose();
  }
   
   else if (mouseX>ghostX5-ghostW*1.2 && mouseX<ghostX5+ghostW*1.2 && mouseY>ghostY5-ghostH*1.2 && mouseY<ghostY5+ghostH*1.2)
  {
    lose();
  }
   
  else if (frameCount==2000)
  {
    win();
  }
}


//changing pacman size with arrow keys UP and DOWN
void keyPressed() {
  if (key == CODED) {
 
    if (keyCode == UP) {
      circleW = circleW+1;
      circleH = circleH+1;
    }
    else if (keyCode == DOWN) {
      circleW = circleW-1;
      circleH = circleH-1;
    }
    else {
      circleW = circleW;
      circleH = circleH;
    }
  }
}


//you lose
void lose()
{
  textSize(20);
  fill(0);
  text("...You lose! To try again press the left mouse button.", width/3, height/2);
  noLoop();
}

 
//you win
void win()
{
  textSize(20);
  fill(random(255),random(255),random(255));
  text("...YOU WIN! Congrats!", width/3, height/2);
  noLoop();
}


//restart the game
 void mousePressed() {
  loop();
  
  if (frameCount>0)
  {
    frameCount=0;
  }
  
}
 

 
//making ghosts
void ghost(
float ghostX,
float ghostY,
float ghostW,
float ghostH)
 
{
  //ghost body
  fill(col);
  stroke(col);
  strokeWeight(30);
  strokeJoin(ROUND);
  rectMode(CENTER);
  rect(ghostX, ghostY, ghostW, ghostH);
 
  //ghost eyes
  fill(255);
  noStroke();
  ellipseMode(CENTER);
  ellipse(ghostX-ghostW/3, ghostY-ghostH/4, 10, 20);
  ellipse(ghostX+ghostW/3, ghostY-ghostH/4, 10, 20);
}
 
 
//making pacman his own function
void pacman(
float circleX,
float circleY,
float circleW,
float circleH,
float pmouthA,
float pmouthB)
{
  // PACMAN Head
  ellipseMode(CENTER);
  fill(137, 172, 191);
  noStroke();
  ellipse(circleX, circleY, circleW, circleH);
 
  // PACMAN Mouth
  fill(54, 62, 79);
  stroke(255);
  strokeWeight(circleW/210*10);
  arc(circleX, circleY, circleW, circleH, pmouthA, pmouthB);
 
  //PACMAN Eye
  float eyeY, eyeX;
  eyeY = circleY-circleH/4;
  eyeX = circleX+circleW/8;
  noStroke();
  fill(255);
  ellipse(eyeX, eyeY, circleW*.15, circleH*.15);
 
  // Intials Y
  // Y - first leg
  float changeStroke;
  changeStroke = circleW/160;
  stroke(255);
  strokeWeight(4*changeStroke);
  noFill();
  beginShape();
  curveTightness(6);
  curveVertex(circleX-circleW/5.333333333, circleY);
  curveVertex(circleX-circleW/5.333333333, circleY);
  curveVertex(circleX-circleW/4, circleY+circleH/16);
  curveVertex(circleX-circleW/16, circleY+circleH/5.333333333);
  curveVertex(circleX-circleW/16, circleY+circleH/5.333333333);
  endShape();
  // Y - second leg curve
  beginShape();
  curveTightness(6);
  curveVertex(circleX, circleY);
  curveVertex(circleX, circleY);
  curveVertex(circleX, circleY+circleH/2.285714286);
  curveVertex(circleX-circleW/8, circleY+circleH/2.285714286);
  curveVertex(circleX-circleW/16, circleY+circleH/3.2);
  curveVertex(circleX-circleW/16, circleY+circleH/3.2);
  endShape();
 
  // H - first leg
  stroke(198, 229, 245);
  beginShape();
  curveTightness(1);
  curveVertex(circleX+circleW/32, circleY+circleH/8);
  curveVertex(circleX+circleW/32, circleY+circleH/8);
  curveVertex(circleX+circleW/10.66666667, circleY+circleH/6.4);
  curveVertex(circleX+circleW/8, circleY+circleH/2.666666667);
  curveVertex(circleX+circleW/8, circleY+circleH/2.666666667);
  endShape();
  // H - second leg
  beginShape();
  curveTightness(1);
  curveVertex(circleX+circleW/5.333333333, circleY+circleH/6.4);
  curveVertex(circleX+circleW/5.333333333, circleY+circleH/6.4);
  curveVertex(circleX+circleW/4.571428571, circleY+circleH/5.333333333);
  curveVertex(circleX+circleW/4, circleY+circleH/2.666666667);
  curveVertex(circleX+circleW/4, circleY+circleH/2.666666667);
  endShape();
  // H - middle leg
  beginShape();
  curveTightness(1);
  curveVertex(circleX+circleW/32, circleY+circleH/3.555555556);
  curveVertex(circleX+circleW/32, circleY+circleH/3.555555556);
  curveVertex(circleX+circleW/2.666666667, circleY+circleH/4);
  curveVertex(circleX+circleW/3.2, circleY+circleH/2.909090909);
  curveVertex(circleX+circleW/3.2, circleY+circleH/2.909090909);
  endShape();
}

