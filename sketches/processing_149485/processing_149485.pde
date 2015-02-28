
PImage image1;
PImage image2;
PImage image3;
PImage image4;
PImage image5; 
PImage image6; 
PImage image7; 
PImage image8; 
PImage image9; 
PImage image10;
PImage image11;
PImage image12;
PImage image13;
PImage image14;
PImage image15;
int l = 1;
int s = 0;
int ySpeed = 5;
float netX = 130;
float y1 = -70;
float x1 = 10;
float y2 = -70;
//float x2 = random(285);
//float x2 = 10;
//float x3 = random(285);
float y3 = -170;
float x3 = 65;
//float x4 = random(285);
float y4 = -270;
float x4 = 120;
float y5 = -370;
float x5 = 175;
//float x5 = random(285);
float y6 = -470;
float x6 = 230;
//float x6 = random(285);
float y7 = -570;
float x7 = 285;
//float x7 = random(285);
float y8 = -670;
float x8 = 285;
float y9 = -770;
float x9 = 230;
float y10 = -870;
float x10 = 175;
float y11 = -970;
float x11 = 120;
float y12 = -1070;
float x12 = 65;
float y13 = -1170;
float x13 = 10;


void setup() {
  size(357, 600);
  image1 = loadImage("http://i1270.photobucket.com/albums/jj613/Laanderson/GymFloor_zps4534ca8a.jpg");
  image2 = loadImage("http://i1270.photobucket.com/albums/jj613/Laanderson/02f8874c-eabb-49bf-8cbf-f976add34445_zps28c5fd9a.png");
  image3 = loadImage("http://i1270.photobucket.com/albums/jj613/Laanderson/c1ae5866-d66c-4e1d-97f6-b7dff108ea9c_zps4ea1ce40.png");
  //image4 = loadImage("miniBallGreen.png");
  image5 = loadImage("http://i1270.photobucket.com/albums/jj613/Laanderson/bdcf9591-da88-4dad-9351-9dfa4e671a37_zps38a48f2b.png");
  image6 = loadImage("http://i1270.photobucket.com/albums/jj613/Laanderson/bdcf9591-da88-4dad-9351-9dfa4e671a37_zps38a48f2b.png");
  image7 = loadImage("http://i1270.photobucket.com/albums/jj613/Laanderson/bdcf9591-da88-4dad-9351-9dfa4e671a37_zps38a48f2b.png");
  image7 = loadImage("http://i1270.photobucket.com/albums/jj613/Laanderson/bdcf9591-da88-4dad-9351-9dfa4e671a37_zps38a48f2b.png");
  image8 = loadImage("http://i1270.photobucket.com/albums/jj613/Laanderson/bdcf9591-da88-4dad-9351-9dfa4e671a37_zps38a48f2b.png");
  image9 = loadImage("http://i1270.photobucket.com/albums/jj613/Laanderson/bdcf9591-da88-4dad-9351-9dfa4e671a37_zps38a48f2b.png");
  image10 = loadImage("http://i1270.photobucket.com/albums/jj613/Laanderson/bdcf9591-da88-4dad-9351-9dfa4e671a37_zps38a48f2b.png");
  image11 = loadImage("http://i1270.photobucket.com/albums/jj613/Laanderson/bdcf9591-da88-4dad-9351-9dfa4e671a37_zps38a48f2b.png");
  image12 = loadImage("http://i1270.photobucket.com/albums/jj613/Laanderson/bdcf9591-da88-4dad-9351-9dfa4e671a37_zps38a48f2b.png");
  image13 = loadImage("http://i1270.photobucket.com/albums/jj613/Laanderson/bdcf9591-da88-4dad-9351-9dfa4e671a37_zps38a48f2b.png");
  image14 = loadImage("http://i1270.photobucket.com/albums/jj613/Laanderson/bdcf9591-da88-4dad-9351-9dfa4e671a37_zps38a48f2b.png");
  image15 = loadImage("http://i1270.photobucket.com/albums/jj613/Laanderson/bdcf9591-da88-4dad-9351-9dfa4e671a37_zps38a48f2b.png");
  noCursor();
  image2.resize(100, 50);
  image3.resize(60, 60);
  image5.resize(75, 75);
  image6.resize(75, 75);
  image7.resize(75, 75);
  image8.resize(75, 75);
  image9.resize(75, 75);
  image10.resize(75, 75);
  image11.resize(75, 75);
  image12.resize(75, 75);
  image13.resize(75, 75);
  image14.resize(75, 75);
  image15.resize(75, 75);
}

void draw() {
  //Background
  image(image1, 0, 0);
  textSize(15);
  //text("Lives: " + l, 250, 20);
  
  textSize(50);
  text( s, 150, 40);

  //Net
  image(image2, mouseX , 485);
  

  ySpeed = 5 + s/10;
  /*if(ySpeed < 10) {
    ySpeed = 5 + s/10;
  } else {
    ySpeed = 10;
  } */
  
  //MoneyBall x = 200
    image(image3, x1, y1);
    y1 = y1 + ySpeed; 
    //stroke(255, 0, 0);
    //ellipse(x1 + 33, y1 + 25, 1, 1);
    if ((x1 + 33) >= mouseX && (x1 + 33) <= mouseX + 100 && y1 >= 485) {
      y1 = -700;
      x1 = 10;
      s++; 
    } 
   
  

  //basketball2
  image(image5, x3, y3);
  y3 = y3 + ySpeed;
  //stroke(255, 0, 0);
  //ellipse(x3 + 38, y3 + 27, 1, 1);
  if ((x3 + 38) >= mouseX && (x3 + 38) <= mouseX + 100 && y3 >= 485) {
    y3 = -700;
    x3 = 65;
    s++;
  }

  //basketball3
  image(image6, x4, y4);
  y4 = y4 + ySpeed;
  if ((x4 + 38) >= mouseX && (x4 + 38) <= mouseX + 100 && y4 >= 485) {
    y4 = -700;
    x4 = 120;
    s++;
  }

  //basketball4
  image(image7, x5, y5);
  y5 = y5 + ySpeed;
  if ((x5 + 38) >= mouseX && (x5 + 38) <= mouseX + 100 && y5 >= 485) {
    y5 = -700;
    x5 = 175;
    s++;
  }

  //basketball5
  image(image8, x6, y6);
  y6 = y6 + ySpeed;
  if ((x6 + 38) >= mouseX && (x6 + 38) <= mouseX + 100 && y6 >= 485) {
    y6 = -700;
    x6 = 230;
    s++;
  }

  //basketball6
  image(image9, x7, y7);
  y7 = y7 + ySpeed;
  if ((x7 + 38) >= mouseX && (x7 + 38) <= mouseX + 100 && y7 >= 485) {
    y7 = -700;
    x7 = 285;
    s++;
  } 

  /* //MoneyBall x = 200
  image(image4, x2, y2);
  image4.resize(60, 60);
  y2 = y2 + ySpeed;
  stroke(55, 0, 0);
  ellipse(x2 + 33, y2 + 25, 1, 1);
  if ((x2 + 33) >= mouseX && (x2 + 33) <= mouseX + 100 && y2 >= 480) {
    y2 = -700;
    x2 = 10; 
    s+=2;
  } */

  image(image10, x8, y8);
  y8 = y8 + ySpeed;
  if ((x8 + 38) >= mouseX && (x8 + 38) <= mouseX + 100 && y8 >= 485) {
    y8 = -700;
    x8 = 285;
    s++;
  } 
  
  image(image11, x9, y9);
  y9 = y9 + ySpeed;
  if ((x9 + 38) >= mouseX && (x9 + 38) <= mouseX + 100 && y9 >= 485) {
    y9 = -700;
    x9 = 230;
    s++;
  } 
  
  image(image12, x10, y10);
  y10 = y10 + ySpeed;
  if ((x10 + 38) >= mouseX && (x10 + 38) <= mouseX + 100 && y10 >= 485) {
    y10 = -700;
    x10 = 175;
    s++;
  } 
  
  image(image13, x11, y11);
  y11 = y11 + ySpeed;
  if ((x11 + 38) >= mouseX && (x11 + 38) <= mouseX + 100 && y11 >= 485) {
    y11 = -700;
    x11 = 120;
    s++;
  } 
  
  image(image14, x12, y12);
  y12 = y12 + ySpeed;
  if ((x12 + 38) >= mouseX && (x12 + 38) <= mouseX + 100 && y12 >= 485) {
    y12 = -700;
    x12 = 65;
    s++;
  } 
  
  image(image15, x13, y13);
  y13 = y13 + ySpeed;
  if ((x13 + 38) >= mouseX && (x13 + 38) <= mouseX + 100 && y13 >= 485) {
    y13 = -700;
    x13 = 10;
    s++;
  } 

 
  if(y1 >= 550) {
    l--;
    y1 = -635;
    x1 =10;
  } if(y2 >= 550) {
    l--;
    //y1 = -635;
    //x1 = 10;
  } if(y3 >= 550) {
    l--;
    y3 = -635;
    x3 = 65;
  } if(y4 >= 550) {
    l--;
    y4 = -635;
    x4 = 120;
  } if(y5 >= 550) {
    l--;
    y5 = -635;
    x5 = 175;
  } if(y6 >= 550) {
    l--;
    y6 = -635;
    x6 = 230;
  } if(y7 >= 550) {
    l--;
    y7 = -635;
    x7 = 285;
  } if(y8 >= 550) {
    l--;
    y8 = -635;
    x8 = 285;
  } if(y9 >= 550) {
    l--;
    y9 = -635;
    x9 = 230;
  } if(y10 >= 550) {
    l--;
    y4 = -635;
    x4 = 175;
  } if(y11 >= 550) {
    l--;
    y10 = -635;
    x10 = 120;
  } if(y12 >= 550) {
    l--;
    y11 = -635;
    x11 = 65;
  } if(y13 >= 550) {
    l--;
    y12 = -635;
    x12 = 10;
  }

  //If game is over
  if (l <= 0) {
    background(0);
    textSize(20);
    text("GAME", 155, 100);
    text("YOU SUCK!", 140, 295);
    text("OVER!", 155, 480);
    text("THANKS FOR PLAYING!  :)", 60,550);
    text("Final Score: " + s, 10, 20);
    y1 = -70;
    y2 = -70;
    y3 = -70;
    y4 = -70;
    y5 = -70;
    y6 = -70;
    y7 = -70;
    y8 = -70;
    y9 = -70;
    y10 = -70;
    y11 = -70;
    y12 = -70;
    y13 = -70;
    println("Game Over");
  } 
  //println("Lives: " + l);
  //println("Score: " + s);
  //println("y1: " + y1);
  //println("y2: " + y2);
  //println("y3: " + y3);
  //println(y4);
  //println(y5);
  //println(y6);
  //println(y7);
  //println(ySpeed);
}


