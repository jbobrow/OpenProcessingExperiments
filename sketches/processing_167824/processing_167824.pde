
PImage waterfall;
PImage selleckHead;
PImage selleckMouth;
PImage sandwich;
PImage win;
PImage lose;
PImage feed;
PImage selleck;
PImage the;
PImage sandwichtext;
PImage ready;
PImage set;
PImage go;

int y = 100;
int dy = 1;

int time;
int title = 0;
int start = 6500;
int end = 17000; 



void setup(){
  
  size(600, 600);
  feed=loadImage("feed.png");
  selleck=loadImage("selleck.png");
  the=loadImage("the.png");
  sandwichtext=loadImage("sandwichtext.png");
  ready=loadImage("ready.png");
  set=loadImage("set.png");
  go=loadImage("go.png");
  waterfall=loadImage("waterfall.png");
  selleckHead=loadImage("selleckhead.png");
  selleckMouth=loadImage("selleckmouth.png");
  sandwich=loadImage("sandwich.png");
  win=loadImage("winningtext.png");
  lose=loadImage("losingtext.png");

}

void draw(){
  
  //title screen
  if(millis() >= title){
    fill(239, 240, 121);
    rect(0, 0, 600, 600);
    image(feed, 12, 20);
    if(millis() >= (title + 300)){
      image(selleck, 235, 20);
    }
    if(millis() >= (title + 600)){
      image(the, 221, 100);
    }
    if(millis() >= (title + 900)){
      image(sandwichtext, 90, 190);
    }
    if(millis() >= (title + 2000)){
      image(ready, 110, 300);
    }
    if(millis() >= (title + 3500)){
      image(set, 180, 400);
    }
    if(millis() >= (title + 5000)){
    image(go, 214, 500);
    }    
  } 
  
  //game setup
  if(millis() >= start){
  image(waterfall, 0, 0);
 
  //selleck head
  image(selleckHead, 300, 100); 
  
  //selleck chewing
  image(selleckMouth, 300, y);
  y = y + dy;
    if(y <= 100){
      dy = 1;
    }
    if(y >= 200){
      dy = -1;
    }
    }
 
  //sandwich
 if(y >= 160){ 
   image(sandwich, mouseX, mouseY); 
   } 
 else{
   image(sandwich, (mouseX <= 400), mouseY);
 }
 
 
 
 //win
  if((mouseX >= 370) && (mouseY >= 340)){
    fill(255, 0, 0);
    rect(0, 0, 600, 600);
    image(win, 50, 50);
    image(win, 50, 150);
    image(win, 50, 250);
    image(win, 50, 350);
    image(win, 50, 450);
  }
  else{
    noFill();
  }
  
  
  //lose
  if((mouseX < 370) && (millis() >= end)){
    fill(0);
    rect(0, 0, 600, 600);
    fill(240, 121, 232);
    rect(random(0, 600), random(0, 600), 100, 100);
    image(lose, 0, 0);
    if(millis() >= (end + 100)){
      image(lose, 60, 100);
    }
    if(millis() >= (end + 200)){
      image(lose, 250, 15);
    }
    if(millis() >= (end + 300)){
      image(lose, 200, 500);
    }
    if(millis() >= (end + 400)){
      image(lose, 100, 300);
    }
    if(millis() >= (end + 500)){
      image(lose, 160, 450);
    }
    if(millis() >= (end + 600)){
      image(lose, 10, 200);
    }
    if(millis() >= (end + 700)){
      image(lose, 0, 400);
    }
    if(millis() >= (end + 800)){
      image(lose, 350, 190);
    }
    if(millis() >= (end + 900)){
      image(lose, 400, 480);
    }
  }
  else{
    noFill();
  }
 
 
}
  
  


