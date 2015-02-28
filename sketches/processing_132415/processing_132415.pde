
int hit;
int miss;
int level;
float heartY;
float heartX;
float heartSpeed;
float paddle;
PImage imgHeart; 
PImage bg;
PImage burger;
PImage spongebob;
int levensX;
boolean hartje;
int stop;
int spatie;
import ddf.minim.*;

AudioPlayer player;
Minim minim;//audio context

ball gameBall;
ball gameBall2;
ball gameBall3;
ball gameBall4;
void setup(){
 size(800,600); 
 paddle = 65;
 hit = 0;
 miss = 5;
 level = 1;
 stop = 250;
 spatie = 50;
 heartY = 0;
 heartX = random(width-100);
 heartSpeed = random(10);
 hartje = false;
 
 
  imgHeart = loadImage("8-bit-heart.png"); // het laden van het plaatje (dit moet in de data map staan)
  bg = loadImage("achtergrond.jpg"); // het laden van de achtergrond
  burger = loadImage("burger.png"); // het laden van de hamburger afbeelding
  spongebob = loadImage("spongebob.png"); // het laden van spongebob
  
  minim = new Minim(this);
  player = minim.loadFile("muziek.mp3", 3000);
  player.play();
  player.loop();
  
 gameBall = new ball();
 gameBall2 = new ball();
 gameBall3 = new ball();
 gameBall4 = new ball();
}

void draw(){
  background(bg);
  for(int i=0; i<stop; i=i+spatie){
    levens(i);}
  if( hit == 60 || hit == 80 || hit == 100 || hit == 110 || hit == 120 || hit == 130 || hit == 140) hartje = true;
  if(hartje == true) heart();
  gameBall.updateBall();
  gameBall.score();
  gameBall.testBall();
  gameBall.drawBall();
  
  if(hit > 20){ // zodra je een score hebt die hoger is dan 20 krijg je er een tweede bal bij
  gameBall2.updateBall();
  gameBall2.testBall();
  gameBall2.drawBall();
  gameBall2.score();}
  if(hit == 20){ level = 2; stop=300; miss = 6;} // bij een score van 20 ga je naar level 2 en de levens worden gereset naar 6
  if(hit > 90){ // zodra je een score hebt die hoger is dan 90 krijg je er een derde bal bij
  gameBall3.updateBall();
  gameBall3.testBall();
  gameBall3.drawBall();
  gameBall3.score();}  
  if(hit == 90){ level = 3; stop = 400; miss = 8;}
  if(hit > 200){// zodra je een score hebt die hoger is dan 200 krijg je er een vierde bal bij
  gameBall4.updateBall();
  gameBall4.testBall();
  gameBall4.drawBall();
  gameBall4.score();}
  if(hit == 200){ level = 4; stop = 500; miss = 12;}
  
 image(spongebob, mouseX-paddle, height-100); // de paddle 
 fill(0);
  text("Score: " + hit, 20, 70);
  text("Level: " + level, width-100, 50);
  text("Press P to pause the game", 300,10);
  gameover();
  }
  
void keyPressed() {
  final int k = keyCode;

  if (k == 'P')
    if (looping){  noLoop(); // zodra je op P druk stop de draw en staat het spel op "pauze"
    background(bg);// achtergrond opnieuw tekenen zodat eerder geprinte tekst weg gaat
    fill(255);
    rect((width/2)-200,(height/2)-50, 400, 100);
    fill(0);
    text("Game is paused, press P to unpause", (width/2)-100, (height/2));
    for(int i=0; i<stop; i=i+spatie){
    levens(i);}
} 
    else          loop();  // zodra je op P drukt als de draw al op pauze staat gaat het spel weer verder
    
}
void levens(int levensX){
  image ( imgHeart, levensX,0);
  
}
void gameover(){
 if(miss<=0){
  noLoop();
  background(bg);
  fill(255);
  rect((width/2)-200,(height/2)-50, 400, 100);
  fill(0);
  text("Game Over! Your score was: "+ hit, (width/2)-80, (height/2));
 } 
}
 void heart(){
   image ( imgHeart, heartX,heartY);
   heartY = heartY + heartSpeed;
   if( heartY > height-100 && heartX > mouseX-paddle && heartX < mouseX+paddle) {miss += 1; stop += 50; heartY=0; heartX=random(width)-100; hartje=false;}
   if( heartY > height ) hartje = false;
   if(heartSpeed < 2)heartSpeed = 2;
 }
 
class ball{
float ballX;
float ballY;
float Speed;

ball(){
  ballY = 0;
  heartY = 0;
  heartX = random(width-100);
  ballX = random(700);
 Speed = random(10);
 
 }
  
  void updateBall(){
   ballY = ballY + Speed; 
  }
  
  void testBall(){
    if( ballY > height+10){ ballY= 0; ballX= random(width-100); Speed = random(10);}
    if(Speed < 3)Speed = 3;
  }
  
 void drawBall(){
  image(burger, ballX, ballY);
 }
  void score(){
    if( ballY > height-100 && ballX > mouseX-paddle && ballX < mouseX+paddle) { hit += 1; ballY=0; ballX= random(width-100); Speed= random(10);} // zodra de burger onder spongebob is komt en wel binnen de breedte van spongebob komt er een punt bij en wordt de burger gereset
    if( ballY > height ) { miss -= 1; stop-=50; ballY=0; ballX= random(width-100); Speed= random(10);}
    
  }

}
void stop()
{
  player.close();
  minim.stop();
  super.stop();
}


