
import ddf.minim.*;

Minim minim;
AudioSample bounce;

int xp = 100, r = 0, yp = 100;
int xdir = -3, ydir = 3;
int xr = 10, yr = 380, rw =90;
int xi = 150, yi = 15;
int xip = 3, yip = -3;
int s = 0;
int hurtcount = 0;
float rectC1 = 255, rectC2 = 255, rectC3 = 255;
PImage imgOri;
PImage imgHurt;
PImage imgSto;
boolean start = false;


void setup() {

  size(500, 400);
  minim = new Minim(this);
  bounce = minim.loadSample("oh.mp3");
  imgOri = loadImage("ori.png");  
  imgSto = loadImage("ori.png");
  imgHurt = loadImage("hurt.png");
}


void draw() {

  background(r, 0, 0);


  //game start
  if (keyPressed) {

    if ( key == 's' || key == 'S') { 
      start = true;
    }
  } 



  //game started
  if (start == true) {

    clear();
    textSize(13);
    fill(255, 255, 255);
    text("score: "+s, 19, 10);


    // bouncing ball
    fill(255, 255, 255);
    ellipse(xp, yp, 10, 10);
    xp = xp + xdir;
    yp = yp + ydir;

    if (xp >= width-10 || xp <= 0) {

      xdir = xdir * -1;
    }
    if ( yp <= 0) {

      ydir = ydir * -1;
    }

    //creat rect
    fill(rectC1, rectC2, rectC3);
    rect(xr, yr, rw, 5);
    noStroke();


    //rect move to left
    if (keyPressed) {

      if (( key == 'z' || key == 'Z') && xr > 3) { 
        xr = xr- 5;
      }
    } 

    //rect more to right
    if (keyPressed) {

      if ( (key == 'x' || key == 'X') && xr < width-60) { 
        xr = xr +5;
      }
    } 

    // moving image
    image(imgSto, xi, yi);
    xi = xi + xip;


    if (xi >= width-30 || xi <= 0) {

      xip = xip * -1;
    }


    // rect action
    if ((xp >= xr && xp <= xr+rw) && (yp >= yr && yp <= yr+5)) {
      ydir = ydir * -1;
      rectC1 = random(100, 255);
      rectC2 = random(100, 255);
      rectC3 = random(100, 255);
    }
    // image action   
    if ((xp >= xi && xp <= xi+80) && (yp >= yi && yp <= yi+120)) {
      xdir = xdir * -1;
      ydir = ydir * -1;
      bounce.trigger();
      imgSto = imgHurt;
      s = s+10;
    }
    if (!(xp >= xi && xp <= xi+60) && (yp >= yi && yp <= yi+100)) {
      imgSto = imgOri;
    }
    r -= 30;
  }
  if (s == 1000 || s >1000 ) {
    clear();
    fill(255, 0, 255);
    text("Congratulations,You Win!", 100, 140);
  }
  if (start == false){
  fill(255, 255, 255);
  text("Press S to start the game", 100, 215);
}}



