
//images taken from www.eboy.com

PImage myImage;
int vel = 30;

//car 1
int carsX1 = 600;
int carsY1 = 80;
//car 2
int carsX2 = 1000;
int carsY2 = -90;
//car 3
int carsX3 = 1500;
int carsY3 = -360;
//car 4
int carsX4 = 2000;
int carsY4 = -650;
//car 5
int carsX5 = 2300;
int carsY5 = -850;
//car 6
int carsX6 = 2700;
int carsY6 = -980;
//car 7
int carsX7 = 3500;
int carsY7 = -1400;
//car 8
int carsX8 = 600;
int carsY8 = 60;
//car 9
int carsX9 = 650;
int carsY9 = 65;
int rad = 10; 


void setup(){
  smooth();
  size(600,400);

}

/*
float x1 = random (1, 5);
int a = (int) x1;
float x2 = random (1, 5);
int b = (int) x2;
float x3 = random (1, 5);
int c = (int) x3;
float x4 = random (1, 5);
int d = (int) x4;
float x5 = random (1, 5);
int e = (int) x5;
float x6 = random (1, 5);
int f = (int) x6;
float x7 = random (1, 5);
int g = (int) x7;
float x8 = random (1, 5);
int h = (int) x8;
*/

void draw(){
  smooth();
  background(255);
  noStroke();
 
//background

  myImage = loadImage("bg.png");
      image(myImage, 0, 0);

// cars      

  myImage = loadImage("car1.png");
  image(myImage, carsX1, carsY1, 216/2, 216/2);
  carsX1 = carsX1 + -vel/1;
  carsY1 = carsY1 + vel/2;
  
  myImage = loadImage("car2.png");
  image(myImage, carsX2, carsY2, 76/2, 53/2);
  carsX2 = carsX2 + -vel/1;
  carsY2 = carsY2 + vel/2;
  
  myImage = loadImage("car3.png");
  image(myImage, carsX3, carsY3, 87, 56);
  carsX3 = carsX3 + -vel/1;
  carsY3 = carsY3 + vel/2;
  
  myImage = loadImage("car4.png");
  image(myImage, carsX4, carsY4, 87, 60);
  carsX4 = carsX4 + -vel/1;
  carsY4 = carsY4 +  vel/2;
  
  myImage = loadImage("car5.png");
  image(myImage, carsX5, carsY5, 139, 143);
  carsX5 = carsX5 + -vel/1;
  carsY5 = carsY5 + vel/2;
  
  myImage = loadImage("car6.png");
  image(myImage, carsX6, carsY6, 87, 104);
  carsX6 = carsX6 + -vel/1;
  carsY6 = carsY6 + vel/2;
  
  myImage = loadImage("car7.png");
  image(myImage, carsX7, carsY7, 99, 77);
  carsX7 = carsX7 + -vel/1;
  carsY7 = carsY7 + vel/2;

  myImage = loadImage("car8.png");
  image(myImage, carsX8, carsY8, 87, 60);
  carsX8 = carsX8 + -vel/1;
  carsY8 = carsY8 + vel/2;

    


// above background

    myImage = loadImage("bg2.png");
      image(myImage, 128, 0);
      
   loop ();
}




