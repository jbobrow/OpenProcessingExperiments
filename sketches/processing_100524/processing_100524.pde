
// Name: Alex Ho
// Teacher: Mrs. Payne
// Geometry Project

float rotation;

void setup()
{
  size(500,500);
  background(255);
  smooth();
  noFill();
  rectMode(CENTER);
  frameRate(30);
}

void draw()
{
  background(255);
  stroke(0,150);
  lineCorners(25);
  pushStyle();
  fill(255);
  ellipse(width/2,height/2,540,540);
  popStyle();
  stroke(0,25);
  circle(width/2,height/2,270,degrees(rotation),50);
  stroke(0,50);
  isoCube();
  rotation++;
}

void lineCorners(int spokeNum)
{
  //Top Left
  pushMatrix();
  translate(250,0);
  rotate(HALF_PI);
  for(int i = 0; i <= spokeNum; i++)
  {
    line(0, i*(250/spokeNum), i*(250/spokeNum), 250);
  }
  popMatrix();
  
  //Bottom Right
  pushMatrix();
  translate(500,250);
  rotate(HALF_PI);
  for(int i = 0; i <= spokeNum; i++)
  {
    line(i*(250/spokeNum), 0, 250, i*(250/spokeNum));
  }
  popMatrix();
  
  //Top Right
  pushMatrix();
  translate(250,0);
  for(int i = 0; i <= spokeNum; i++)
  {
    line(i*(250/spokeNum), 0, 250, i*(250/spokeNum));
  }
  popMatrix();
  
  //Bottom Left
  pushMatrix();
  translate(0,250);
  for(int i = 0; i <= spokeNum; i++)
  {
    line(0, i*(250/spokeNum), i*(250/spokeNum), 250);
  }
  popMatrix();
}

void circle(int x, int y, int size, float theta, int chordinten)
{
  beginShape();
  for(float i = 0; i < 2 * PI; i += PI/180)  {
      vertex(x + size*cos(i), y + size*sin(i));
  }
  endShape();
  for(float i = 0; i < 2 * PI; i += PI/chordinten)  {
    line(x + size*cos(i + theta), y + size*sin(i + theta),x + size*cos(i + PI/2 + theta), y + size*sin(i + PI/2 + theta));
  }
}

void isoCube()
{
  //Bottom left 120
  pushMatrix();
  translate(85,155);
  for(int i = 0; i <= 25 +2; i++)
  {
    line(0,i*(190/25),i*(165/25),190 + (i*86/(25)));
  }
  popMatrix();
  
  //Bottom right 120
  pushMatrix();
  translate(415,155);
  for(int i = 0; i <= 25 +2; i++)
  {
    line(0,i*(190/25),(-(i*(165/25))),190 + (i*86/(25)));
  }
  popMatrix();
  
  //Top left 120
  pushMatrix();
  translate(width/2,440);
  rotate(PI);
  for(int i = 0; i <= 25 +2; i++)
  {
    line(0,i*(190/25),i*(165/25),190 + (i*86/(25)));
  }
  popMatrix();
  
  //Top right 120
  pushMatrix();
  translate(width/2,440);
  rotate(PI);
  for(int i = 0; i <= 25 +2; i++)
  {
    line(0,i*(190/25),(-(i*(165/25))),190 + (i*86/(25)));
  }
  popMatrix();
  
  //Top Middle 120
  pushMatrix();
  translate(415,155);
  rotate(2*((2*PI)/6));
  for(int i = 0; i <= 25 +2; i++)
  {
    line(0,i*(190/25),i*(165/25),190 + (i*86/(25)));
  }
  popMatrix();
  
  //Bottom Middle 120
  pushMatrix();
  translate(415,155);
  rotate((2*PI)/6);
  for(int i = 0; i <= 25 +2; i++)
  {
    line(0,i*(190/25),(-(i*(165/25))),190 + (i*86/(25)));
  }
  popMatrix();
  
  //Bottom Right 60
  pushMatrix();
  translate(width/2,height/2);
  for(int i = 0; i <= 25 + 2; i++)
  {
    line(0,i*(190/25),i*(165/25),190 -(i*86/(25)));
  }
  popMatrix();
  
  //Middle Left 60
  pushMatrix();
  translate(width/2,height/2);
  for(int i = 0; i <= 25 + 2; i++)
  {
    line(0,i*(190/25),(-(i*(165/25))),190 -(i*86/(25)));
  }
  popMatrix();
  
  //Middle Left 60
  pushMatrix();
  translate(width/2,height/2);
  rotate(-(2*PI/6));
  for(int i = 0; i <= 25 + 2; i++)
  {
    line(0,(-(i*(190/25))),(-(i*(165/25))),(-(190 -(i*86/(25)))));
  }
  popMatrix();
  
  //Middle Right 60
  pushMatrix();
  translate(width/2,height/2);
  rotate((2*PI/6));
  for(int i = 0; i <= 25 + 2; i++)
  {
    line(0,(-(i*(190/25))),(i*(165/25)),(-(190 -(i*86/(25)))));
  }
  popMatrix();
  
  //Top Right 60
  pushMatrix();
  translate(width/2,height/2);
  rotate(-(2*PI/6));
  for(int i = 0; i <= 25 + 2; i++)
  {
    line(0,(-(i*(190/25))),(i*(165/25)),(-(190 -(i*86/(25)))));
  }
  popMatrix();
  
  //Top Left 60
  pushMatrix();
  translate(width/2,height/2);
  rotate((2*PI/6));
  for(int i = 0; i <= 25 + 2; i++)
  {
    line(0,(-(i*(190/25))),(-(i*(165/25))),(-(190 -(i*86/(25)))));
  }
  popMatrix();
}


