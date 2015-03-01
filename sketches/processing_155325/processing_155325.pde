
import ddf.minim.*;
AudioPlayer music;

Minim minim;

PImage bird;
PImage pipe;
PImage background;
PImage ground;
PImage playbutton;
PImage scorebutton;
PImage menu;
PImage emptytrophy;
PImage bronzetrophy;
PImage silvertrophy;
PImage goldtrophy;
boolean start;
boolean scoreboard;
PImage scores;
int score;
int scorediv;
int groundspeed;

int numFrames = 4;  // The number of frames in the animation
int currentFrame = 0;
PImage[] images = new PImage[numFrames];

void setup(){
  minim = new Minim(this);
  music = minim.loadFile("Leek Spin.mp3", 2048);
  music.loop();
  
  
//birdframes

  images[0]  = loadImage("playersprites/flappy-1.png");
  images[1]  = loadImage("playersprites/flappy-2.png"); 
  images[2]  = loadImage("playersprites/flappy-3.png");
  images[3]  = loadImage("playersprites/flappy-4.png"); 
  images[0].resize(184,138);
  images[1].resize(184,138); 
  images[2].resize(184,138);
  images[3].resize(184,138);


//birdframes

//font
PFont titles;
titles = loadFont("04b19-48.vlw");
textFont(titles);
//font

emptytrophy = loadImage("empty trophy.png");
bronzetrophy = loadImage("bronze trophy.png");
silvertrophy = loadImage("silver trophy.png");
goldtrophy = loadImage("gold trophy.png");
emptytrophy.resize(106,106);
bronzetrophy.resize(106,106);
silvertrophy.resize(106,106);
goldtrophy.resize(106,106);

groundspeed = 15;
start = false;
score = 0;
scorediv = 0;
scoreboard = false;
scores = loadImage("scoreboard.png");
scores.resize(193,343);
playbutton = loadImage("play.png");
scorebutton = loadImage("scores.png");
menu = loadImage("menu.png");

if(displayHeight > 900 && displayWidth<=1500){
size(displayWidth, 900);
}
if(displayHeight > 900 && displayWidth>1500){
size(1500, 900);
}
if(displayHeight <= 900 && displayWidth<=1500){
size(displayWidth, displayHeight);
}
if(displayHeight <= 900 && displayWidth>1500){
size(1500, displayHeight);
}

System.out.println("width: " +displayWidth + "height: " + displayHeight);


bird = loadImage("bird.png");
bird.resize(98,69);
pipe = loadImage("pipe.png");
background = loadImage("background.png");
int mult = background.height/height;
background.resize(background.width * mult, height);
ground = loadImage("ground.png");
ground.resize(720,139);

}

void draw(){
  backgrounds();
  starter();
  pipescroll2();
  pipescroll();
  ground();
  scoreboard();
  pipehit();  
  drawscore();
  fall();
  scorediv = score/13;
  
}

void stop(){
  music.close();
  minim.stop();
  super.stop();
}

void backgrounds(){
  int backgrounds = width/background.width;
  for(int i = 0; i <= backgrounds; i++){
    image(background,background.width * i,0);
  }
}

int pipex = 0;
int randnumber = randomnumber();
void pipescroll(){
  if(pipex - pipe.width <= width && start == true){
  image(pipe,width - pipex,height - pipe.height + randnumber);
pipex+= groundspeed;
}else{
  randnumber = randomnumber();
  pipex = 0;
  
  }

}

int pipe2x = 0;
int spawnable = 0;

int randnumber2 = randomnumber();
void pipescroll2(){
if(pipe2x - pipe.width <= width && spawnable >= width/2 + pipe.width/2 && start == true){
  image(pipe,width - pipe2x,height - pipe.height + randnumber2);
  
  pipe2x+= groundspeed;}else{
  randnumber2 = randomnumber();
  pipe2x = 0;
  if(start==true){spawnable += groundspeed;}
  
  }

}

int randomnumber(){
float randomNum = random(-125,150);
return (int)randomNum;
}


void ground(){
  
  int grounds = width/ground.width + 1;
  //System.out.println("grounds: " + grounds); 

  for(int i = 0; i < grounds; i++){
  image(ground,ground.width * i,height - ground.height);
  }
}


float fallSpeed = 0;
float birdposy = height/2;
int speed = 0;
void fall(){
  //Print bird
  if(scoreboard == true && start==false){
  birdposy = 0;
  }
  
  
  if(start==true){
  rotate((radians(0)));
  translate(150,birdposy);
  if(fallSpeed > 0){rotate((radians(fallSpeed * 2.3)));}
  
  if(speed%6==0){
  currentFrame = (currentFrame+1) % numFrames;
}
  speed++;
  for (int x = -100; x < width; x += images[0].width) { 
    image(images[(currentFrame) % numFrames], 0, 0);
  }
  //image(bird, 150, 0);


}
  
  if(fallSpeed<=30 && birdposy < height){
    fallSpeed+=1.5;
}

 if(birdposy >= height-ground.height){
   fallSpeed = 0;
   scoreboard = true;
   cursor(ARROW);
 }

  if(start==true){birdposy += fallSpeed;}
  if(birdposy < 0){birdposy = 0; fallSpeed = 0;}
}

int pressed = 0;

void keyPressed(){
  if(key==' '){
    if(pressed < 1){
    jump();
    pressed++;
  }
  } 
  
  
  
}

void keyReleased(){
  pressed = 0;
}

void jump(){
  fallSpeed = -15;
}
void starter(){

  if(start==false && scoreboard ==false){
  image(playbutton,width/2-playbutton.width/2 - playbutton.width,height/2-playbutton.height/2);
  image(scorebutton,width/2-scorebutton.width/2 + scorebutton.width,height/2-scorebutton.height/2);
  
  String end = "Flappy Bird";
  textSize(100);
  text(end, width/2 - (textWidth(end)/2), height/2 - scorebutton.height);
  
  if(((mouseX > width/2-playbutton.width/2 - playbutton.width && mouseX < width/2-playbutton.width/2) && (mouseY > height/2-playbutton.height/2 && mouseY < (height/2) + playbutton.height/2))  || ((mouseX > width/2+scorebutton.width/2 && mouseX < width/2+scorebutton.width + scorebutton.width/2) && (mouseY > height/2-scorebutton.height/2 && mouseY < (height/2) + scorebutton.height/2))){
  if(mousePressed && ((mouseX > width/2-playbutton.width/2 - playbutton.width && mouseX < width/2-playbutton.width/2) && (mouseY > height/2-playbutton.height/2 && mouseY < (height/2) + playbutton.height/2))){
  noCursor();
  score = 0;
  start = true;
  }
  if(mousePressed && ((mouseX > width/2+scorebutton.width/2 && mouseX < width/2+scorebutton.width + scorebutton.width/2) && (mouseY > height/2-scorebutton.height/2 && mouseY < (height/2) + scorebutton.height/2))){
  
  cursor(ARROW);
  backgrounds();
  scoreboard = true;
}
  
}else{cursor(ARROW);}
  
}
}
int num = 1;
void scoreboard(){

  if(scoreboard==true){
    start = false;
    textSize(75);
    String end = "Game Over";
    text(end, width/2 - (textWidth(end)/2), height/2 - 300);
    image(scores, width/2 - (scores.width/2),height/2 - (scores.height/2) - 75);
    textSize(50);
    String scoresay = "Score:";
    text(scoresay, width/2 - (textWidth(scoresay)/2), height/2 - 180);
    String strg = Integer.toString(scorediv);
    text(strg, width/2 - (textWidth(strg)/2), height/2 - 130);
    //gui
    image(menu, width/2 + menu.width/2, height/2 + 150); 
    image(playbutton,width/2 - playbutton.width - playbutton.width/2, height/2 + 150);
    //INSANE TESTFORS
    
    
  if((mouseX > width/2-playbutton.width - playbutton.width/2 && mouseX < width/2 - playbutton.width/2) && (mouseY > height/2 + 150 && mouseY < height/2 + 150 + playbutton.height)  || ((mouseX > width/2 + menu.width/2 && mouseX < width/2 + menu.width/2 + menu.width) && (mouseY > height/2 + 150 && mouseY < height/2 + 150 + menu.height))){
  if(mousePressed && ((mouseX > width/2-playbutton.width - playbutton.width/2 && mouseX < width/2 - playbutton.width/2) && (mouseY > height/2 + 150 && mouseY < height/2 + 150 + playbutton.height))){
  noCursor();
  pipex = 0;
  pipe2x = 0;
  spawnable = 0;
  score = 0;
  start = true;
  scoreboard = false;
  }
  if(mousePressed && ((mouseX > width/2 + menu.width/2 && mouseX < width/2 + menu.width/2 + menu.width) && (mouseY > height/2 + 150 && mouseY < height/2 + 150 + menu.height))){
  //cursor(ARROW);
  pipex = 0;
  pipe2x = 0;
  spawnable = 0;
  scoreboard = false;
  
}
  
}else{
cursor(ARROW);
}
    
    //INSANE TESTFORS
    
    //TROPHY
    if(scorediv < 10){
    image(emptytrophy, width/2 - (emptytrophy.width/2), height/2 - 90);
    }
    if(scorediv > 9 && scorediv < 50){
    image(bronzetrophy, width/2 - (emptytrophy.width/2), height/2 - 90);
    }
    if(scorediv > 49 && scorediv < 100){
    image(silvertrophy, width/2 - (emptytrophy.width/2), height/2 - 90);
    }
    if(scorediv > 100){
    image(goldtrophy, width/2 - (emptytrophy.width/2), height/2 - 90);
    }
    
  }
}

void pipehit(){

  if(start==true && scoreboard==false){
    if(pipex < width && pipex > width-pipe.width){
      if(birdposy > (height - pipe.height + randnumber + 376) && birdposy < (height - pipe.height + randnumber + 550)){score++;}
      if((birdposy < (height - pipe.height + randnumber + 376) || birdposy > (height - pipe.height + randnumber + 550))){scoreboard = true; cursor(ARROW);}
    }
    if(pipe2x < width && pipe2x > width-pipe.width){
      if(birdposy > (height - pipe.height + randnumber2 + 376) && birdposy < (height - pipe.height + randnumber2 + 550)){score++;}
      if((birdposy < (height - pipe.height + randnumber2 + 376) || birdposy > (height - pipe.height + randnumber2 + 550))){scoreboard = true; cursor(ARROW);}
    }

  }

}

void drawscore(){
  if(start==true){
  textSize(100);
  text("Score: " + scorediv, 10,90);}
  
}



