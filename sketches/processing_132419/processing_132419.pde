
PImage bg;


void setup()
{
  size(600,400);
  bg = loadImage("PONG.jpg");
  
  //Audio
  minim = new Minim(this);
  player = minim.loadFile("daftpunk8bit.mp3", 2048);
  player.play();
} 




void draw()
{
 background (bg);
 
//Oproepbare objecten
 teller();
 balletje();

 
//Reset
  if(mousePressed) { raak = 0; mis = 0; }

//Per hit wordt de breedte kleiner
  float paddle = 1000/(raak+10);
  
//De code
  if(ballX < 0 || ballX > width) speedX = -speedX;
  if(ballY > height){
    speedY = -speedY;
    float distance = abs(mouseX - ballX);
    if(distance < paddle) raak += 1;
    else mis += 1;
  } else speedY += 1;
  
  ballX += speedX;
  ballY += speedY;
  
//Balkje  
 fill(120);
 rect(mouseX-paddle,height-10, 2*paddle,10); 
}


//Audio
import ddf.minim.*;
AudioPlayer player;
Minim minim;


void stop()
{
  player.close();
  minim.stop();
  super.stop();
}
void balletje()
{

   fill(200,100,50);
 ellipse(ballX, ballY, 50, 50);
}

 void teller ()
 {
 fill(200);
 text("Raak: " + raak, 10 ,20);
 text("Mis: " + mis, 10, 40);
}
//Positie balletje
float ballX = 200;
float ballY = 100;
//Snelheid
float speedX = 9;
float speedY = 0;
//Standaarwaarden
int raak = 0;
int mis = 0;


