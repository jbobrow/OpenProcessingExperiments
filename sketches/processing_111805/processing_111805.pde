
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioSample bounce;
AudioSample bounce2;
AudioSample bounce3;
AudioPlayer bgsound;

float x = 200;
float xSpeed = random(3, 4);
float y=0;
float ySpeed = random(5, 6) ;
float playerScore = 0 ;
float a = 100;
float aSpeed = random(1, 2);
float b=0;
float bSpeed = random(1, 2) ;
float c = 0;
float cSpeed = random(1, 2);
float d=  0;
float dSpeed = random(3, 4) ;
void setup() {

  size(600, 600);
  minim = new Minim(this);
  bounce = minim.loadSample("water-droplet-1.wav");
  bounce2 = minim.loadSample("boo.wav");
  bounce3 = minim.loadSample("ping.mp3");
  bgsound = minim.loadFile("01.mp3");
  bgsound.loop();
}


void draw() {
  background(14, (frameCount/15)%180, 100);

  rect(mouseX, 500, 50, 30);
  noStroke();
  rect(x, y, 10, 10, 75);
  textSize(20);
  text("player score : " + playerScore, 50, 50, 75);
  textSize(10);
  text( " touch top +1 mark, touch floor -2 marks", 45, 90, 75);
 


  x = x + xSpeed;
  y= y + ySpeed;
  /* right */
  if (x > width-10) {
    xSpeed = -xSpeed;
    bounce.trigger();
  }
  /* below */
  if (y > width-10) {
    ySpeed = -ySpeed;
    playerScore = playerScore - 2 ;
    bounce2.trigger();
  }
  /* left */
  if (x <0) {
    xSpeed = -xSpeed ;
    bounce.trigger();
  }
  /* top */
  if (y <0) {
    ySpeed = -ySpeed ;
    bounce.trigger();
  }

  if (y > mouseY && x > mouseX+10 && x < (mouseX+60) ) { 

    ySpeed = -ySpeed;
     bounce3.trigger();
  }
  if (y < 0 ) { 
    playerScore =  playerScore + 1 ;
  }

  if ( playerScore > 4 ) {  
    /* level 2 */
    textSize(100); 
    text("Level 2", 220, 300) ;
    noStroke();
    rect(a, b, 10, 10, 75);




    a = a + aSpeed;
    b= b + bSpeed;
    /* rigth */
    if (a > width-10) {
      aSpeed = -aSpeed;
       bounce.trigger();
    }
    /* below */
    if (b > width-10) {
      bSpeed = -bSpeed;
       bounce2.trigger();
      playerScore = playerScore - 2 ;
    }
    /* left */
    if (a <0) {
      aSpeed = -aSpeed ;
       bounce.trigger();
    }
    /* top */
    if (b <0) {
      bSpeed = -bSpeed ;
       bounce.trigger();
    }

    if (b > mouseY && a > mouseX+10 && a < (mouseX+70) ) { 

      bSpeed = -bSpeed;
      bounce3.trigger();
    }
    if (b < 0 ) { 
      playerScore =  playerScore + 1 ;
    }
  }
  /* level 2 end */
  if ( playerScore > 9 ) {  
    textSize(150);
    text("Level 3 ", 70, 450) ;
    noStroke();
    rect(c, d, 10, 10, 75);




    c = c + cSpeed;
    d= d + dSpeed;
    /* rigth */
    if (c > width-10) {
      cSpeed = -cSpeed;
       bounce.trigger();
    }
    /* below */
    if (d > width-10) {
      dSpeed = -dSpeed;
       bounce2.trigger();
      playerScore = playerScore - 2 ;
    }
    /* left */
    if (c <0) {
      cSpeed = -cSpeed ;
       bounce.trigger();
    }
    /* top */
    if (d <0) {
      dSpeed = -dSpeed ;
       bounce.trigger();
    }

    if (d > mouseY && c > mouseX+10 && c < (mouseX+60) ) { 

      dSpeed = -dSpeed;
      bounce3.trigger();
    }    
    if (d < 0 ) { 
      playerScore =  playerScore + 1 ;
    }
  }
  if ( playerScore > 29 ) { 
    background(14, (frameCount/10)%256, 100);

    textSize(60);
    text(" Well Done !", 120, 300 ) ;
  }
}



