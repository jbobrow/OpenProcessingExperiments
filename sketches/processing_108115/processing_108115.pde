
//import ddf.minim.*;

//Minim minim;
//AudioSnippet player;

float x, y; // X and Y coordinates of image
PImage img, img2;
int time;
int level = 0;

boolean ticklingPoint = false;


void setup() {
  size(700, 500);
  frameRate(60);
  smooth();
  // Create the font
  textFont(createFont("Georgia", 30));
  textAlign(CENTER, CENTER);
  
//  minim = new Minim(this);
//  player = minim.loadSnippet("baby.wav");

  
  noStroke();
  x = width / 2;
  y = height / 2;
  
  img = loadImage("baby_nosmile.gif"); //width 100, height 140
  img2 = loadImage("baby_smile.gif");
}

/*void stop(){
  ticklingPoint = false;
  player.close();
  minim.stop();
  
  super.stop();
}*/



void draw() {
  time++;
  if(time < 700){
    level = 0;
  }else if(time < 1000){
    level = 1;
  }else if(time < 1400){
    level = 2;
  }else if(time < 1700){
    level = 3;
  }
  
  if(level == 0){
    background(0);
    
    // If the cursor is over the baby, tickling - change the position
    if (mouseX >= x && mouseX <= x + 100 
        && mouseY >= y && mouseY <= y + 140 ) {
      background(230,230,0);
      drawPath();
      x += random(-10, 10);
      y += random(-11, 10);
      image(img2, x, y);
      fill(color(random(255),random(255),random(255)));
 /*     player.play();
      int timeDelay = time + 100;
      if(time == timeDelay)
        player.rewind();
 */   }
    else {
      image(img, x, y);
      fill(255);
    }
    
   
    text("tickle", x + 10, y + 150);
    
  }else if(level ==1){
      fill(10);
      rect(0,0, width, height);
      fill(255);
      textSize(20);
      text("How many times do you smile a day?", width/2, 300);
   
  }else if(level ==2){
      fill(10);
      rect(0,0, width, height);
      fill(255);
      textSize(20);
      text("Happiness is nothing special.", width/2, 300);
   
  }else if(level ==3){
      fill(10);
      rect(0,0, width, height);
      fill(255);
      textSize(22);
      text("Smile. It will bring you a gift of happiness.", width/2, 300);
  }
  
}

void drawPath(){
  fill(150,100,0);
  rect(x, y, 100, 140);
  
}


