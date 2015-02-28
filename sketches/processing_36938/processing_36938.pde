
//Samantha Oleson
//EMSII- Eric Singer
//Carnegie Mellon University
//September 8, 2011


int x1= 100; //x position bubble1
int x2= 200; //x pos bubble2
int x3= 300; //x pos bubble3
int x4= 400; //x pos bubble4
int y1 = 550; //y pos all bubbles
int myRadius= 25; //radius of all bubbles


void setup() {
  size(500, 600);
  smooth();
  frameRate(5);
}


void draw() {
  drawBaseFace();
  drawSelectionBubbles();
  drawSon();
  drawTourist();
  drawWitch();
  drawPirate();
}

//BASE FACE
void drawBaseFace() {

  int fiveW = width/5;
  int fiveH = (height-100)/5;
  for (int x = 0; x <= 4; x++) {
    for (int y = 0; y <= 4; y++) {


      fill(random(100), random(100), random (256));
      rect(fiveW *x, fiveH *y, fiveW, fiveH);

      //head
      fill(256, 150, 100);
      ellipse(50+ fiveW *x, 50+ fiveH *y, 50, 50);

      //nose
      triangle(50 + fiveW * x, (200/5) + fiveH * y, (230/5) + fiveW * x, (300/5) +fiveH * y, (270/5) + fiveW * x, (300/5) +fiveH * y);

      //eyes
      fill(250, 250, 250);
      ellipse(40 + fiveW * x, 45 + fiveH * y, 70/6, 50/6);
      ellipse(60 + fiveW * x, 45 + fiveH * y, 70/6, 50/6);

      //pupils
      fill(0, 0, 0);
      ellipse(40 + fiveW * x, 45 + fiveH * y, 20/6, 20/6);
      ellipse(60 + fiveW * x, 45 + fiveH * y, 20/6, 20/6);

      //mouth
      fill(256, 0, 0);
      ellipse(50+ fiveW *x, 65+ fiveH *y, 150/6, 40/6);
      fill(0, 0, 0);
      ellipse(50+ fiveW *x, 65+ fiveH *y, 140/6, 20/6);
    }
  }
}


//SON OF MAN
void drawSon() {


  float d = dist(mouseX, mouseY, x1, y1);
  if (d < myRadius) 
  {

    int fiveW = width/5;
    int fiveH = (height-100)/5;

    for (int x = 0; x <= 4; x++) {
      for (int y = 0; y <= 4; y++) {

        /*fill(256, 0, 0);
         ellipse(70, 370, 40, 40);
         fill(255);*/

        /*//keep bubbles   
         ellipse(x1, y1, 50, 50);
         ellipse(x2, y1, 50, 50);
         ellipse(x4, y1, 50, 50);
         ellipse(x3, y1, 50, 50);*/

        //pupils
        fill(0);
        ellipse(38 + fiveW * x, 45 + fiveH * y, 20/6, 20/6);
        ellipse(58 + fiveW * x, 45 + fiveH * y, 20/6, 20/6);

        //hat
        fill(0);
        rect(32+ fiveW * x, 15+ fiveH * y, 220/6, 50/3);
        ellipse(50 + fiveW * x, 35 + fiveH * y, 300/6, 30/6);
        fill(100);
        rect(32+ fiveW * x, 30+ fiveH * y, 220/6, 4);


        //tie
        fill(250, 10, 10);
        triangle(50 + fiveW * x, (400/5.25) + fiveH * y, (230/5) + fiveW * x, (500/5.25) + fiveH * y, (270/5) + fiveW * x, (500/5.25) + fiveH * y);
        triangle(50 + fiveW * x, (400/5.25) + fiveH * y, (225/5) + fiveW * x, (450/5.25) + fiveH * y, (275/5) + fiveW * x, (450/5.25) + fiveH * y);



        //apple
        fill(70, 150, 40);
        ellipse(50+ fiveW *x, 55+ fiveH *y, 210/6, 175/6);
        fill(200, 100, 10);
        rect(50+ fiveW *x, 35+ fiveH *y, 10/6, 40/6);

        //leaves
        fill(90, 100, 20);
        //bottomleft
        ellipse((200/5) + fiveW *x, (175/4.5) + fiveH *y, 100/6, 30/6);
        //bottomright
        ellipse((320/5) + fiveW *x, (175/4.5) + fiveH *y, 120/6, 20/6);
        //topleft
        //rotate(radians(30));
        ellipse((190/5) + fiveW *x, (160/4.5) + fiveH *y, 120/6, 20/6);
        //topright
        //rotate(radians(20));
        //rotate(radians(10));
        ellipse((310/5) + fiveW *x, (160/4.5) + fiveH *y, 100/6, 30/6);
      }
      fill(255);
      ellipse(x1, y1, 50, 50);
    }
  }
}

//TOURIST
void drawTourist() {

  float e = dist(mouseX, mouseY, x2, y1);
  if (e < myRadius) 
  {
    int fiveW = width/5;
    int fiveH = (height-100)/5;
    for (int x = 0; x <= 4; x++) {
      for (int y = 0; y <= 4; y++) {

        //Sun Glasses
        strokeWeight(1);
        fill(0, 0, 0);
        line((200/5) + fiveW * x, (220/5) + fiveH * y, (300/5) + fiveW * x, (220/5) + fiveH * y);
        line((200/5) + fiveW * x, (220/5) + fiveH * y, (110/5) + fiveW * x, (200/5) + fiveH * y);
        line((300/5) + fiveW * x, (220/5) + fiveH * y, (390/5) + fiveW * x, (200/5) + fiveH * y); 
        ellipse(40 + fiveW * x, 45 + fiveH * y, 100/6, 100/6);
        ellipse(60 + fiveW * x, 45 + fiveH * y, 100/6, 100/6);
        fill(255);

        //Tourist hat
        fill(256, 200, 100);
        curve((250/5) + fiveW *x, (700/5) + fiveH * y, (140/5) + fiveW * x, (144/5) + fiveH * y, (360/5) + fiveW * x, (144/5) + fiveH * y, (250/5) + fiveW * x, (700/5) + fiveH * y);
        ellipse(50 + fiveW * x, 32 + fiveH * y, 470/6, 30/6);
        triangle((250/5) + fiveW * x, (405/5) + fiveH * y, (230/5) + fiveW * x, (420/5) + fiveH * y, (245/5) + fiveW * x, (430/5) + fiveH * y);
        triangle((257/5) + fiveW * x, (407/5) + fiveH * y, (260/5) + fiveW * x, (427/5) + fiveH * y, (280/5) + fiveW * x, (435/5) + fiveH * y);
        curve((250/5)+ fiveW * x, (300/5)+ fiveH * y, (70/5)+ fiveW * x, (170/5)+ fiveH * y, (250/5)+ fiveW * x, (400/5)+ fiveH * y, (400/5)+ fiveW * x, (450/5)+ fiveH * y);
        curve((250/5)+ fiveW * x, (300/5)+ fiveH * y, (430/5)+ fiveW * x, (170/5)+ fiveH * y, (250/5)+ fiveW * x, (400/5)+ fiveH * y, (100/5)+ fiveW * x, (450/5)+ fiveH * y);
        fill(256, 256, 0);
        rect((140/5) + fiveW * x, (140/5) + fiveH * y, 220/5, 10/5);

        //Sunbloc Nose
        fill(256, 256, 256);
        triangle(50 + fiveW * x, (200/5) + fiveH * y, (230/5) + fiveW * x, (300/5) +fiveH * y, (270/5) + fiveW * x, (300/5) +fiveH * y);

        //shine
        if (mousePressed == true) 
        {
          fill(255);
          strokeWeight(1);
          quad((150/4) + fiveW * x, (250/5) + fiveH * y, (160/4) + fiveW * x, (260/5) + fiveH * y, (170/4) + fiveW * x, (250/5) + fiveH * y, (160/5) + fiveW * x, (240/5) + fiveH * y);
          quad((275/5) + fiveW * x, (250/5) + fiveH * y, (285/5) + fiveW * x, (260/5) + fiveH * y, (295/5) + fiveW * x, (250/5) + fiveH * y, (285/5) + fiveW * x, (240/5) + fiveH * y);
          ellipse(x2, y1, 50, 50);
          fill(100);
        }
        else {
          ellipse(x2, y1, 50, 50);
          fill(255);
        }
      }
      ellipse(x2, y1, 50, 50);
    }
  }
}


//WITCH
void drawWitch() {

  float f = dist(mouseX, mouseY, x3, y1);
  if (f < myRadius) 
  {
    int fiveW = width/5;
    int fiveH = (height-100)/5;
    for (int x = 0; x <= 4; x++) {
      for (int y = 0; y <= 4; y++) {

        //pupils
        fill(0);
        ellipse(40 + fiveW * x, 45 + fiveH * y, 20/6, 20/6);
        ellipse(60 + fiveW * x, 45 + fiveH * y, 20/6, 20/6);

        if (mousePressed == true) 
        {
          fill (250, 0, 0);
          ellipse(40 + fiveW * x, 45 + fiveH * y, 20/6, 20/6);
          ellipse(60 + fiveW * x, 45 + fiveH * y, 20/6, 20/6);
          fill(100);
          ellipse(x3, y1, 50, 50);
        }
        else {
          fill(255);
          ellipse(x3, y1, 50, 50);
        }
        ellipse(x3, y1, 50, 50);



        //mouth
        fill(50, 100, 50);
        ellipse(50+ fiveW *x, 65+ fiveH *y, 150/6, 40/6);
        fill(0);
        ellipse(50+ fiveW *x, 65+ fiveH *y, 140/6, 20/6);

        //wart
        fill(80, 100, 80);
        ellipse((270/5) + fiveW *x, (280/5) + fiveH *y, 30/5, 30/5);

        //witch hat
        fill(0, 0, 0);
        ellipse((250/5) + fiveW *x, (160/5) + fiveH *y, 470/5, 30/5);
        triangle((250/5) + fiveW *x, (1/5) + fiveH *y, (130/5) + fiveW *x, (160/5) + fiveH *y, (370/5) + fiveW *x, (160/5) + fiveH *y);
        fill(100, 0, 100);
        rect((145/5) + fiveW *x, (137/5) + fiveH *y, 210/5, 10/5);
        fill(255);
      }
    }
  }
}


//PIRATE
void drawPirate() {
  int fiveW = width/5;
  int fiveH = (height-100)/5;
  for (int x = 0; x <= 4; x++) {
    for (int y = 0; y <= 4; y++) {

      float h = dist(mouseX, mouseY, x4, y1);
      if (h < myRadius) 
      {

        //eyepatch
        fill(0, 0, 0);
        ellipse(40 + fiveW * x, 45 + fiveH * y, 80/6, 80/6);
        line((200/5) + fiveW * x, (220/5) + fiveH * y, (125/5) + fiveW * x, (170/5) + fiveH * y);
        line((200/5) + fiveW * x, (220/5) + fiveH * y, (375/5) + fiveW * x, (170/5) + fiveH * y);

        //Bandanna
        fill(256, 256, 0);
        curve((200/5)+ fiveW * x, (550/4)+ fiveH * y, (140/5)+ fiveW * x, (144/4)+ fiveH * y, (360/5)+ fiveW * x, (144/4)+ fiveH * y, (300/5)+ fiveW * x, (550/4)+ fiveH * y);
        triangle((140/5)+ fiveW * x, (140/4) + fiveH * y, (90/5)+ fiveW * x, (180/4)+ fiveH * y, (100/5)+ fiveW * x, (195/4)+ fiveH * y);
        triangle((140/5)+ fiveW * x, (140/4)+ fiveH * y, (80/5)+ fiveW * x, (150/4)+ fiveH * y, (90/5)+ fiveW * x, (160/4)+ fiveH * y);

        /* //face color
         fill(256, 150, 100);*/

        if (mousePressed == true) 
        {
          //head
          fill(256, 150, 100);
          ellipse(50+ fiveW *x, 50+ fiveH *y, 50, 50);

          //nose
          triangle(50 + fiveW * x, (200/5) + fiveH * y, (230/5) + fiveW * x, (300/5) +fiveH * y, (270/5) + fiveW * x, (300/5) +fiveH * y);

          //eyes
          fill(250, 250, 250);
          ellipse(40 + fiveW * x, 45 + fiveH * y, 70/6, 50/6);
          ellipse(60 + fiveW * x, 45 + fiveH * y, 70/6, 50/6);

          //pupils
          fill(0, 0, 0);
          ellipse(40 + fiveW * x, 45 + fiveH * y, 20/6, 20/6);
          ellipse(60 + fiveW * x, 45 + fiveH * y, 20/6, 20/6);

          //mouth
          fill(256, 0, 0);
          ellipse(50+ fiveW *x, 65+ fiveH *y, 150/6, 40/6);
          fill(0, 0, 0);
          ellipse(50+ fiveW *x, 65+ fiveH *y, 140/6, 20/6);

          //Bandanna
          fill(256, 256, 0);
          curve((200/5)+ fiveW * x, (550/4)+ fiveH * y, (140/5)+ fiveW * x, (144/4)+ fiveH * y, (360/5)+ fiveW * x, (144/4)+ fiveH * y, (300/5)+ fiveW * x, (550/4)+ fiveH * y);
          triangle((140/5)+ fiveW * x, (140/4) + fiveH * y, (90/5)+ fiveW * x, (180/4)+ fiveH * y, (100/5)+ fiveW * x, (195/4)+ fiveH * y);
          triangle((140/5)+ fiveW * x, (140/4)+ fiveH * y, (80/5)+ fiveW * x, (150/4)+ fiveH * y, (90/5)+ fiveW * x, (160/4)+ fiveH * y);


          //NEW eyepatch
          fill(0, 0, 0);
          ellipse(300/5 + fiveW * x, 220/5 + fiveH * y, 80/6, 80/6);
          line((300/5) + fiveW * x, (220/5) + fiveH * y, (125/5) + fiveW * x, (170/5) + fiveH * y);
          line((300/5) + fiveW * x, (220/5) + fiveH * y, (375/5) + fiveW * x, (170/5) + fiveH * y);

          //face color
          fill(256, 150, 100);

          //Bubble
          fill(100);
          ellipse(x4, y1, 50, 50);
        }
        else {
          fill(255);
          ellipse(x4, y1, 50, 50);
        }
        ellipse(x4, y1, 50, 50);
      }
    }
  }
}

//SELECTION BUBBLES
void drawSelectionBubbles() {
  fill(255);
  //keep bubbles   
  ellipse(x1, y1, 50, 50);
  ellipse(x2, y1, 50, 50);
  ellipse(x4, y1, 50, 50);
  ellipse(x3, y1, 50, 50);
}


