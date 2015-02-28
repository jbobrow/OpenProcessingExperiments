
/* final
 */

//선언
Ball ball02;
PImage a,b,c,d,e,f,g,h,i,j,k,l;
int flag=0;
float[] x = new float[3000];


//setup
void setup() {
   noCursor();
  smooth();
  noStroke();
  size(600,600);
  frameRate(550);
  ball02 = new Ball(0.02, 0.003);//random(-0.3, 0.3), random(-0.3, 0.3));
  a= loadImage("back0.png");
  b= loadImage("back3.png");
  c= loadImage("back2.png");
  d= loadImage("back1.png");
  e= loadImage("c1.png");
  f= loadImage("c2.png");
  g= loadImage("c3.png");
  h= loadImage("c4.png");
  i= loadImage("c5.png");
  j= loadImage("e1.png");
  k= loadImage("e2.png");
  l= loadImage("e3.png");
  //로드이미지
}

void draw() {
  if (flag == 0)
  {  // The font must be located in the sketch's 
    // "data" directory to load successfully
    background(0); //back0
    image(a,0,0,600,600);
    image(e,mouseX-20, mouseY-150, 300,300); //c1

    image(j,0,500,600,50);
    text("그녀에게 고백하고 싶지만 용기가 없다.",200, 520);
    text("도와주고 싶은 사람은 키보드 -> a",215, 540);

    ball02.ballMove1();
    ball02.ballDisplay();
    //ball02.ballSizeChange();
    ball02.ballCheck();
  }

  if (flag == 1)
  {
    background(0); //back0
    
    image(b,0,0,600,600);
    image(f,mouseX-20, mouseY-150, 300,300); //c2


    image(j,0,500,600,50);
    text("고마워! 하지만 아직 부족해.",222, 520);
    text("좀 더 도와줄 사람은 키보드 -> b",215, 540);
    ball02.ballMove1();
    ball02.ballDisplay();
    //ball02.ballSizeChange();
    ball02.ballCheck();
  }

  if (flag == 2)
  {
    background(0); //back0
    image(c,0,0,600,600);
    if (mousePressed == true ) 
    {
      if(mouseButton == LEFT) {
        flag = 3;
      }
    } //tsugini
    if (keyPressed == true) {
      if(key== 'c') {
        image(l,205,226,200,200);//e3
      }
      else {
        image(k,230,250,150,150);//e2
      }
    } //heart
    image(k,230,250,150,150);
    image(h,50,145, 300,300); //c4
    image(g,mouseX-20, mouseY-150, 300,300); //c3
    image(j,0,500,600,50);
    fill(255,208,204);
    text("그래 이거야! 꽃다발을 얻었다.",222, 520);
    text("마음을 확인하려면 -> c",170, 540);
    fill(255);
    text("고백하려면 -> click",316, 540);
  }


  if (flag == 3) //no C change card
  {
    background(0); //back0 
    image(d,0,0,600,600);
    image(k,205,250,200,200);//e2
    image(g,270,180, 300,300); //c3
    image(i,50,145, 300,300); //c5

    fill(255,200); //snow
    for (int i = 0; i < x.length; i++) {
      x[i] = random( - 7000, 6000);
    }
    for (int i = 0; i < x.length; i++) {
      x[i] += 0.00005;
      float y = i * 0.4;
      ellipse(x[i], y,10,10);
    }
    image(j,0,500,600,50);
    text("thank you.",275, 522);
    fill(50);
    text("다시 처음으로 돌아간다-> d",440, 560);
  }


  if (keyPressed == true ) {

    if(key== 'a') {
      flag = 1;
    }

    if(key== 'b') {
      flag = 2;
    }

    if (key == 'd')
    {
      flag = 0;
    }
  }
}

class Ball {

  float xPosition, yPosition;
  float xSpeed, ySpeed;
  float xAccel, yAccel;
  float ballSize;
  boolean ballInside;
  int ballColor;


  Ball(float xAccelC, float yAccelC) {

    xPosition = height/20;
    yPosition = width/20;

    xAccel = xAccelC;
    yAccel = yAccelC;

    xSpeed = 0;
    ySpeed = 0;

    ballSize = 300;
    ballInside = false;

    ballColor = 255;
  }

  void ballMove1() {

    xSpeed = xSpeed + xAccel;
    ySpeed = ySpeed + yAccel;

    //setting position using spee  

    xPosition = xPosition + xSpeed;
    yPosition = yPosition + ySpeed;

    if (xPosition < 0 || xPosition > width ) {

      xSpeed = -1 * xSpeed;

      //ballColor = 100;
    }

    if (yPosition < 0 || yPosition > height ) {
      ySpeed = -1 * ySpeed;
      //println("bouncing!");
      //yAccel = -1 * yAccel;
      //ballColor = 150;
    }

    xPosition = constrain(xPosition, 0, width); // spped limit X
    yPosition = constrain(yPosition, 0, height); // spped limit Y
  }

  void ballMove2() {

    xSpeed = xAccel;
    ySpeed = yAccel;

    //setting position using spee  

    xPosition = xPosition + xSpeed;
    yPosition = yPosition + ySpeed;

    if (xPosition < 0 || xPosition > width ) {

      xSpeed = -1 * xSpeed;

      //ballColor = 100;
    }

    if (yPosition < 0 || yPosition > height ) {
      ySpeed = -1 * ySpeed;
      //println("bouncing!");
      //yAccel = -1 * yAccel;
      //ballColor = 150;
    }

    xPosition = constrain(xPosition, 0, width); // spped limit X
    yPosition = constrain(yPosition, 0, height); // spped limit Y
  }


  void ballDisplay() {
    fill(ballColor);
    image(h,xPosition, yPosition, ballSize, ballSize);
  }

  void ballSizeChange() {

    float forHalf;
    forHalf = millis(); 
    //   println(forHalf);
    //   println(forHalf % 10000);

    if (forHalf % 10000 > 0 && forHalf % 10000 < 5000 ) {
      ballSize = map( forHalf % 10000, 0, 5000, 0, 100);
      //println("status 1");
    }

    if (forHalf % 10000 > 5000 && forHalf % 10000 < 10000) {
      ballSize = map( forHalf % 10000, 5000, 10000, 100, 0);
      //println("status 2");
    }
  }

  void ballCheck() {

    float distanceBall;
    distanceBall = dist(xPosition, yPosition, mouseX, mouseY);

    println("xPosition = " + xPosition);
    println("yPosition = " + yPosition);
    println("distance = " + distanceBall);
    println("size = " + ballSize);


    if (distanceBall <  ballSize) {
      //ballInside = true;
      //ballSize, xPosition, yPosition
      ballColor = 100;
      println("YES");
    }
    else {
      ballColor = 255;
    }
  }


  void ballPrint() {

    println("xAccel = " + xAccel);
    println("yAccel = " + yAccel);

    println("----");

    println("xSpeed = " + xSpeed);
    println("ySpeed = " + ySpeed);

    println("----");

    println("xPosition = " + xPosition);
    println("yPosition = " + yPosition);
  }
}


