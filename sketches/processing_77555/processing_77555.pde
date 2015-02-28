
// bring in opengl
import processing.opengl.*;

int posX,posY,pSpeed,gravity,xOffset,velocity,w1,h1,w2,h2;
int fired,elapsed,reload,bSpeed,bsX,bsY,yshoot,xshoot,xStaff,yStaff;
boolean crouch,aim,facedLeft;
PImage egypt;
float yBOB;

color skin1 = color(75,45,12);
color skin2 = color(110,60,0);
color armor1 = color(96,96,96);
color armor2 = color(128,128,128);
color armor3 = color(64,64,64);
color lips1 = color(80,27,10);


// baseline colors
color cBlack  = color(   0,   0,   0 );
color cGray80 = color( 204, 204, 204 );
color cGray90 = color( 230, 230, 230 );
color cRed    = color( 255,   0,   0 );
color cGreen  = color(   0, 255,   0 );
color cBlue   = color(   0,   0, 255 );
color cOrange   = color(   255,   128, 0, 128);
color cYellow   = color(   255,   255, 0, 128);
color cWhite   = color(   255,   255, 255, 128);

int NUM_ENs = 10;

int[]   enemyX = new int[NUM_ENs];
int[]   enemyY = new int[NUM_ENs];

int DEAD_ENs;

int   NUM_BLASTS = 32;
int[] bX = new int[NUM_BLASTS];
int[] bY = new int[NUM_BLASTS];
int[] bS = new int[NUM_BLASTS];
int   nextBlast = 0;


int startLevel = 0;
int playLevel  = 1;
int endLevel   = 2;
int mode;

int score;

// camera parameters for orthographic viewing
float camera_left   = -540;
float camera_right  = 540;
float camera_bottom = -70;   // note flipping signs on bottom and top flips the world
float camera_top    = 650;   // so everything else thinks in terms of y-axis pointing up
                               // --as long as the ortho() call is set up right

float camera_x = posX;          // now introduce camera "center", and
float camera_y = 0;          // change L,R,B,T to offsets from the center



void setup () {
  size(1080,720,OPENGL);
  ellipseMode( CENTER );
  rectMode( CENTER );
  frameRate(30);
  smooth();

posX = 0;
posY = 0;
pSpeed = 50;
gravity = 5;
velocity = 0;
w1 = 50;
h1 = 150;
w2 = 50;
h2 = 75;
bsX = 50;
bsY = 20;
reload = 750;

crouch = false;
aim = false;
facedLeft = false;
//720x4709
egypt = loadImage("egyptian_panarama.jpg");


mode = startLevel;
}



void draw() {
  
  ortho(  camera_x+camera_left,    camera_x+camera_right, 
         -camera_y+camera_bottom, -camera_y+camera_top,    10, -10 );
  resetMatrix();
  
  if ( mode == playLevel ) {
    drawLevel();
  } else if ( mode == startLevel ) {
    drawStart();
  } else if ( mode == endLevel ) {
    drawEnd();
  }
}


void drawStart() {
  background( 0 );
  fill( 0 );  
  textAlign( CENTER );
  fill(cRed);
  text( "- Stargate Sidescroller -", posX, -300 );
  text( "Alpha Stage", posX, -275 );
  fill( cRed );
  text( "click to begin level", posX, -250 );
  if ( mousePressed ) {
    mode = playLevel;
    DEAD_ENs = 0;
    score   = 0;
    for ( int i=0; i<NUM_BLASTS; i++ ) {
      bX[i] =  0;
      bY[i] = 1000;
    }
    delay( 500 );
    
  }
}

void drawLevel() {
  rectMode( CENTER );
  ellipseMode( CENTER );
  imageMode ( CENTER );
  background(0);
  for (int i = 0; i < 9416; i+=4704) {
  image(egypt,i,-260);
  }
  
//EASE CAMERA TOWARD posX
  if (facedLeft == true) {
 xOffset = posX-150;
 bSpeed = -50;
 xshoot = posX-100;
 
} else { 
  xOffset = posX+200;
  bSpeed = 50;
  xshoot = posX+100;
}
camera_x = camera_x + (xOffset - camera_x)/20;
//updated Varaibles
yshoot = posY-130;

//CONTROLS--------------------------
controls();


velocity = velocity + gravity;
posY = posY + velocity;
if (posY > 0) {
  posY = 0;
}
  
  // player shoots?
  elapsed = millis() - fired;
  if ( elapsed > reload  &&  mousePressed  &&  mouseButton == LEFT ) {
    bX[nextBlast] = xshoot;
    bY[nextBlast] = yshoot;
    bS[nextBlast] = bSpeed;
    nextBlast = ( nextBlast + 1 ) % NUM_BLASTS;
    
    fired = millis();
  }
  
// move the bursts
  for (int i=0; i<NUM_BLASTS; i++ ) {
    bX[i] += bS[i];
    constrain( bX[i], posX - 2000, posX + 2000 );
  }
  noStroke();
  // draw blasts
  for ( int i=0; i<NUM_BLASTS; i++ ) {
    fill(cYellow);
    ellipse( bX[i], bY[i], 36, 12 );
  }
  for ( int i=0; i<NUM_BLASTS; i++ ) {
    fill(cOrange);
    ellipse( bX[i] , bY[i], 30, 10 );
  }
  for ( int i=0; i<NUM_BLASTS; i++ ) {
    fill(cOrange);
    ellipse( bX[i] , bY[i], 24, 8 );
  }
  for ( int i=0; i<NUM_BLASTS; i++ ) {
    fill(cWhite);
    ellipse( bX[i], bY[i], 12, 4 );
  }
  for ( int i=0; i<NUM_BLASTS; i++ ) {
    fill(cWhite);
    ellipse( bX[i], bY[i], 6, 2 );
  }
  

drawTealc();
  
  
  fill(skin1);
  rect(4000,50,10000,100);
}


void drawEnd() {
  textAlign( CENTER );
  fill(cRed);
  text( "level complete", posX, 325 );
  fill( cRed );
  text( "click to continue", posX, 300 );
  
  if ( mousePressed ) {
    mode = startLevel;
    delay( 500 );
  }
}

//CONTROLS---------------------------

void controls() {
  
if (keyPressed) {
   if (key == ' ' && posY == 0) {
     if (crouch == false) {
     velocity = -40;
     } else { 
       crouch = false;
       velocity = -50;
     }
     if (aim == true) {
      aim = false; 
     }
   } 
   
   if (key == 'a') {
     //move left
     if (crouch == false) {
     posX = posX - 10;
     facedLeft = true;
     } else { 
       posX = posX - 5;
       facedLeft = true;
     }
     if (aim == true) {
      aim = false; 
     }
   } 
   
   if (key == 'd') {
     //move right
    if (crouch == false) {
     posX = posX + 10;
     facedLeft = false;
     } else { 
       posX = posX + 5;
       facedLeft = false;
     }
     if (aim == true) {
      aim = false; 
     }
   }
   
   if (keyPressed) {
      if (key == 'a' || key == 'd') {
      yBOB = -27 + sin(millis()*PI/250) * 2; 
      xStaff = 0;
      }
   } else {
      yBOB = -27;
      xStaff = 100;
      }
   
   /*
   if (mousePressed) {
     
       i++;
       if (i > blasts.length) {
        i=0; 
        fire=true;
       }
     }
  */
}

  
if(keyPressed) {
   if (key == 's') {
     if (crouch == false) {
     crouch = true;
     } else {
       crouch = false;
     }
   }
   
   if (key == 'w') {
     if (crouch == true) {
     crouch = false;
     }
   }
   
   if (key == 'r') {
     if (aim == false) {
     aim = true;
     } else {
       aim = false;
   }
   
  }
}



}




//---------------------------------------------------------------------------------------


void drawTealc () { 
  /*
 if (facedLeft == false) {
   scale(1,1,1);
 } else {
   scale(-1,1,1);
 }
 */
pushMatrix();//1
translate(posX,posY,0);
  pushMatrix();//2
    if (facedLeft) {
      scale(-1,1,1);
    } else {
      scale(1,1,1);
      }
        pushMatrix();//3
        
        
              
              pushMatrix();//4
                translate(-5,-165+yBOB,0);
                  
                  pushMatrix();//5
                    translate(5,0,0);
                      pushMatrix();//6
                            if (keyPressed) {
                                if (key == 'a' || key == 'd') {
                        rotateZ( sin(millis()*PI/500) * radians( -45.0 ) );
                                } 
                            } else {
                                  rotateZ ( radians(-45.0) );
                                }
                          pushMatrix();//7
                              upperArm(skin1, skin2);
                          popMatrix();//7
                          
                          pushMatrix();//7
                            translate(0,50,0);
                              pushMatrix();//8
                              if (keyPressed) {
                                  if (key == 'a' || key == 'd') {
                                rotateZ( (sin(millis()*PI/500)/2 +1) * radians( -45.0 ) );
                               } 
                              } else {
                                    rotateZ ( radians(-10.0) );
                                  }
                                  pushMatrix();//9
                                      foreArm(skin1, skin2);
                                  popMatrix();//9
                              popMatrix();//8
                          popMatrix();//7
                          
                      popMatrix();//6
                 popMatrix();//5
              popMatrix();//4
              
              
              //GROIN
              pushMatrix();//4
                translate(0,-155,0);
                  pushMatrix();//5
                  if (keyPressed) {
                                  if (key == 'a' || key == 'd') {
                    rotateZ( -sin(millis()*PI/500) * radians( 45.0 ) );
                           } 
                          } else {
                              rotateZ ( radians(0) );
                            }
                      pushMatrix();//6
                          thigh(armor2,armor1);
                      popMatrix();//6
                      
                      
                      pushMatrix();//6
                        translate(0,75,0);
                          pushMatrix();//7
                          if (keyPressed) {
                                  if (key == 'a' || key == 'd') {
                            rotateZ( (-sin(millis()*PI/500)/2 +1) * radians( 45.0 ) );
                           } 
                          } else {
                              rotateZ ( radians(10) );
                            }
                              pushMatrix();//8
                                shin(armor2,armor1);
                              popMatrix();//8
                          popMatrix();//7
                      popMatrix();//6
                      
                      
                  popMatrix();//5
                  
                  pushMatrix();//5
                  if (keyPressed) {
                                  if (key == 'a' || key == 'd') {
                    rotateZ( sin(millis()*PI/500) * radians( 45.0 ) );
                          } 
                        } else {
                            rotateZ ( radians(-20) );
                          }
                      pushMatrix();//6
                          thigh(armor2,armor1);
                      popMatrix();//6
                      
                      pushMatrix();//6
                        translate(0,75,0);
                          pushMatrix();//7
                          if (keyPressed) {
                                  if (key == 'a' || key == 'd') {
                            rotateZ( (sin(millis()*PI/500)/2 +1) * radians( 45.0 ) );
                                  } 
                          } else {
                                    rotateZ ( radians(20) );
                                  }
                              pushMatrix();//8
                                shin(armor2,armor1);
                              popMatrix();//8
                          popMatrix();//7
                      popMatrix();//6
                      
                  popMatrix();//5
              popMatrix();//4
              
              
              
              
              pushMatrix();//4
                translate(-5,-165+yBOB,0);
                  pushMatrix();//5
                          chest(armor1,armor2,skin2);
                  popMatrix();//5
                  
                  pushMatrix();//5
                    translate(0,yBOB,0);
                      pushMatrix();//6
                      
                          //if (keyPressed) {
                             //if (key == 'a' || key == 'd') {
                        rotateZ( radians( 0.0 ) );
                             //}
                         // }
                          pushMatrix();//7
                              head(skin1,skin2);
                          popMatrix();//7
                      popMatrix();//6
                  popMatrix();//5
                  
                  
                  pushMatrix();//5
                    translate(-5,0,0);
                      pushMatrix();//6
                      if (keyPressed) {
                        if (key == 'a' || key == 'd') {
                        rotateZ( -sin(millis()*PI/500) * radians( -45.0 ) );
                          } 
                        } else {
                            rotateZ ( radians(60) );
                          }
                      
                          pushMatrix();//7
                              upperArm(skin1, skin2);
                          popMatrix();//7
                          
                          
                          pushMatrix();//7
                            translate(0,50,0);
                              pushMatrix();//8
                              if (keyPressed) {
                                  if (key == 'a' || key == 'd') {
                                rotateZ( (-sin(millis()*PI/500)/2 +1) * radians( -45.0 ) );
                                  } 
                              } else {
                                    rotateZ ( radians(-90) );
                                  }
                                  
                                  pushMatrix();//9
                                    if (keyPressed) {
                                        if (key == 'a' || key == 'd') {
                                        xStaff = 0;
                                        yStaff = 45;
                                        }
                                     } else {
                                        xStaff = 60;
                                        yStaff = 75;
                                        }
                                    translate(xStaff,yStaff,0);
                                      pushMatrix();//10
                                        if (keyPressed) {
                                          if (key == 'a' || key == 'd') {
                                          rotateZ( -sin(millis()*PI/500) * radians( -25.0 ) );
                                          } 
                                        } else {
                                            rotateZ ( radians(30) );
                                          }
                                          pushMatrix();//11
                                              drawStaff(armor1,armor2);
                                          popMatrix();//11
                                      popMatrix();//10
                                  popMatrix();//9
                                  
                                  
                                  pushMatrix();//9
                                      foreArm(skin1, skin2);
                                  popMatrix();//9
                                  
                                  
                                  
                                  
                              popMatrix();//8
                          popMatrix();//7
                          
                          
                      popMatrix();//6
                  popMatrix();//5
              popMatrix();//4
              
              
              
    popMatrix();//3
  popMatrix();//2
popMatrix();//1

}


void drawStaff (color color1, color color2) {
  fill(color1);
  rect(0,0,200,5);
  fill(color1);
  ellipse(100,0,55,20);
  fill(color1);
  ellipse(-100,0,50,30);
}

void upperArm(color color1, color color2) {

  
 //noStroke();
  //Shoulders
  fill(color1);
  ellipse(0, 15, 30,35);
  fill(color2);
  ellipse(0, 15, 25,35);
  //Biceps
  fill(color1);
  ellipse(0,38, 25,35);
  fill(color2);
  ellipse(0,38, 20,38);
  
  //Shoulder Guards
 fill(96);
 ellipse(0,5,35,30);
 fill(128);
 ellipse(0,0,35,30);
  
}

void foreArm (color color1, color color2) {
  
  //noStroke();
  //FOREARM
  fill(color1);
  ellipse(0,15,23,40);
  fill(color2);
  ellipse(0,15,18,40);
   //thumb
  fill(color1);
  ellipse(7,40,12,7);
  fill(color2);
  ellipse(5,40,10,5);
  //HAND
  fill(color1);
  ellipse(0,35,22,22);
  fill(color2);
  ellipse(0,33,18,18);
   //finger1
  fill(color1);
  ellipse(-7, 45,5,15);
  fill(color2);
  ellipse(-7,43,3,13);
  //finger2
  fill(color1);
  ellipse(-2,45,5,20);
  fill(color2);
  ellipse(-2,43,3,17); 
  //finger3
  fill(color1);
  ellipse(3,45,5,20);
  fill(color2);
  ellipse(3,43,3,17);
  //finger4
  fill(color1);
  ellipse(7,48,5,20);
  fill(color2);
  ellipse(7, 45,3,18);
}


void chest(color gray1, color gray2, color color2) {
//noStroke();

fill(gray2);
 ellipse(5,55,35,30);

fill(color2);
 rect(0,-15,15,30);
fill(gray1);
 ellipse(0,25,25,60);
fill(gray2);
 ellipse(-2,25,25,60);
fill(gray1);
 ellipse(12,25,25,60);
fill(gray2);
 ellipse(10,25,25,60);
 
 fill(gray1);
 rect(5,51,35,10);
 fill(gray2);
 rect(5,51,35,6);

fill(gray1);
 ellipse(6,0,40,35);
fill(gray2);
 ellipse(4,0,40,35);
  
}

void head(color color1, color color2) {
  //noStroke();
  //topHead
  fill(color2);
  ellipse(3, -15, 35,33);
  
  fill(200,200,50);
  ellipse(19,-20,4,8);
  
  //cheek
  fill(color1);
  ellipse(0,0,35,30);
  fill(color2);
  ellipse(3,0,35,30);
  
  //chin
  fill(color1);
  ellipse(15, 11, 10,10);
  fill(color2);
  ellipse(17, 11, 10,10);
  
  //nose
  fill(color2);
  ellipse(16, -6,20,12);
  
  fill(color1);
  ellipse(22, -4, 6,6);
  fill(color2);
  ellipse(21, -5, 4,5);
  
  //eye
  fill(color1);
  ellipse(17, -13,7,4);
  fill(200);
  ellipse(19, -12,3,4);
  fill(30);
  ellipse(20, -12,2,3);
  
  //lips
  fill(lips1);
  ellipse(19, 4, 7,5);
  fill(skin2);
  ellipse(18, 5, 7,4);


}

void thigh( color gray1, color gray2) {
  
  //noStroke();
  fill(gray2);
  ellipse(0,50,30,75);
  fill(gray1);
  ellipse(-5,50,22,52);
  fill(gray2);
  ellipse(-6,50,20,48);
  fill(gray1);
  ellipse(-7,50,18,45);
  
}

void shin(color gray1, color gray2) {
  
  //noStroke();
  fill(gray2);
  ellipse(-1,60,18,18);
  fill(gray2);
  ellipse(0,35,25,55);
  fill(gray1);
  ellipse(7,28,20,70);
  fill(gray2);
  ellipse(10,32,12,67);
  fill(gray1);
  ellipse(12,32,12,64);
  fill(gray2);
  ellipse(12,72,35,18);
  fill(gray1);
  ellipse(10,72,35,18);
  fill(gray1);
  rect(11,77,38,9);
  fill(gray2);
  rect(11,77,38,3);
  
}


