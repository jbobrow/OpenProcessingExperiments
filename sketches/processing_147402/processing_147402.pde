

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer song;
AudioPlayer song2;
AudioPlayer song3;
AudioPlayer song4;

int pScore;
  
ball ball1; // main character
food food1;
bad bad1;
bad bad2;
mean mean1; // y-axis
mean mean2;
slow slow1; // slow bad guy
slow slow2;
boo boo1; //y-axis fast
PImage img;  
PImage img2;
PImage img3; 
PImage img4; 
PImage img5; 
PImage img6; 
PImage img7; 
PImage img8;
PImage img9; 
PImage img10;
PImage img11;
PImage img12;
PImage img13;
PImage img14;


PImage[] foods = new PImage[4]; 
 
  
int gameState;
int width = 990;
int height = 666;


  
void setup() {
  minim = new Minim(this);
  song= minim.loadFile("ant-marching-band-dave-girtsman.mp3");
  song2 = minim.loadFile("jupeee02.mp3");
  song3 = minim.loadFile("trombone.mp3");
  song4 = minim.loadFile("success.mp3");
  
  size(990,666);
  smooth();
  rectMode(CENTER);
  ellipseMode(CENTER);
  gameState = 0;
  food1 = new food ();
  bad1 = new bad();
  bad2 = new bad();
  mean1 = new mean();
  mean2 = new mean();
  slow1 = new slow();
  slow2 = new slow();
  boo1 = new boo();
  ball1 = new ball (300,575,50);
  pScore = 0;
  img = loadImage("food.jpg");
  img2 = loadImage("level1newlogo.jpg");
  img3 = loadImage("GAMEOVER.jpg");
  img4 = loadImage("level2new2logo.jpg");
  img5 = loadImage("ready2new.jpg");
  img6 = loadImage("level3newlogo.jpg");
  img7 = loadImage("ready3new.jpg");
  img8 = loadImage("bad.png");
  img9 = loadImage("bad2.png");
  img10 = loadImage("ready4new.jpg");
  img11 = loadImage("level4newlogo.jpg");
  img12 = loadImage("YouWin.jpg");
  img13 = loadImage("bad3.png");
  img14 = loadImage("bad4.png");
  
  foods = new PImage[] { loadImage("Fruit-1.png"), loadImage("Fruits-2.png"), loadImage("Fruits-3.png"), loadImage("Fruits-4.png") };
}
     
void draw(){
  background(255); 
  bad1.move();
  bad1.display();
  mean1.move();
  mean1.display();
  ball1.display();
  ball1.keyPressed();
    
  if(gameState==0){
    
    song.play(); //intro song
    image(img, 0, 0);
    if(keyPressed && key == 'b'){
        song.close();
         gameState = 1;
    }
  }
    
  if (gameState == 8){
    song3.play();
    keyCode = 0;
    image(img3, 0, 0);  
    textSize(80);
    fill(255);
    text(pScore, 175, 165);
  
    if (keyPressed && key == 'r') {
      gameState = 0;
      setup();
      gameState = 1;
    }
  }
    if (gameState == 9){
    song.play();
    keyCode = 0;
    image(img12, 0, 0);  
    fill(255);
    textSize(100);
    text(pScore, 175, 165);
    if (keyPressed && key == 'r') {
      gameState = 0;
      setup();
      gameState = 1;
    }
  }
    
  if (gameState == 1){
    image(img2, 0, 0); 
    food1.display();
    bad1.move();
    bad1.display();
    mean1.move();
    mean1.display();
    ball1.display();
    ball1.keyPressed();
    fill(255);
    textSize(70);
    text(pScore, 600, 65);
   
    if (ball1.intersect(food1)){
      pScore++;
      ball1.change();
      food1.reset();
      song2.play();
      song2.rewind();
     
    }
    if ( ball1.collides(bad1) ){
      
      gameState = 8;
    }
        if ( ball1.collides(mean1) ){
     
      gameState = 8;
    }

          if (pScore == 5){
        gameState = 2;
        ball1.reset();
      }
}

if (gameState == 2){
  song4.play();
  image(img5, 0, 0);
  fill(255);
  textSize(95);
  text(pScore, 175, 165);  
  slow1.move();
  slow1.display();
  bad1.move();
  bad1.display();
  mean1.move();
  mean1.display();
  ball1.display();
  ball1.keyPressed();
  if(keyPressed && key == 'b'){
      gameState = 3;
    }
  }
 
if (gameState == 3){  
image(img4, 0, 0);
    food1.display(); 
    bad1.move();
    bad1.display();
    mean1.move();
    mean1.display();
    ball1.display();
    ball1.keyPressed();
    slow1.move();
    slow1.display();
    fill(255);
    textSize(70);
    text(pScore, 600, 65);
    if (ball1.intersect(food1)){
      song2.play(0);
      pScore++;
      ball1.change();
      food1.reset();
    }     
      if ( ball1.collides(slow1) ){
      gameState = 8;
    }
        if ( ball1.collides(bad1) ){
      gameState = 8;
    }
        if ( ball1.collides(mean1) ){
      gameState = 8;
    }

          if (pScore == 11){
            song4.rewind();
        gameState = 4;
        ball1.reset();
      }
}

if (gameState == 4){ 
  song4.play();
  image(img7, 0, 0);
  fill(255);
  textSize(95);
  text(pScore, 175, 165);  
  bad2.move();
  bad2.display();
  mean2.move();
  mean2.display();
  slow1.move();
  slow1.display();
  bad1.move();
  bad1.display();
  mean1.move();
  mean1.display();
  ball1.display();
  ball1.keyPressed();
  if(keyPressed && key == 'b'){
      gameState = 5;
    }
}

if (gameState == 5){
  image(img6, 0, 0); 
  food1.display();
  bad2.move();
  bad2.display();
  mean2.move();
  mean2.display();
  slow1.move();
  slow1.display();
  bad1.move();
  bad1.display();
  mean1.move();
  mean1.display();
  ball1.display();
  ball1.keyPressed();
  fill(255);
  textSize(70);
  text(pScore, 600, 65);
  if (ball1.intersect(food1)){
      song2.play(0);
      pScore++;
      ball1.change();
      food1.reset();
    }     
      if ( ball1.collides(slow1) ){
      gameState = 8;
    }
        if ( ball1.collides(bad1) ){
      gameState = 8;
    }
            if ( ball1.collides(bad2) ){
      gameState = 8;
    }
        if ( ball1.collides(mean1) ){
      gameState = 8;
    }
            if ( ball1.collides(mean2) ){
      gameState = 8;
    }

          if (pScore == 20){
            song4.rewind();
        gameState = 6;
        ball1.reset();
      }
}

if (gameState == 6){
  song4.play();
  image(img10, 0, 0);
  fill(255);
  textSize(95);
  text(pScore, 175, 165);
  bad1.move();
  bad1.display();
  mean1.move();
  mean1.display();
  bad2.move();
  bad2.display();
  mean2.move();
  mean2.display();
  slow1.move();
  slow1.display();
  slow2.move();
  slow2.display();
  boo1.move();
  boo1.display();
  ball1.display();
  ball1.keyPressed();
  if(keyPressed && key == 'b'){
      gameState = 7;
    }
}
 
if (gameState == 7){
  image(img11, 0, 0);
  food1.display();
  bad1.move();
  bad1.display();
  mean1.move();
  mean1.display();
  bad2.move();
  bad2.display();
  mean2.move();
  mean2.display();
  slow1.move();
  slow1.display();
  slow2.move();
  slow2.display();
  boo1.move();
  boo1.display();
  ball1.display();
  ball1.keyPressed();
  fill(255);
  textSize(70);
  text(pScore, 600, 65);
  if (ball1.intersect(food1)){
      song2.play(0);
      pScore++;
      ball1.change();
      food1.reset();
    }    
      if ( ball1.collides(slow1) ){
      gameState = 8;
    }
          if ( ball1.collides(slow2) ){
      gameState = 8;
    }
        if ( ball1.collides(bad1) ){
      gameState = 8;
    }
            if ( ball1.collides(bad2) ){
      gameState = 8;
    }
        if ( ball1.collides(mean1) ){
      gameState = 8;
    }
            if ( ball1.collides(mean2) ){
      gameState = 8;
    }
              if ( ball1.collides(boo1) ){
      gameState = 8;
    }
 
          if (pScore == 32){
        gameState = 9;
        ball1.reset();
      }
}
}
   
   
   
class food {
  float x, y; // variables
  float r;
  int i;
  
     
  food (){
    x = random(100, width - 100);
    y = random(155, height - 100);//minus diameter from distance
    r = 20;
    i = int(random(4));
    println(i);

  }
     
  void display(){

    fill(255,71,54);
    noStroke();
    ellipse(x,y,r,r);
    image(foods[i], x-15, y-15);
  }
       
  void reset(){
    x = random(100, width - 100);
    y = random(135, height - 100);

    i = int(random(4));
    println(i);

  }
}
  
class bad {
  float x, y; // variables
  float r;
  float xspeed;
     
  bad (){
    x = random(135, width - 200);
    y = random(135, height - 200);
    r = 30;
    xspeed = 3;
      
  }
    void move(){
    x += xspeed;
    if (x > width - r/2 || x < r/2){
      xspeed *= -1;
  }
    }
     
  void display(){
    fill(255,71,54);
    noStroke();
    ellipse(x,y,r,r);
    image(img8, x-19, y-19);
  }
}
  
class slow {
  float x, y; // variables
  float r;
  float xspeed;
     
  slow (){
    x = random(100, width - 200);
    y = random(135, height - 200);
    r = 30;
    xspeed = 1.5;
      
  }
    void move(){
    x += xspeed;
    if (x > width - r/2 || x < r/2){
      xspeed *= -1;
  }
    }
     
  void display(){
    fill(255,71,54);
    noStroke();
    ellipse(x,y,r,r);
    image(img13, x-19, y-19);
  }
}
  
class mean {
  float x, y; // variables
  float r;
  float yspeed;
     
  mean (){
    x = random(100, width - 200);
    y = random(135, height - 200);
    r = 30;
    yspeed = 4;
      
  }
    void move(){
    y += yspeed;
    if (y > height - r/2 || y < 114 + r/2 ){
      yspeed *= -1;
  }
    }
     
  void display(){
    fill(255,71,54);
    noStroke();
    ellipse(x,y,r,r);
    image(img9, x-19, y-19);
  }
}

class boo {
  float x, y; // variables
  float r;
  float yspeed;
      
  boo (){
    x = random(100, width - 200);
    y = random(135, height - 200);
    r = 30;
    yspeed = 6;
       
  }
    void move(){
    y += yspeed;
    if (y > height - r/2 || y < 114 + r/2){
      yspeed *= -1;
  }
    }
      
  void display(){
    fill(255,0,0);
    noStroke();
    ellipse(x,y,r,r);
    image(img14, x-19, y-19);
  }
}
       
    
     
     
class ball {
  float xVel;
  float yVel;
     
  float x;
  float y;
  float speed;
  float r; //radius
  color c = color(215,245,97);
      
        
  ball(float tempX, float tempY, float tempR) {
    x = tempX;
    y = tempY;
    r = tempR;
    speed =0;
     
  }
    void change(){
    c = color(random(255), 245,random(10,119));
    r += 5;
       
  }
    void reset(){
    x = 300;
    y = 575;
    r = 50;
    speed = 0;
 
    }
        
  void display(){
    fill (c);
    noStroke();
    ellipse(x,y,r,r);
    fill(0,0,0,50);
    ellipse(x+3*xVel,y+3*yVel,r-25,r-25);
    fill(255,255,255,245);
    ellipse(x+3*xVel,y+3*yVel,r-30,r-30);
    fill(0);
    ellipse(x+r/10*xVel,y+r/10*yVel,r-r/5*4,r-r/5*4);
    }
    
  void keyPressed() {
    if (key == CODED){
      if (keyCode == UP){
        y = y-2.5;
        yVel = -2.5;
        xVel = 0;
        if(y <= 114 + r/2){
        y = 114 + r/2;
                }
      }
      else if (keyCode == DOWN) {
        y = y +2.5;
        yVel = 2.5;
        xVel = 0;
                if(y >= height-r/2){
        y = height-r/2;
                }
      }
    if (keyCode == RIGHT) {
      x = x+2.5;
      xVel = 2.5;
      yVel = 0;
      if(x >= width - r/2){
      x = width - r/2;
      }
     } 
      else if (keyCode == LEFT) {
      x = x-2.5;
      xVel = -2.5;
      yVel = 0;
      if(x <= r/2){
        x = r/2;
                }
     }
    }
  }
   
     boolean intersect(food f) {
      
    float distance = dist(x,y,f.x,f.y);
    if (distance < f.r+ r/2) {
      return true;
    } else {
      return false;
    }
  }

 
  boolean collides(bad b) {
    float distance = dist(x,y,b.x,b.y);
    if (distance < (r/2 + b.r/2)) {
      b.xspeed = 0;
      return true;
 
    } else {
      return false;
    }
  }
  boolean collides(slow s) {
    float distance = dist(x,y,s.x,s.y);
    if (distance < (r/2 + s.r/2) ) {
      s.xspeed = 0;
      return true;
 
    } else {
      return false;
    }
  }    boolean collides(mean m) {
    float distance = dist(x,y,m.x,m.y); 
    if (distance < (r/2 + m.r/2)) {
      m.yspeed = 0;
      return true;
 
    } else {
      return false;
    }
  }
      boolean collides(boo b) {
    float distance = dist(x,y,b.x,b.y);
    if (distance < (r/2 + b.r/2)) {
      b.yspeed = 0;
      return true;
  
    } else {
      return false;
    }
  }
 
 }
 void stop(){
   song.close();
   song2.close();
   song3.close();
   song4.close();
   minim.stop() ;
   super.stop() ;
}


