
import ddf.minim.*;

Minim minim;
AudioPlayer player;

PFont font;


PImage bg;
PImage balloon;
PImage bird;
PImage heart;
PImage circle;
PImage w_circle;
PImage cloud1;
PImage cloud2;
PImage cloud3;

//background variable
float bgX, bgY;
float bgX_init;
float bgXpos;

//balloon variable
float x, y;
float easing;
float startpoint;
float ypos;
float mx, my;
float y_init;
float offsetx, offsety;
float angle;
int scaler;
float fullx, fully;

//bird variable
float bx1, bx2, bx3, bx4;
float by1, by2, by3, by4;
float bxpos;
float by_init1, by_init2, by_init3, by_init4;
float b_angle;

//ball point variable
float hx, hy;
float h_init;
float h_angle1, h_angle2;

//ball point counter
int counter = 0;
boolean touch = false;
boolean pt;

// life point count
float LP1, LP2, LP3;
float lp1, lp2, lp3;
int damage = 0 ;
boolean overlap = false;
boolean po;

//cloud
float cloud1x, cloud1y;
float cloud2x, cloud2y;
float cloud3x, cloud3y;



//================================================================start of setup

void setup() {
  minim = new Minim(this);
  player = minim.loadFile("audio.mp3");
  player.play();
  
  size (700, 450);
  smooth();
  imageMode(CENTER);
  bg = loadImage( "bg.jpg");
  balloon = loadImage( "balloon.png");
  bird = loadImage( "bird.png");
  heart = loadImage( "heart.png");
  circle = loadImage("circle.png");
  w_circle = loadImage("w_circle.png");
  cloud1 = loadImage("cloud1.png");
  cloud2 = loadImage("cloud2.png");
  cloud3 = loadImage("cloud3.png");
  
  font = loadFont("AmericanTypewriter-Condensed-48.vlw");
  
  

  //background
  bgY = 200;
  bgX_init = 0;
  bgXpos = 0;


  //balloon
  scaler = 17;
  easing = 0.01;
  y = height/2;
  fullx = 1.0;
  fully = 1.0;

  //bird variable
  by_init1 = 100;
  by_init2 = 200;
  by_init3 = 250;
  by_init4 = 300;
  bx1 = -200;
  bx2 = -250;
  bx3 = -700;
  bx4 = -1200;

  //heart variable
  h_init = 150;
  hx = -300;

  //life point
  lp1 = 20;
  lp2 = 20;
  lp3 = 20;
  
 //cloud
 cloud2y = 100;
 cloud1y = 250;
 cloud3y = 350;

}
//========================================================== beginning of draw 

void draw() {

  
//background-------------
  image(bg, width/2, height/2);
//  bg_update();

image(cloud1, cloud1x, cloud1y);
image(cloud2, cloud2x, cloud2y);
//image(cloud3, cloud3x, cloud3y);
cloud1x += 0.5;
cloud2x += 0.3;
cloud3x += 0.5;
if ( cloud1x > width + 150){
  cloud1x = 0;
}
if ( cloud2x > width + 260){
  cloud1x = 0;
}

//balloon---------------
  
  
  pushMatrix();
  translate(x, y);
  scale(fullx, fully);
  image(balloon, 0 , 0);
  offsetx = sin(angle) * scaler;//circular motion
  offsety = cos(angle) * scaler;// around the mouse
  angle += 0.05;
  popMatrix();
  
  float targetX = mouseX;
  mx += (targetX - x)* easing;
  x = mx + offsetx ;
 
if (mousePressed && mouseY < height/2 && y > 30 ) {
    y =  y - 3 ;
  }
  if (mousePressed && mouseY > height/2 && y < 420) {
    y =  y + 3;
  }

w_circle();
// life point counter--------
  life_counter();
  

//bird-----------------------
  bird1();
  bird2();
 if (millis() > 60*1000){bird4();}
 if ( millis() > 30*1000){ bird3();}

//point & collecting points  
point_moving();
collectin_point();


textFont(font);
textSize(18);
text(counter, 40, 40);


//when game ends
the_end();
}
//======================================= end of draw =================
void the_end(){
if( damage >2){
  tint(200, 150);
  y = y + 2;
   if ( millis() > 10 *1000){
   textSize(24);
   text( "Score", width/2-30, 250);
   textSize(48);
   text( counter, width/2 - 20, 300);
   image(balloon, width/2 + offsetx, 150 + offsety );
 }
}


}
void collectin_point(){
  if (abs(x - hx) < 44 && (abs(y - hy))< 50){
  touch = true;
  hx = -100;
  h_init = random (30, 400);
} else{touch = false;}
if ( touch == true && pt == false  ) {
    counter ++;


  }
  pt = touch;
  
      stroke(255);
      strokeWeight(2);
for (int i = 80; i < counter + 80; i += 1){
  line( i, 25, i, 40);}

}

void point_moving(){
  
  if ( hx > width + 50) {
    hx = 0;
    h_init = random (30, 400);
  }
  pushMatrix();
  translate(hx, hy);
  rotate(h_angle1);
  image(heart, 0, 0);
  hx += 2;
  hy = h_init + sin(h_angle2) * 25;
  h_angle1 += 0.1;
  h_angle2 += 0.06;
  popMatrix();

}


void bird4( ) {
  image(bird, bx4, by4);
  bx4 = bx4 +2.5;
  by4 = by_init4 + sin(b_angle) * 20;
  b_angle += 0.01;

  if ( bx4 > width+100) {
    bx4 = -100;
    by_init4 = random(50, 370);
  }
}
void bird3() {
  image(bird, bx3, by3);
  bx3 = bx3 + 2;
  by3 = by_init3 + sin(b_angle) * 10;
  b_angle += 0.02;

  if ( bx3 > width+100) {
    bx3 = -200;
    by_init3 = random(50, 370);
  }
}

void bird2( ) {
  image(bird, bx2, by2);
  bx2 = bx2 + 1.5;
  by2 = by_init2 + sin(b_angle) * 2;
  b_angle += 0.01;

  if ( bx2 > width+100) {
    bx2 = -150;
    by_init2 = random(50, 370);
  }
}

void bird1( ) {
  image(bird, bx1, by1);
  bx1 = bx1 + 1.0;
  by1 = by_init1 + sin(b_angle) * 10;
  b_angle += 0.005;

  if ( bx1 > width+100) {
    bx1 = -100;
    by_init1 = random(50, 370);
  }
}

void life_point1(float LP1) {
  image(circle, 600, LP1);
}

void life_point2(float LP2) {
  image(circle, 630, LP2);
}

void life_point3(float LP3) {
  image(circle, 660, LP3);
}

void bg_update() {
  bgX = bgX_init + bgXpos;
  bgXpos = bgXpos + 0.3;
}

void w_circle(){
  image(w_circle, 600, 20);
  image(w_circle, 630, 20);
  image(w_circle, 660, 20);
}

void life_counter(){
  if ( ( (abs(x - bx1)) < 60 && (abs(y - by1))< 66 ) || 
       ( (abs(x - bx2)) < 60 && (abs(y - by2))< 66 ) ||
       ( (abs(x - bx3)) < 60 && (abs(y - by3))< 66 ) ||
       ( (abs(x - bx4)) < 60 && (abs(y - by4))< 66 ) ) {
    overlap = true;
    
  } else { 
    overlap = false;
  }

  if ( overlap == true && po == false  ) {
    damage ++;
  }
  po = overlap;

  if ( damage > 0) {
    lp1 = -30;
    fullx = 0.9;
//    fully = 0.9;
  }
  if (damage > 1) {
    lp2 = -30;
    fullx = 0.8;
//    fully = 0.8;
  }
  if (damage > 2) {
    lp3 = -30;
    fullx = 0.7;
    fully = 0.9;
  }
  life_point1 ( lp1 );
  life_point2 ( lp2 );
  life_point3 ( lp3 );
}







