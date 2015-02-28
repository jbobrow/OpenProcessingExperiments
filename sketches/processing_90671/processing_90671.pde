
int myX;//mushroom x
int myY;
Mushroom myMushroom;
Flower[][] myFlower;
//declare the number of flowers
int col=8; 
int row=4;
int distance = 50; //declare the distance between each flower
int vFlo=20;// the moving speed of flower matrix
color flowerMatrix;

void setup()
{
  size(800, 600);
  frameRate(10);
  myX=width/2;
  myY=height/10*9; 
  myMushroom = new Mushroom(myX, myY);
  //flower matrix setup
  myFlower = new Flower[col][row];
  for (int j = 0; j<row;j++)
  {
    flowerMatrix=color(random(100, 255), random(0, 155), random(0, 155));
    for (int i = 0; i<col;i++)
    {
      myFlower[i][j]=new Flower((i+1)*distance, (j+1)*distance, color(flowerMatrix), vFlo);
    }
  }
}

void draw()
{
  background(15);
  //mushroom
  myMushroom.attack();
  myMushroom.drawMushroom();
  myMushroom.move(20); //passing the distance of each move
  // flower matrix
  for (int i=0; i < col;i ++) {
    for (int j = 0; j<row;j++)
    {
      myFlower[i][j].attack();
      myFlower[i][j].drawFlower();
      //the flower matrix has to move slower than the bullet
      if(frameCount%8==0){
      myFlower[i][j].move();
      }
    }
  }
}

class Flower {
  int x; 
  int y; 
  color c;
  int vFlower;
  int steps=0;
  int chance;
  int bulletX;
  int bulletY;
  Flower(int x_, int y_, color c_, int vFlower_) {
    x = x_;
    y = y_;
    c = c_;
    vFlower=vFlower_;
  }

  void drawFlower() {
    pushMatrix();
    translate(x, y);
    //rotate(radians(frameCount));
    noStroke();
    fill(c);
    ellipse(10, 0, 20, 20);
    ellipse(-10, 0, 20, 20);
    ellipse(0, 10, 20, 20);
    ellipse(0, -10, 20, 20);
    fill(255, 255, 0);
    ellipse(0, 0, 20, 20);
    popMatrix();
  }

  void drawStem() {
    pushMatrix();
    translate(x, y);
    fill(20, 75, 0);
    noStroke();
    rectMode(CORNER);
    rect(0, 0, 2, 50);
    triangle(0, 25, 5, 30, 5, 20);
    triangle(0, 35, -5, 40, -5, 32);
    popMatrix();
  }
  
  void move() {
    x=x+vFlower;
    steps++;
    if (abs(vFlower)*steps>=width-(col+1)*distance) {
      vFlower*=-1;
      steps=0;
    }
  }
  
  void attack() {
    chance=int(random(0,1000));
    noStroke();
    fill(255);
    if (chance==1) {
      bulletX=x;
      bulletY=y;   
    }
    if (bulletX!=0){
    rectMode(CENTER);
    rect(bulletX,bulletY,5,15,5);
    bulletY+=20;
    }
  }
}

class Mushroom {
  int mX;
  int mY;
  int xx;
  int yy;
  Mushroom(int x, int y) {
    mX=x;
    mY=y;
  }

  void drawMushroom()
  {
    pushMatrix();
    translate(mX, mY);
    //feet
    noStroke();
    fill(255, 126, 98);
    ellipse(20, 40, 12, 12);
    ellipse(-20, 40, 12, 12);   
    //bottom//
    fill(255, 193, 159);
    ellipse(0, 0, 100, 80);
    //mouth//
    stroke(0);
    fill(255);
    rectMode(CENTER);
    rect(0, 30, 10, 8, 3);
    //top//
    noStroke();
    fill(255, 71, 46);
    ellipse(0, -65, 170, 110);
    //hands
    fill(255, 126, 98);
    ellipse(48, 20, 15, 15);
    ellipse(-48, 20, 15, 15); 
    //spots
    fill(255);
    ellipse(0, -45, 25, 20);
    ellipse(50, -55, 25, 20);
    ellipse(-50, -55, 25, 20);
    ellipse(30, -90, 25, 20);
    ellipse(-30, -90, 25, 20);
    //eyes//
    drawLeftEye();
    drawRightEye();
    popMatrix();
  }

  void drawLeftEye()
  {
    fill(255);//left eye
    stroke(0);
    strokeWeight(2);
    ellipse(-25, -5, 30, 30);
    pushMatrix();//left eyeball
    translate(-25, -5);
    rotate(radians(frameCount*2+200));
    fill(0);
    ellipse(8, 0, 6, 6);
    popMatrix();
  }

  void drawRightEye()
  {
    fill(255);//right eye
    ellipse(25, -5, 30, 30);
    pushMatrix();//right eyeball
    translate(25, -5);
    rotate(radians(frameCount*2));
    fill(0);
    ellipse(8, 0, 6, 6);
    popMatrix();
  }
  void move (int moveDistance)
  {
    if (key == CODED ) {
      if (keyCode == LEFT && mX>100 && keyPressed == true) {
        mX-=moveDistance;
      }
      if (keyCode== RIGHT && mX<width-100 && keyPressed == true) {
        mX+=moveDistance;
      }
    }
  }
  void attack() {
    noStroke();
    fill(220);
    if ( key ==' ' && keyPressed) {
      xx=mX;
      yy=mY;
    }
    if (yy>0) {
      rectMode(CENTER);
      rect(xx, yy, 10, 15, 5);
      yy-=20;
    }
  }
}



