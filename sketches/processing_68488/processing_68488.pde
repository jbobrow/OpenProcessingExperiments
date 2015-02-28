
int d=50;
float[] ballPosX= new float[2];  
float[] ballPosY= new float[2];  
float[] ballVelX= new float[2];
float[] ballVelY= new float[2];

import ddf.minim.*;

Minim minim;
AudioPlayer childrencheer;
AudioPlayer wordpress;
AudioPlayer GlasswareIce;
AudioPlayer monkey;

float stilliceposX=250;
float stilliceposY=700;
float bearposX=250;
float bearposY=700;

float a, b;

int counter;

boolean ball=false;          //big iceberg appears//
boolean iceBump = false;
boolean jump = false;
boolean jumpup= false;      //press up to jump or not//
boolean bearmove=true;      //bear can jump or not//
boolean startgame=false;    //press shift or not//
boolean wingame=false;         //win image//
boolean middleIcebergFormed = false;
boolean stopcounter=false;

PFont font;
PImage bg;
PImage bear;
PImage iceberg;
PImage bigiceberg;
PImage start;
PImage lose;
PImage win;

//----------------SETUP----------------------------------------------------//

void setup() {
  minim = new Minim(this); 
  childrencheer = minim.loadFile("Children Cheer.wav");
  wordpress = minim.loadFile("wordpress-3.4.1.wav");
  GlasswareIce = minim.loadFile("Glassware Ice.wav");
  monkey = minim.loadFile("monkey.mp3");
  // play the file
  
  
  
  size(500, 800);
  frameRate(30);

  // load font and image
  font = loadFont("HoboStd.vlw");
  bg = loadImage("seasmall.jpg");
  bear = loadImage("bear.png");
  iceberg = loadImage("iceberg.png");
  bigiceberg = loadImage("bigiceberg.png");
  start = loadImage("pressShift.png");
  lose = loadImage("lose.jpg");
  win=loadImage("win.png");

  //  set the initial position of ball
  for (int i = 0; i<2;i++) {
    ballPosX[i] = random(50, 200);
    ballPosY[i] = random(50, 400);
    ballVelX[i] = random(-0.5, 0.5);
    ballVelY[i] = random(-0.5, 0.5);
  }
}

//-------------DRAW--------------------------------------------------------//

void draw() {
  size(500, 800);
  background(bg);
  

  // show the start image and press key to start game
  openingScreen();
  //start game
  if (startgame==true) {
   
    
    //  when the big iceberg appears,the bear can jump
    if (ball==true) {
        image(bigiceberg, 250, 310, 200, 150);
        middleIcebergFormed = true;
        jump = true;
        GlasswareIce.play();
      } 
    
    
    //ice melting
    if (middleIcebergFormed==false) {
      
      a = 220-counter/2;
      b = 150-counter/3;
      
      
    }
      if(startgame == true){
      counter++;
      image(iceberg, stilliceposX, stilliceposY, a, b);
      imageMode(CENTER);}

    

   
   
    // draw the bear
    drawBear();

    //make the ball bounce  

    for (int i = 0; i<2;i++) {
      if (ball==false) {

        if (ballPosX[i] > width-d/2 || ballPosX[i] < d/2) {
          ballVelX[i]=-ballVelX[i];
        }


        if (ballPosY[i]>height-d/2 || ballPosY[i] <d/2) {
          ballVelY[i]=-ballVelY[i];
        }



        //draw the ball
        image(iceberg, ballPosX[i], ballPosY[i], d+10, d); 

        //  set a distance between ball and mouse
        float distance = dist(ballPosX[i], ballPosY[i], mouseX, mouseY);


        //    prevent the ball from moving towards mouse
        if (distance<50 && iceBump == false) {
          iceBump = true;
          ballVelX[i]=mouseX-pmouseX;
          ballVelY[i]=mouseY-pmouseY;
        }


        if (distance>50 && iceBump == true) {
          iceBump = false;
        }

        //avoid the ball stopping 
        if (ballVelX[i]==0 && ballVelY[i]==0 ) {
          ballVelX[i]=random(0, 1);
          ballVelY[i]=random(0, 1);
        }
      }


      //   lose the game (in 15 seconds)
      if (a<=0 && b<=0 && stopcounter== false) { 
      image(lose, width/2, height/2,500,800);
      wordpress.play();
    }

      //when small icebergs enter the box  a big iceberg appears
      if (ballPosX[0]<350-d/2 && ballPosX[0]>150+d/2 && ballPosY[0]<375-d/2 && ballPosY[0]>250+d/2
        && ballPosX[1]<350-d/2 && ballPosX[1]>150+d/2 && ballPosY[1]<375-d/2 && ballPosY[1]>250+d/2

        ) {
        ball=true;
      }


      // bear jump onto the big iceberg
      if (jump==true && jumpup==true) {
       
        if (bearposY>310 && bearmove ==true) {
          bearposY=bearposY-10;
          
        }
        
    

        //show the win text//
        if (bearposX==250 && bearposY<=310) {
          stopcounter= true;
         image(win,width/2,height/2,500,800);
         childrencheer.play();
         
         
        }
      }
    }
  }
}

void openingScreen() {
  if (startgame==false) {
    image(start, 0, 0, 500, 800);
  }
}

void drawBear() {
  image(bear, bearposX, bearposY, 150, 120);
  imageMode(CENTER);

  //  make the ball move
  for (int i = 0; i<2;i++) {
    ballPosX[i]=ballPosX[i]+ballVelX[i];    
    ballPosY[i]=ballPosY[i]+ballVelY[i];
  }
}

//press up key to jump

void keyPressed() {

  if (key == CODED) {
    if (keyCode == UP && jump==true) {
       
      jumpup=true;
     
    } 


    //press shift key to start game    
    if (keyCode == SHIFT) {
      startgame =true;
    }
  }
}


void stop()
{
  // always close Minim audio classes when you are done with them
 
  // always stop Minim before exiting
  minim.stop();
  
  
}

