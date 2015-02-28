
import ddf.minim.*;

AudioPlayer player;
Minim minim;//audio context

PImage bar;
PImage ober;
PImage wijn;

float x, y;

int richting;
int hit = 0;
int miss = 0;
int level = 0;


Cirkel mijnCirkel;
Cirkel mijnCirkel2;
Cirkel mijnCirkel3;

void setup() {
  {
  minim = new Minim(this);
  player = minim.loadFile("bottles.mp3", 2048);
  player.play();
}
 mouseX = 200;
 richting = 7;
 bar = loadImage ("bar.png");
 ober = loadImage ("ober.png");
 //wijn = loadImage ("wijn.png");

  
  size(400,400);
  smooth();
  mijnCirkel = new Cirkel(60, 0, 0, 0, 2);
  mijnCirkel2 = new Cirkel(140,0,0,0,3);
  mijnCirkel3 = new Cirkel(320,0,0,0,4);
  
  

}

void draw() {
  background(255);
  drawBar();
  mijnCirkel.updateCirkel();
  mijnCirkel.testCirkel();
  mijnCirkel.tekenCirkel();
  mijnCirkel2.updateCirkel();
  mijnCirkel2.testCirkel();
  mijnCirkel2.tekenCirkel();
  mijnCirkel3.updateCirkel();
  mijnCirkel3.testCirkel();
  mijnCirkel3.tekenCirkel();

  drawOber();
  

    
    fill(255);
    text ("hit: " + hit, 10, 20);
    text ("miss: " + miss, 9, 40);
    text ("level: " +level, 330, 20);
    text (" Pauze = P", 320, 40);

  //drawFles();
}

boolean bStop;
void keyPressed()
{
  bStop = !bStop;
  if (bStop){
    noLoop();
    fill(0);
    text("Pauze", height/2, width/2);
  }
  else{
    loop();
  }
}

void drawBar () {
  image(bar, 0, 0);
}

void drawOber () {
  image(ober, mouseX-60,250);
}
 

void drawFles() {
  
  image(wijn, x,y);
  
 if (y > height) {
   y = 0;
 }
   if (y == 0) {
     x = random(50,350);

   }
   
     y = y +richting;
}

   



  
//if (image(wijn,x,y) ==   image(ober, mouseX,250)) {
   //  x = 300;
// }
   
// for (int i = 0; i < ober; i++) {
  // for(int k = 0; k < wijn; k++) {
   //  if (ober[i].intersect(wijn[k])){
    //   wijn[k].lose();
   //  }
  // }
 //}
//}
   
  






class Cirkel {
 float x;
 float y;
  int breedte;
  int hoogte;
  int snelheid;
  boolean gameOver = false;
  

  
   Cirkel(int tempX, int tempY, int tempBreedte, int tempHoogte, int tempSnelheid) {
    x= tempX;
    y = tempY;
    breedte = tempBreedte;
    hoogte = tempHoogte;
    snelheid = tempSnelheid;
    wijn = loadImage ("wijn.png");
  }
  
  void updateCirkel () {
    y = y + snelheid;
  }
    
  void testCirkel () {
   
    if(y > width) {
      y = 0;
    }
    
    
    if(y > 200 && x > mouseX-20 && x < mouseX+60) {
     x = random(height);
     y = 0;
     hit += 1;
    }
    
    if (y == 400){
      y = 0;
      miss += 1;
    }
    
     if (hit == 11){
    hit = 0;
    level += 1;
  }
    
  
  if(hit >= 10) {
  y = y + snelheid * 0.2;
  } 
 
 // if(level >= 2) {
  //     y = y + snelheid * 0.2;
  //} 
  
  //if(level >= 3) {
   //    y = y + snelheid * 0.2;
 // }  
  //if(level >= 4) {
    //   y = y + snelheid * 0.2;
  //}  
  //if(level >= 5) {
    //   y = y + snelheid * 0.2;
 // }
  //if(level >= 6) {
    //   y = y + snelheid * 0.2;
  //} 
 // if(level >= 7) {
    //   y = y + snelheid * 0.2;
 /// } 
  //if(level >= 8) {
    //   y = y + snelheid * 0.2;
  //} 
  //if(level >= 9) {
  //     y = y + snelheid * 0.2;
 // }
  //if(level >= 10) {
   //    y = y + snelheid * 0.2;
//  } 
  
 
    if (miss >= 10){
    fill(255,0,0);
    ellipse(10,60,10,10);
    }
     if (miss >= 20){
    fill(255,0,0);
    ellipse(10,60,10,10);
    }
     if (miss >= 30){
    fill(255,0,0);
    ellipse(10,60,10,10);
    }
    
  
    if ( miss == 31 ){
      background(0);
      textAlign(CENTER);
      fill(255);
      text("Game Over", width/2,height/2);
    
    }   
  }
  
  
  
  void tekenCirkel () {
    image(wijn,x,y);
    
  }

  
  
}





