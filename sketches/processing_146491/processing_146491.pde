



float titleYlocation = height+360;
boolean button = false;
float picoff = 2000;
float image1xLocation = width/2 + picoff;
float image2xLocation = width/2 +picoff;
float image3xLocation = width/2 + picoff;
float image4xLocation = width/2 + picoff;
float image5xLocation = width/2 +picoff;
float image6xLocation = width/2 + picoff;
float image7xLocation = width/2 + picoff;
float image8xLocation = width/2 + picoff;
float image9xLocation = width/2 + picoff;
float image10xLocation = width/2 + picoff;
float image11xLocation = width/2 + picoff;
float image12xLocation = width/2 + picoff;
float image13xLocation = width/2 + picoff;
float image14xLocation = width/2 + picoff;
float image15xLocation = width/2 + picoff;
float image16xLocation = width/2 + picoff;
float image17xLocation = width/2 + picoff;
float image18xLocation = width/2 + picoff;
float image19xLocation = width/2 + picoff;
float image20xLocation = width/2 + picoff;
float image21xLocation = width/2 + picoff;
float image22xLocation = width/2 + picoff;


float transparency = 255;

/*FONT*/
PFont info;
Ball ball1;
Ball ball2;
Ball ball3;
Ball ball4;
Ball ball5;
Ball ball6;
Ball ball7;
Ball ball8;
Ball ball9;
Ball ball10;
Ball ball11;
Ball ball12;
Ball ball13;
Ball ball14;
Ball ball15;
Ball ball16;
Ball ball17;
Ball ball18;
Ball ball19;
Ball ball20;
Ball ball21;
Ball ball22;
/* IMAGES */
PImage title;
PImage buttonUp;
PImage buttonDown;
PImage image1;
PImage photo1;
PImage image2;
PImage photo2;
PImage image3;
PImage photo3;
PImage image4;
PImage photo4;
PImage image5;
PImage photo5;
PImage image6;
PImage photo6;
PImage image7;
PImage photo7;
PImage image8;
PImage photo8;
PImage image9;
PImage photo9;
PImage photo10;
PImage image10;
PImage photo11;
PImage image11;
PImage photo12;
PImage image12;
PImage photo13;
PImage image13;
PImage photo14;
PImage image14;
PImage photo15;
PImage image15;
PImage photo16;
PImage image16;
PImage photo17;
PImage image17;
PImage photo18;
PImage image18;
PImage photo19;
PImage image19;
PImage photo20;
PImage image20;
PImage photo21;
PImage image21;
PImage photo22;
PImage image22;
void setup() {
  size(1080, 720);
  smooth();
  frameRate(60);


  /*FONT*/
  info = loadFont("Bauhaus93-48.vlw");

  ball1 = new Ball(width/24, random(height-40), 40);
  ball2 = new Ball(width*2/24, random(height-40), 40);
  ball3 = new Ball(width*3/24, random(height-40), 40);
  ball4 = new Ball(width*4/24, random(height-60), 60);
  ball5 = new Ball(width*5/24, random(height-40), 40);
  ball6 = new Ball(width*6/24, random(height-40), 40);
  ball7 = new Ball(width*7/24, random(height-70), 70);
  ball8 = new Ball(width*8/24, random(height-40), 40);
  ball9 = new Ball(width*9/24, random(height-40), 40);
  ball10 = new Ball(width*10/24, random(height-40), 40);
  ball11 = new Ball(width*11/24, random(height-50), 50);
  ball12 = new Ball(width*12/24, random(height-50), 50);
  ball13 = new Ball(width*13/24, random(height-50), 50);
  ball14 = new Ball(width*14/24, random(height-50), 50);
  ball15 = new Ball(width*15/24, random(height-55), 55);
  ball16 = new Ball(width*16/24, random(height-50), 50);
  ball17 = new Ball(width*17/24, random(height-40), 40);
  ball18 = new Ball(width*18/24, random(height-40), 40);
  ball19 = new Ball(width*19/24, random(height-40), 40);
  ball20 = new Ball(width*20/24, random(height-80), 80);
  ball21 = new Ball(width*21/24, random(height-50), 50);
  ball22 = new Ball(width*22/24, random(height-50), 50);
  /* IMAGES */
  title = loadImage ("title_screen.png");
  buttonUp = loadImage ("button_up.png");
  buttonDown = loadImage ("button_down.png");
  image1 = loadImage ("1_a.png");
  photo1 = loadImage ("1.png");
  photo2 = loadImage ("2.png");
  photo3 = loadImage ("3.png");
  photo4 = loadImage ("4.png");
  photo5 = loadImage ("5.png");
  photo6 = loadImage ("6.png");
  photo7 = loadImage ("7.png");
  photo8 = loadImage ("8.png");
  photo9 = loadImage ("9.png");
  photo10 = loadImage ("10.png");
  photo11 = loadImage ("11.png");
  photo12 = loadImage ("12.png");
  photo13 = loadImage ("13.png");
  photo14= loadImage ("14.png");
  photo15 = loadImage ("15.png");
  photo16 = loadImage ("16.png");
  photo17 = loadImage ("17.png");
  photo18 = loadImage ("18.png");
  photo19 = loadImage ("19.png");
  photo20 = loadImage ("20.png");
  photo21 = loadImage ("21.png");
  photo22 = loadImage ("22.png");
  image2 = loadImage ("2_a.png");
  image3 = loadImage ("3_a.png");
  image4 = loadImage ("4_a.png");
  image5 = loadImage ("5_a.png");
  image6 = loadImage ("6_a.png");
  image7 = loadImage ("7_a.png");
  image8 = loadImage ("8_a.png");
  image9 = loadImage ("9_a.png");
  image10 = loadImage ("10_a.png");
  image11 = loadImage ("11_a.png");
  image12= loadImage ("12_a.png");
  image13 = loadImage ("13_a.png");
  image14 = loadImage ("14_a.png");
  image15= loadImage ("15_a.png");
  image16 = loadImage ("16_a.png");
  image17 = loadImage ("17_a.png");
  image18 = loadImage ("18_a.png");
  image19 = loadImage ("19_a.png");
  image20 = loadImage ("20_a.png");
  image21 = loadImage ("21_a.png");
  image22 = loadImage ("22_a.png");
}
void draw() {
  imageMode(CENTER);
  background(240);
  balls();
  photos();
  back();
  textDisplay();
  imageMode(CENTER);
  image(title, width/2, titleYlocation);
}


void balls() {
  tint(255, transparency);


  ball1.Display();
  ball1.Move();
  ball1.reflectWalls();
  image(image1, ball1.x, ball1.y);


  ball2.Display();
  ball2.Move();
  ball2.reflectWalls();
  image(image2, ball2.x, ball2.y);

  ball3.Display();
  ball3.Move();
  ball3.reflectWalls();
  image(image3, ball3.x, ball3.y);

  ball4.Display();
  ball4.Move();
  ball4.reflectWalls();
  image(image4, ball4.x, ball4.y);

  ball5.Display();
  ball5.Move();
  ball5.reflectWalls();
  image(image5, ball5.x, ball5.y);

  ball6.Display();
  ball6.Move();
  ball6.reflectWalls();
  image(image6, ball6.x, ball6.y);

  ball7.Display();
  ball7.Move();
  ball7.reflectWalls();
  image(image7, ball7.x, ball7.y);

  ball8.Display();
  ball8.Move();
  ball8.reflectWalls();
  image(image8, ball8.x, ball8.y);

  ball9.Display();
  ball9.Move();
  ball9.reflectWalls();
  image(image9, ball9.x, ball9.y);

  ball10.Display();
  ball10.Move();
  ball10.reflectWalls();
  image(image10, ball10.x, ball10.y);

  ball11.Display();
  ball11.Move();
  ball11.reflectWalls();
  image(image11, ball11.x, ball11.y);

  ball12.Display();
  ball12.Move();
  ball12.reflectWalls();
  image(image12, ball12.x, ball12.y);

  ball13.Display();
  ball13.Move();
  ball13.reflectWalls();
  image(image13, ball13.x, ball13.y);

  ball14.Display();
  ball14.Move();
  ball14.reflectWalls();
  image(image14, ball14.x, ball14.y);

  ball15.Display();
  ball15.Move();
  ball15.reflectWalls();
  image(image15, ball15.x, ball15.y);

  ball16.Display();
  ball16.Move();
  ball16.reflectWalls();
  image(image16, ball16.x, ball16.y);

  ball17.Display();
  ball17.Move();
  ball17.reflectWalls();
  image(image17, ball17.x, ball17.y);

  ball18.Display();
  ball18.Move();
  ball18.reflectWalls();
  image(image18, ball18.x, ball18.y);

  ball19.Display();
  ball19.Move();
  ball19.reflectWalls();
  image(image19, ball19.x, ball19.y);

  ball20.Display();
  ball20.Move();
  ball20.reflectWalls();
  image(image20, ball20.x, ball20.y);

  ball21.Display();
  ball21.Move();
  ball21.reflectWalls();
  image(image21, ball21.x, ball21.y);

  ball22.Display();
  ball22.Move();
  ball22.reflectWalls();
  image(image22, ball22.x, ball22.y);
}



void photos() {
  transparency = transparency + 1;
  tint(255, transparency);
  image(photo1, image1xLocation, height/2 );
  image(photo2, image2xLocation, height/2 );
  image(photo3, image3xLocation, height/2 );
  image(photo4, image4xLocation, height/2 );
  image(photo5, image5xLocation, height/2 );
  image(photo6, image6xLocation, height/2 );
  image(photo7, image7xLocation, height/2 );
  image(photo8, image8xLocation, height/2 );
  image(photo9, image9xLocation, height/2 );
  image(photo10, image10xLocation, height/2 );
  image(photo11, image11xLocation, height/2 );
  image(photo12, image12xLocation, height/2 );
  image(photo13, image13xLocation, height/2 );
  image(photo14, image14xLocation, height/2 );
  image(photo15, image15xLocation, height/2 );
  image(photo16, image16xLocation, height/2 );
  image(photo17, image17xLocation, height/2 );
  image(photo18, image18xLocation, height/2 );
  image(photo19, image19xLocation, height/2 );
  image(photo20, image20xLocation, height/2 );
  image(photo21, image21xLocation, height/2 );
  image(photo22, image22xLocation, height/2 );
}

void textDisplay() {
  float textColor = 15;
  float textW = width/2;
  float textH = height/10;
  if (mouseX > ball1.x-ball1.diam && mouseX < ball1.x+ball1.diam && mouseY > ball1.y-ball1.diam && mouseY < ball1.y+ball1.diam) {
    fill(textColor);
    // textMode(CENTER);
    textFont(info, 50);
    text("Date: Feb. 28, 2011", textW, textH);
   
  }
  if (mouseX > ball2.x-ball2.diam && mouseX < ball2.x+ball2.diam && mouseY > ball2.y-ball2.diam && mouseY < ball2.y+ball2.diam) {
    fill(textColor);
    // textMode(CENTER);
    textFont(info, 50);
    text("Date: Feb. 14, 2011", textW, textH);
  }
  if (mouseX > ball3.x-ball3.diam && mouseX < ball3.x+ball3.diam && mouseY > ball3.y-ball3.diam && mouseY < ball3.y+ball3.diam) {
    fill(textColor);
    // textMode(CENTER);
    textFont(info, 50);
    text("Date: July. 28, 2011", textW, textH);
  }
  if (mouseX > ball4.x-ball4.diam && mouseX < ball4.x+ball4.diam && mouseY > ball4.y-ball4.diam && mouseY < ball4.y+ball4.diam) {
    fill(textColor);
    // textMode(CENTER);
    textFont(info, 50);
    text("Date: Jan. 25, 2012", textW, textH);
  }
  if (mouseX > ball5.x-ball5.diam && mouseX < ball5.x+ball5.diam && mouseY > ball5.y-ball5.diam && mouseY < ball5.y+ball5.diam) {
    fill(textColor);
    // textMode(CENTER);
    textFont(info, 50);
    text("Date: Jan. 28, 2012", textW, textH);
  }
  if (mouseX > ball6.x-ball6.diam && mouseX < ball6.x+ball6.diam && mouseY > ball6.y-ball6.diam && mouseY < ball6.y+ball6.diam) {
    fill(textColor);
    // textMode(CENTER);
    textFont(info, 50);
    text("Date: Feb. 27, 2012", textW, textH);
  }
  if (mouseX > ball7.x-ball7.diam && mouseX < ball7.x+ball7.diam && mouseY > ball7.y-ball7.diam && mouseY < ball7.y+ball7.diam) {
    fill(textColor);
    // textMode(CENTER);
    textFont(info, 50);
    text("Date: March 4, 2012", textW, textH);
  }
  if (mouseX > ball8.x-ball8.diam && mouseX < ball8.x+ball8.diam && mouseY > ball8.y-ball8.diam && mouseY < ball8.y+ball8.diam) {
    fill(textColor);
    // textMode(CENTER);
    textFont(info, 50);
    text("Date: March 4, 2012", textW, textH);
  }
  if (mouseX > ball9.x-ball9.diam && mouseX < ball9.x+ball9.diam && mouseY > ball9.y-ball9.diam && mouseY < ball9.y+ball9.diam) {
    fill(textColor);
    // textMode(CENTER);
    textFont(info, 50);
    text("Date: March 20, 2012", textW, textH);
  }
  if (mouseX > ball10.x-ball10.diam && mouseX < ball10.x+ball10.diam && mouseY > ball10.y-ball10.diam && mouseY < ball10.y+ball10.diam) {
    fill(textColor);
    //  textMode(CENTER);
    textFont(info, 50);
    text("Date: Feb. 29, 2012", textW, textH);
  }
  if (mouseX > ball11.x-ball11.diam && mouseX < ball11.x+ball11.diam && mouseY > ball11.y-ball11.diam && mouseY < ball11.y+ball11.diam) {
    fill(textColor);
    // textMode(CENTER);
    textFont(info, 50);
    text("Date: April 3, 2012", textW, textH);
  }
  if (mouseX > ball12.x-ball12.diam && mouseX < ball12.x+ball12.diam && mouseY > ball12.y-ball12.diam && mouseY < ball12.y+ball12.diam) {
    fill(textColor);
    //  textMode(CENTER);
    textFont(info, 50);
    text("Date: April 3, 2012", textW, textH);
  }
  if (mouseX > ball13.x-ball13.diam && mouseX < ball13.x+ball13.diam && mouseY > ball13.y-ball13.diam && mouseY < ball13.y+ball13.diam) {
    fill(textColor);
    //  textMode(CENTER);
    textFont(info, 50);
    text("Date: April 3, 2012", textW, textH);
  }
  if (mouseX > ball14.x-ball14.diam && mouseX < ball14.x+ball14.diam && mouseY > ball14.y-ball14.diam && mouseY < ball14.y+ball14.diam) {
    fill(textColor);
    //  textMode(CENTER);
    textFont(info, 50);
    text("Date: April 3, 2012", textW, textH);
  }
  if (mouseX > ball15.x-ball15.diam && mouseX < ball15.x+ball15.diam && mouseY > ball15.y-ball15.diam && mouseY < ball15.y+ball15.diam) {
    fill(textColor);
    // textMode(CENTER);
    textFont(info, 50);
    text("Date: Nov 7, 2012", textW, textH);
  }
  if (mouseX > ball16.x-ball16.diam && mouseX < ball16.x+ball16.diam && mouseY > ball16.y-ball16.diam && mouseY < ball16.y+ball16.diam) {
    fill(textColor);
    // textMode(CENTER);
    textFont(info, 50);
    text("Date: Jan 31, 2013", textW, textH);
  }

  /*START HERE*/
  if (mouseX > ball17.x-ball17.diam && mouseX < ball17.x+ball17.diam && mouseY > ball17.y-ball17.diam && mouseY < ball17.y+ball17.diam) {
    fill(textColor);
    // textMode(CENTER);
    textFont(info, 50);
    text("Date: Fall, 2013", textW, textH);
  }
  if (mouseX > ball18.x-ball18.diam && mouseX < ball18.x+ball18.diam && mouseY > ball18.y-ball18.diam && mouseY < ball18.y+ball18.diam) {
    fill(textColor);
    //  textMode(CENTER);
    textFont(info, 50);
    text("Date: Spring, 2013", textW, textH);
  }
  if (mouseX > ball19.x-ball19.diam && mouseX < ball19.x+ball19.diam && mouseY > ball19.y-ball19.diam && mouseY < ball19.y+ball19.diam) {
    fill(textColor);
    //  textMode(CENTER);
    textFont(info, 50);
    text("Date: April 15, 2013", textW, textH);
  }
  if (mouseX > ball20.x-ball20.diam && mouseX < ball20.x+ball20.diam && mouseY > ball20.y-ball20.diam && mouseY < ball20.y+ball20.diam) {
    fill(textColor);
    //  textMode(CENTER);
    textFont(info, 50);
    text("Date: Sept. 17, 2013", textW, textH);
  }
  if (mouseX > ball21.x-ball21.diam && mouseX < ball21.x+ball21.diam && mouseY > ball21.y-ball21.diam && mouseY < ball21.y+ball21.diam) {
    fill(textColor);
    //  textMode(CENTER);
    textFont(info, 50);
    text("Date: November, 2013", textW, textH);
  }

  if (mouseX > ball22.x-ball22.diam && mouseX < ball22.x+ball22.diam && mouseY > ball22.y-ball22.diam && mouseY < ball22.y+ball22.diam) {
    fill(textColor);
    // textMode(CENTER);
    textFont(info, 50);
    text("Date: July 10, 2013", textW, textH);
  }
}


void mousePressed() {

  // float titleYlocation = height/2;
  //image(title, width/2, titleYlocation);
  //if (mousePressed){
  titleYlocation = 2000; 
  //}

  float picDes = width/2;
  if (mouseX > ball1.x-ball1.diam && mouseX < ball1.x+ball1.diam && mouseY > ball1.y-ball1.diam && mouseY < ball1.y+ball1.diam) {
    button = !button;
    image1xLocation  = picDes;
    transparency = 0;
  }
  if (mouseX > ball2.x-ball2.diam && mouseX < ball2.x+ball2.diam && mouseY > ball2.y-ball2.diam && mouseY < ball2.y+ball2.diam) {
    button = !button;
    image2xLocation  = picDes;
    transparency = 0;
  }
  if (mouseX > ball3.x-ball3.diam && mouseX < ball3.x+ball3.diam && mouseY > ball3.y-ball3.diam && mouseY < ball3.y+ball3.diam) {
    button = !button;
    image3xLocation  = picDes;
    transparency = 0;
  }
  if (mouseX > ball4.x-ball4.diam && mouseX < ball4.x+ball4.diam && mouseY > ball4.y-ball4.diam && mouseY < ball4.y+ball4.diam) {
    button = !button;
    image4xLocation  = picDes;
    transparency = 0;
  }
  if (mouseX > ball5.x-ball5.diam && mouseX < ball5.x+ball5.diam && mouseY > ball5.y-ball5.diam && mouseY < ball5.y+ball5.diam) {
    button = !button;
    image5xLocation  = picDes;
    transparency = 0;
  }
  if (mouseX > ball6.x-ball6.diam && mouseX < ball6.x+ball6.diam && mouseY > ball6.y-ball6.diam && mouseY < ball6.y+ball6.diam) {
    button = !button;
    image6xLocation  =picDes;
    transparency = 0;
  }
  if (mouseX > ball7.x-ball7.diam && mouseX < ball7.x+ball7.diam && mouseY > ball7.y-ball7.diam && mouseY < ball7.y+ball7.diam) {
    button = !button;
    image7xLocation  = picDes;
    transparency = 0;
  }
  if (mouseX > ball8.x-ball8.diam && mouseX < ball8.x+ball8.diam && mouseY > ball8.y-ball8.diam && mouseY < ball8.y+ball8.diam) {
    button = !button;
    image8xLocation  = picDes;
    transparency = 0;
  }
  if (mouseX > ball9.x-ball9.diam && mouseX < ball9.x+ball9.diam && mouseY > ball9.y-ball9.diam && mouseY < ball9.y+ball9.diam) {
    button = !button;
    image9xLocation  = picDes;
    transparency = 0;
  }
  if (mouseX > ball10.x-ball10.diam && mouseX < ball10.x+ball10.diam && mouseY > ball10.y-ball10.diam && mouseY < ball10.y+ball10.diam) {
    button = !button;
    image10xLocation  =picDes;
    transparency = 0;
  }
  if (mouseX > ball11.x-ball11.diam && mouseX < ball11.x+ball11.diam && mouseY > ball11.y-ball11.diam && mouseY < ball11.y+ball11.diam) {
    button = !button;
    image11xLocation  = picDes;
    transparency = 0;
  }
  if (mouseX > ball12.x-ball12.diam && mouseX < ball12.x+ball12.diam && mouseY > ball12.y-ball12.diam && mouseY < ball12.y+ball12.diam) {
    button = !button;
    image12xLocation  = picDes;
    transparency = 0;
  }
  if (mouseX > ball13.x-ball13.diam && mouseX < ball13.x+ball13.diam && mouseY > ball13.y-ball13.diam && mouseY < ball13.y+ball13.diam) {
    button = !button;
    image13xLocation  = picDes;
    transparency = 0;
  }
  if (mouseX > ball14.x-ball14.diam && mouseX < ball14.x+ball14.diam && mouseY > ball14.y-ball14.diam && mouseY < ball14.y+ball14.diam) {
    button = !button;
    image14xLocation  = picDes;
    transparency = 0;
  }
  if (mouseX > ball15.x-ball15.diam && mouseX < ball15.x+ball15.diam && mouseY > ball15.y-ball15.diam && mouseY < ball15.y+ball15.diam) {
    button = !button;
    image15xLocation  = picDes;
    transparency = 0;
  }
  if (mouseX > ball16.x-ball16.diam && mouseX < ball16.x+ball16.diam && mouseY > ball16.y-ball16.diam && mouseY < ball16.y+ball16.diam) {
    button = !button;
    image16xLocation  = picDes;
    transparency = 0;
  }
  if (mouseX > ball17.x-ball17.diam && mouseX < ball17.x+ball17.diam && mouseY > ball17.y-ball17.diam && mouseY < ball17.y+ball17.diam) {
    button = !button;
    image17xLocation  =picDes;
    transparency = 0;
  }
  if (mouseX > ball18.x-ball18.diam && mouseX < ball18.x+ball18.diam && mouseY > ball18.y-ball18.diam && mouseY < ball18.y+ball18.diam) {
    button = !button;
    image18xLocation  =picDes;
    transparency = 0;
  }
  if (mouseX > ball19.x-ball19.diam && mouseX < ball19.x+ball19.diam && mouseY > ball19.y-ball19.diam && mouseY < ball19.y+ball19.diam) {
    button = !button;
    image19xLocation  = picDes;
    transparency = 0;
  }
  if (mouseX > ball20.x-ball20.diam && mouseX < ball20.x+ball20.diam && mouseY > ball20.y-ball20.diam && mouseY < ball20.y+ball20.diam) {
    button = !button;
    image20xLocation  = picDes;
    transparency = 0;
  }
  if (mouseX > ball21.x-ball21.diam && mouseX < ball21.x+ball21.diam && mouseY > ball21.y-ball21.diam && mouseY < ball21.y+ball21.diam) {
    button = !button;
    image21xLocation  = picDes;
    transparency = 0;
  }
  if (mouseX > ball22.x-ball22.diam && mouseX < ball22.x+ball22.diam && mouseY > ball22.y-ball22.diam && mouseY < ball22.y+ball22.diam) {
    button = !button;
    image22xLocation  = picDes;
    transparency = 0;
  }
}

void back() {

  float picoff = 1200;

  ellipseMode(CENTER);
  fill(0, 0);
  image(buttonUp, 10, 10 );
  ellipse(10, 10, 20, 20);
  if (mouseX > 0 && mouseX < 20 && mouseY >0 && mouseY < 20 && mousePressed) {
    image1xLocation = width/2 + picoff;
    image2xLocation = width/2 + picoff;
    image3xLocation = width/2 + picoff;
    image4xLocation = width/2 + picoff;
    image5xLocation = width/2 + picoff;
    image6xLocation = width/2 + picoff;
    image7xLocation = width/2 + picoff;
    image8xLocation = width/2 + picoff;
    image9xLocation = width/2 + picoff;
    image10xLocation = width/2 + picoff;
    image11xLocation = width/2 + picoff;
    image12xLocation = width/2 + picoff;
    image13xLocation = width/2 + picoff;
    image14xLocation = width/2 + picoff;
    image15xLocation = width/2 + picoff;
    image16xLocation = width/2 + picoff;
    image17xLocation = width/2 + picoff;
    image18xLocation = width/2 + picoff;
    image19xLocation = width/2 + picoff;
    image20xLocation = width/2 + picoff;
    image21xLocation = width/2 + picoff;
    image22xLocation = width/2 + picoff;
  }
  if (mouseX > 0 && mouseX < 20 && mouseY > 0 && mouseY < 20) {
    fill(0, 0);
    image(buttonDown, 10, 10 );
    ellipse(10, 10, 20, 20);
  }
}

class Ball {

  float xSpeed = 0;
  float ySpeed = 1;
  float diam;
  float x;
  float y;
  float gravity = .05;
  Ball(float tempX, float tempY, float tempDiam) {
    x = tempX;
    y = tempY;
    diam = tempDiam;
  }

  void Display() {
    ellipseMode(CENTER);
    noStroke();
    fill(0, 100);
    ellipse(x, y, diam, diam);
  }
  void Move() {

    x = x + xSpeed;
    y = y + ySpeed ;
    ySpeed = ySpeed + gravity;
  }
  void reflectWalls() {
    if ((x > width) || (x < 0)) {
      xSpeed = xSpeed * -1;
    }
    if (y < 0-diam || y > height-diam/2) {
      ySpeed = ySpeed * -1;
    }
    if (mouseX > ball1.x-ball1.diam && mouseX < ball1.x+ball1.diam && mouseY > ball1.y-ball1.diam && mouseY < ball1.y+ball1.diam) {
      ball1.ySpeed = 0;
    } 
    if (mouseX > ball2.x-ball2.diam && mouseX < ball2.x+ball2.diam && mouseY > ball2.y-ball2.diam && mouseY < ball2.y+ball2.diam) {
      ball2.ySpeed = 0;
    }
    if (mouseX > ball3.x-ball3.diam && mouseX < ball3.x+ball3.diam && mouseY > ball3.y-ball3.diam && mouseY < ball3.y+ball3.diam) {
      ball3.ySpeed = 0;
    }
    if (mouseX > ball4.x-ball4.diam && mouseX < ball4.x+ball4.diam && mouseY > ball4.y-ball4.diam && mouseY < ball4.y+ball4.diam) {
      ball4.ySpeed = 0;
    }
    if (mouseX > ball5.x-ball5.diam && mouseX < ball5.x+ball5.diam && mouseY > ball5.y-ball5.diam && mouseY < ball5.y+ball5.diam) {
      ball5.ySpeed = 0;
    }
    if (mouseX > ball6.x-ball6.diam && mouseX < ball6.x+ball6.diam && mouseY > ball6.y-ball6.diam && mouseY < ball6.y+ball6.diam) {
      ball6.ySpeed = 0;
    }
    if (mouseX > ball7.x-ball7.diam && mouseX < ball7.x+ball7.diam && mouseY > ball7.y-ball7.diam && mouseY < ball7.y+ball7.diam) {
      ball7.ySpeed = 0;
    }
    if (mouseX > ball8.x-ball8.diam && mouseX < ball8.x+ball8.diam && mouseY > ball8.y-ball8.diam && mouseY < ball8.y+ball8.diam) {
      ball8.ySpeed = 0;
    }
    if (mouseX > ball9.x-ball9.diam && mouseX < ball9.x+ball9.diam && mouseY > ball9.y-ball9.diam && mouseY < ball9.y+ball9.diam) {
      ball9.ySpeed = 0;
    }
    if (mouseX > ball10.x-ball10.diam && mouseX < ball10.x+ball10.diam && mouseY > ball10.y-ball10.diam && mouseY < ball10.y+ball10.diam) {
      ball10.ySpeed = 0;
    }
    if (mouseX > ball11.x-ball11.diam && mouseX < ball11.x+ball11.diam && mouseY > ball11.y-ball11.diam && mouseY < ball11.y+ball11.diam) {
      ball11.ySpeed = 0;
    }
    if (mouseX > ball12.x-ball12.diam && mouseX < ball12.x+ball12.diam && mouseY > ball12.y-ball12.diam && mouseY < ball12.y+ball12.diam) {
      ball12.ySpeed = 0;
    }
    if (mouseX > ball13.x-ball13.diam && mouseX < ball13.x+ball13.diam && mouseY > ball13.y-ball13.diam && mouseY < ball13.y+ball13.diam) {
      ball13.ySpeed = 0;
    }
    if (mouseX > ball14.x-ball14.diam && mouseX < ball14.x+ball14.diam && mouseY > ball14.y-ball14.diam && mouseY < ball14.y+ball14.diam) {
      ball14.ySpeed = 0;
    }
    if (mouseX > ball15.x-ball15.diam && mouseX < ball15.x+ball15.diam && mouseY > ball15.y-ball15.diam && mouseY < ball15.y+ball15.diam) {
      ball15.ySpeed = 0;
    }
    if (mouseX > ball16.x-ball16.diam && mouseX < ball16.x+ball16.diam && mouseY > ball16.y-ball16.diam && mouseY < ball16.y+ball16.diam) {
      ball16.ySpeed = 0;
    }

    /*START HERE*/
    if (mouseX > ball17.x-ball17.diam && mouseX < ball17.x+ball17.diam && mouseY > ball17.y-ball17.diam && mouseY < ball17.y+ball17.diam) {
      ball17.ySpeed = 0;
    }
    if (mouseX > ball18.x-ball18.diam && mouseX < ball18.x+ball18.diam && mouseY > ball18.y-ball18.diam && mouseY < ball18.y+ball18.diam) {
      ball18.ySpeed = 0;
    }
    if (mouseX > ball19.x-ball19.diam && mouseX < ball19.x+ball19.diam && mouseY > ball19.y-ball19.diam && mouseY < ball19.y+ball19.diam) {
      ball19.ySpeed = 0;
    }
    if (mouseX > ball20.x-ball20.diam && mouseX < ball20.x+ball20.diam && mouseY > ball20.y-ball20.diam && mouseY < ball20.y+ball20.diam) {
      ball20.ySpeed = 0;
    }
    if (mouseX > ball21.x-ball21.diam && mouseX < ball21.x+ball21.diam && mouseY > ball21.y-ball21.diam && mouseY < ball21.y+ball21.diam) {
      ball21.ySpeed = 0;
    }

    if (mouseX > ball22.x-ball22.diam && mouseX < ball22.x+ball22.diam && mouseY > ball22.y-ball22.diam && mouseY < ball22.y+ball22.diam) {
      ball22.ySpeed = 0;
    }
  }
}



