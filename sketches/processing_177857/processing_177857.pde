
/* @pjs preload="bg.png"; */
/* @pjs preload="seasonsGreetings.png"; */

Snow[] snowflakes;

PImage bg;
PImage soc;
PImage star;
int stop_snow;

int sec;
int prev_sec;
int no_secs;

int temp;

int imgY;

void setup(){
  size(1000,600);
  
  // load images
  bg = loadImage("bg.png");
  soc = loadImage("seasonsGreetings.png");
  star = loadImage("star.png");
  
  snowflakes = new Snow[200];
  
  // create snowflakes
  for(int i=0; i<200; i++){
    snowflakes[i] = new Snow();
    
  }
  
  // set the timer values;
  sec = second();
  prev_sec = second();
  no_secs = 0;
  
  // when snow should stop
  stop_snow = 5;
  
  // position of message
  imgY = -500;
  //image(soc,300,imgY,583,420);  // initial load
  image(star,113,152,65,55);
  temp = 0;
  
  
  for(int j=0; j<2000; j++){
    ellipse(random(0.1000),random(550,600), 5,5);
  }
}

void draw(){
  
  // image shows snow on ground
  image(bg,0,0,1000,600);

  // check each second
  // if different to previous count a second
  prev_sec = sec;
  sec = second();
  if(sec!=prev_sec){
    no_secs++;
  }

  // once snow has fallen for a set no of seconds
  // stop the snowflakes
  
  if(no_secs>=stop_snow){
    for(int i=0; i<snowflakes.length; i++){
      snowflakes[i].stopFalling();
    }
    //change_background=true;
  }
  
  
  // falling snowflakes
  
  for(int i=0; i<200; i++){
    snowflakes[i].display();
    snowflakes[i].drop();
  }
  

  // some time after the snow stops display a message
  
  if(no_secs>=stop_snow){
    fill(0);
    stroke(0);
   // text("Merry Christmas", 100,100);
   image(soc,300,imgY,583,420);
   if(imgY<75){imgY++;}
  }
  
  
  //println(mouseX + " " + mouseY);
}
  
  
  
  class Snow{
  
  float x;
  float y;
  float diameter;
  color c;
  float xMove;
  float yMove;
  boolean fall;
  
  Snow(){
    x = random(0,1000);
    y = random(0,600);
    diameter = random(3,10);
    c = color(255);
    xMove = random (-1, 1); 
    yMove = random(1,5);
    fall = true;
  }
  
  void display(){
    stroke(255);
    fill(255);
    ellipse(x,y,diameter,diameter);
  }
  
  void drop(){
    x = x + xMove;
    y = y + yMove;
    if(y>600 && fall == true){
      x = random(0,1000);
      y = -5;
    }
    
  }
  
  
  void stopFalling(){
    fall = false;
  }
  
  
}


