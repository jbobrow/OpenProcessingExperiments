
//A simple video game by Group 7.
//Music: "Also Sprach Zarachustra" by Deodato

import ddf.minim.*;    //for music
Minim minim;
AudioPlayer in;
ship bot;

int score = 0;

float speed=8;
float lives;
float bar = 0;

boolean menu = true;
boolean win = false;
boolean fail = true;
PFont font;
PImage bg;


//an array of 15 target referances
int T=15;
Target[] t = new Target[T];
 
void setup(){
  size(500, 500);
  smooth();
  fill(0);
  stroke(255);
  font = loadFont("BankGothicBT-Medium-48.vlw");
  textFont(font);
  bot = new ship(width/2, height/2, speed);
 
  //instanciate 10 target objects
  for (int i=0;i<T;i++) {
    t[i] = new Target((int)random(width), (int)random(height), (int)random(50)+40);
  }
   //set the frame rate
  frameRate(60);
  bg = loadImage("bg.jpg");
  background(bg);
  
   //play music
  minim = new Minim(this); 
  in = minim.loadFile("bgm.mp3");
  in.play();
  
}
void draw(){
  
  if (menu==true){
    
    if(win==false){
    textSize(20);
    fill(255,70);
    rect(20,70,460,55);
    fill(0);
    text("Group 7 Spaceship Game!",100,100);
    text("Collect all the bubbles",100,300);
    text("before the time runs out.",100,340);
    text("Press any key to play.",100,400);
    fill(255,50);
    rect(0,0,width,height);
    stroke(0);
    }
    
    if (keyPressed == true){
      menu = false;
    }
  }
 
  //refresh the background
  if (menu==false){
    background(bg);
    colorMode(RGB);
    fill(map(bar,0,height-10,0,255),255-map(bar,0,height-10,0,255),0);
    //so that the colour of the energy bar changes with bar length
    rectMode(CORNER);
    rect(5,height-5,5,-height+10+bar);
    bar+=0.5;
  
    bot.fly();

    if (bar >= (height-10)) {
      if (win == false){
        textSize(46);
          score-=10;
    
          if (score<-10 && score>-800){
            background(255);
            strokeWeight(500);
            stroke(255,0,0);
            point(random(width),random(height));
            strokeWeight(300);
            stroke(200,0,0);
            point(random(width),random(height));
           }
    
          fail = true;
    
          if (score<-800){
            fill(255,0,0);
            strokeWeight(random(5)); 
            background(0,20);
            text("Game Over", 110, 150);
            bar=height-10;
            for(int a=0; a<40; a+=1){
              point(random(width),random(height));
            }
          }
          
          if (score<-9000){
            exit();
          }
       }
    }
  }
  
  
  
  //checks to see if all of the bubbles have been hit
 //if it is the game is complete
   if ( int (score) > 14) {
     
    textSize(46);
    menu = true;
    text("Game Complete!", 60, 150);
    bar=height-10;
    win = true;
    }
  
   //for each target
  // draw the target
   
  for (int i=0;i<T;i++) {
    t[i].render();
    t[i].collision(bot.getX(), bot.getY());
    
    t[i].border();
    if (menu == false) { 
       t[i].move();
    }
  }
}


class Target {
  float x=0;
  float y=0;
  float d=0;
  int c=0;
  int m=0;
  float a=0;
  float speed = 6.5;

  
    
  //target constructor
  public Target(float x, float y, float d) {
    this.x=x;
    this.y=y;
    this.d=d;
    c=(int)random(255);
  
    }

  //render function draws the target when it is called
  public void render() {
    colorMode(HSB, 100);
    if (menu==true){
      noFill();
    }
    if (menu==false){
      fill(c,c,c);
    }
    ellipse(x, y, d, d);
  }
  void move() {
    x += random(-speed);
    y += random(-speed);
  }
    
  void border() {
     if (x>width) {
      x=0;
    }
    if (x<0) {
      x=width;
    }
    if (y>height) {
      y=0;
    }
    if (y<0) {
      y=height;
    }
  }
  //collision function tests whether the point passed it is contained in the target
  // if it is the size of the target is collapsed to 0
  public boolean collision(int x, int y) {
    if (dist(this.x, this.y, x, y) < d/2) {
      d=0;
      score +=1;
      return true;
    }
    else {
      return false;
    }
  }
}
  
class ship {
  int x=0;
  int y=0;
  float speed=3;
  float a=0;

  public ship(int x, int y, float speed) {
    this.x=x;
    this.y=y;
    this.speed=speed;
    this.a=a;
  }
  
   //getter funcitons
  public int getX() {
    return x;
  }
  public int getY() {
    return y;
  }

 public void fly() {
    println(keyCode);
    if (keyPressed) {
      if (keyCode == 38) {
        y-=speed;
      }
      if (keyCode == 37) {
        x-=speed;
      }
      if (keyCode == 39) {
        x+=speed;
      }
      if (keyCode == 40) {
        y+=speed;
      }
      if (x>width) {
        x=0;
      }
      if (x<0) {
        x=width;
      }
      if (y>height)
      { 
        y=0;
      }
      if (y<0) {
        y=height;
      }
      triangle(x-5, y+10, x+5, y+10, x, y+20);
    }
    triangle(x-15, y+10, x+15, y+10, x, y-30);
  }

}

void stop()
{
  in.close();
  minim.stop();
  super.stop();
}



