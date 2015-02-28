
import ddf.minim.*;
AudioPlayer music;
Minim minim;

PImage[] images = new PImage[5];
float trash1x;
float trash1y;
float trash2x;
float trash2y;
float trash3x;
float trash3y;

float movex1;
float movey1;
float movex2;
float movey2;
float movex3;
float movey3;

float dist1;
float dist2;
float dist3;

void setup() {
  size(800, 500);
  noCursor();
  trash1x = random(0, 800);
  trash1y = random(0, 500);
  trash2x = random(0, 800);
  trash2y = random(0, 500);
  trash3x = random(0, 800);
  trash3y = random(0, 500);
  
  movex1 = random(-10, 10);
  movey1 = random(-10, 10);
  movex2 = random(-10, 10);
  movey2 = random(-10, 10);
  movex3 = random(-10, 10);
  movey3 = random(-10, 10);
  
  images[0] = loadImage("garbage.png");
  images[1] = loadImage("trash1.png");
  images[2] = loadImage("trash2.png");
  images[3] = loadImage("trash3.png");
  images[4] = loadImage("broom.png");
  
  minim = new Minim(this);
  music = minim.loadFile("ilovetrash.mp3", 1024);
  music.loop();
}
  
void draw() {
  image(images[0], 0, 0);
  
  image(images[1], trash1x, trash1y);
  image(images[2], trash2x, trash2y);
  image(images[3], trash3x, trash3y);
  
  image(images[4], mouseX-22, mouseY-210);
  
  dist1 = dist(mouseX, mouseY, trash1x, trash1y);
  if(dist1 < 50){
    trash1x = trash1x + movex1;
    trash1y = trash1y + movey1;
  }
  
  dist2 = dist(mouseX, mouseY, trash2x, trash2y);
  if(dist2 < 50){
    trash2x = trash2x + movex2;
    trash2y = trash2y + movey2;
  }

  dist3 = dist(mouseX, mouseY, trash3x, trash3y);
  if(dist3 < 50){
    trash3x = trash3x + movex3;
    trash3y = trash3y + movey3;
  }   

  if(trash1x < -20 || trash1x > 820 || trash1y < -20 || trash1y > 520){
  trash1x = random(0, 800);
  trash1y = random(0, 500);
  movex1 = random(-10, 10);
  movey1 = random(-10, 10);
  }  
  
  if(trash2x < -20 || trash2x > 820 || trash2y < -20 || trash2y > 520){
  trash2x = random(0, 800);
  trash2y = random(0, 500);
  movex2 = random(-10, 10);
  movey2 = random(-10, 10);
  }  
  
  if(trash3x < -20 || trash3x > 820 || trash3y < -20 || trash3y > 520){
  trash3x = random(0, 800);
  trash3y = random(0, 500);
  movex3 = random(-10, 10);
  movey3 = random(-10, 10);
  }  
}
   
  


  





