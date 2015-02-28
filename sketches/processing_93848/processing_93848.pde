
import ddf.minim.*;
AudioPlayer music;
Minim minim;

PFont font;
PImage background;
PImage TheMan;
PImage Villager;
PImage Villager2;
PImage Villager3;

int killcount = 0;
int distRadius = 20;
float timer=60;
float timeLast = 0;

float themanX = 0;
float themanY = 215;
float themanSpeed = 5;
 
float vilx = 630;
float vily = 250;
 
float vila = 640;
float vilb = 240;
 
float vilc = 650;
float vild = 260;
 
float vile = 630;
float vilf = 260;
 
float vilg = 620;
float vilh = 234;
 
float vili = 645;
float vilj = 260;
 
float vilk = 630;
float vill = 250;
 
float vilm = 630;
float viln = 250;


void setup () {
  
  size(800,350);
  stroke(#FF0000);
  strokeWeight(3);
  frameRate(40);
  timeLast=second();
  
  TheMan = loadImage("cagedevil.png");
  Villager = loadImage("Villager.png");
  Villager2 = loadImage("Villager2.png");
  Villager3 = loadImage("Villager3.png");
  background = loadImage("Frankenstein castle.jpg");
  
  minim = new Minim(this);
  music = minim.loadFile("06 - Vampira.mp3", 1024);
  music.loop();
  
}
 
void draw() {
  
    if( timer > 0)
{
  timer -=0.017;}
  else timer =0;
  
  background(background);
  
  image(background,0,0);
  image(TheMan,themanX,themanY);
  
  vilx -= 1;
  vila -= 3;
  vilc -= 4;
  vile -= 3;
  vilg -= 7;
  vili -= 5;
  vilk -= 5;
  vilm -= 6;
  
  image(Villager,vilx,vily);
  image(Villager,vila,vilb);
  image(Villager,vilc,vild);
  image(Villager,vile,vilf);
  image(Villager,vilg,vilh);
  image(Villager,vili,vilj);
  image(Villager,vilk,vill);
  image(Villager,vilm,viln);

  if (mousePressed == true) {
    
    if (dist(mouseX, mouseY, vilx + (Villager.width / 2), vily + (Villager.height / 2))<distRadius) {
      killcount++;
      vilx = 800;
      vily = random(300);
    }
    if (dist(mouseX, mouseY, vila + (Villager.width / 2), vilb + (Villager.height / 2))<distRadius) {
      killcount++;
      vila = 800;
      vilb = random(300);
    }
     
    if (dist(mouseX, mouseY, vilc + (Villager.width / 2), vild + (Villager.height / 2))<distRadius) {
      killcount++;
      vilc = 800;
      vild = random(300);
    }
     
    if (dist(mouseX, mouseY, vile + (Villager.width / 2), vilf + (Villager.height / 2))<distRadius) {
     killcount++; 
      vile = 800;
      vilf = random(300);
    }
     
    if (dist(mouseX, mouseY, vilg + (Villager.width / 2), vilh + (Villager.height / 2))<distRadius) {
      killcount++;
      vilg = 800;
      vilh = random(300);
    }
      
    if (dist(mouseX, mouseY, vili + (Villager.width / 2), vilj + (Villager.height / 2))<distRadius) {
      killcount++;
      vili = 800;
      vilj = random(300);
    }
     
    if (dist(mouseX, mouseY, vilk + (Villager.width / 2), vill + (Villager.height / 2))<distRadius) {
      killcount++;
      vilk = 800;
      vill = random(300);
    }
   
    if (dist(mouseX, mouseY, vilm + (Villager.width / 2), viln + (Villager.height / 2))<distRadius) {
      killcount++;
      vilm = 800;
      viln = random(300);
    }
    
    line(mouseX,mouseY,themanX + 85, themanY + 37);
    line(mouseX,mouseY,themanX + 118,themanY + 50);
    
  }


  if (keyPressed) {
  
    if (key == 'w' || keyCode == UP) {
      themanY -= themanSpeed;
    }
    
    if (key == 'a' || keyCode == LEFT) {
      themanX -= themanSpeed;
    }
    
    if (key == 's' || keyCode == DOWN) {
      themanY += themanSpeed;
    }
    
    if (key == 'd' || keyCode == RIGHT) {
     themanX += themanSpeed; 
    }
  
  }
  
  text(killcount + " kills", 25, 25);
  text("Timer: "+ (int)timer, 100, 25); 
 if(timer==0)
  { 
    
    fill(0,0,0);
    rect(0,0,800,350);
    fill(5,255,3);
    text("Game Over",355,175);
  }
}




