
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim m;
AudioPlayer rain;

PGraphics rainGfx;


int nr = 4;
int dr = 160;
float fadeSpeed = 100;

Cloud clouds[] = new Cloud[4];
Rain drops[] = new Rain[dr];

void setup() {
  size(700,400);

  rainGfx = createGraphics(width,height, P2D);

  m = new Minim(this);
  rain = m.loadFile("rain_1.mp3");

  smooth();

  int i = 0;

  while(i < 4) {

    clouds[i] = new Cloud((i+1)*(width/4), 70, 0.1, 60, 45);
    drops[i] = new Rain((i+1)*(width/4),50,0.1,0);

    i++;
  }

  stroke(255);
}



void draw() {

  int i = 0;

PImage b;
b = loadImage("sky.jpg");
image(b, 0, 0);
image(rainGfx,0,0);
fadeRain();
  while(i < nr) {
    if(mouseY > clouds[i].yPos-50 && mouseY < clouds[i].yPos+50) {
      float d = dist(mouseX,0,clouds[i].xPos,0);
      float t = map(d,0,300,125,255);
      int numdrops =  (int)map(d,0,300,100,0);
      color c = color(t);
      clouds[i].drawCloud(c);
      
            rain.play();
      if(!rain.isPlaying()){
        rain.loop();
      }
      

        drops[i].drawRainDrops(numdrops);
       // dr = 100;
      //}
      
    }
    else {
      clouds[i].drawCloud(255);

    }
    clouds[i].fly();

    drops[i].Move();


    i++;
  }

 }   

void fadeRain(){
  
 rainGfx.loadPixels();

 for(int i = 0; i < rainGfx.pixels.length; i++){
  rainGfx.pixels[i] = color(red(rainGfx.pixels[i]),green(rainGfx.pixels[i]),blue(rainGfx.pixels[i]),max(alpha(rainGfx.pixels[i])-fadeSpeed, 0));
 } 
  
  
  rainGfx.updatePixels();
}

class Cloud {

  float xStore[] = new float[20];
  float yStore[] = new float[20];
  float s1Store[] = new float[20];
  float s2Store[] = new float[20];

  float xPos;
  float yPos;
  float wind;
  float size1;
  float size2;

  Cloud(float x, float y, float w, float s1, float s2) {

    xPos = x;
    yPos = y;
    wind = w;
    size1 = s1;
    size2 = s2;

    int i = 0;

    while(i < 20) {

      xStore[i] = random(-50,50);
      yStore[i] = random(-20,20);
      s1Store[i] = random(55,60);
      s2Store[i] = random(55,60);

      i++;
    }
  }

  void fly() {

    xPos = xPos+wind;

    if (xPos > width) {
      xPos = 0;
    }
  }

  void drawCloud(color col) {

    int i = 0;

    fill(col, 220);
    noStroke();

    while(i < 20) {

      ellipse(xPos+xStore[i], yPos+yStore[i], s1Store[i], s2Store[i]); 

      i++;
    }
  }
} 

class Rain {

  float xStore[] = new float[dr];
  float yStore[] = new float[dr];
  float speed[] = new float[dr];

  float dropX;
  float dropY;
  float windRain;
  float gravity;

  Rain(float x, float y, float r, float g) {
    
    dropX = x;
    dropY = y;
    windRain = r;
    gravity = g;


    int i = 0;
    
    while(i < dr) {

      xStore[i] = random(-50,50);
      yStore[i] = random(-20,20);
      speed[i] = random(6,15);

      i++;
    }
  }


  void Move() {

    int i = 0;

    while(i < dr) {

      yStore[i] += speed[i];

      if ( yStore[i] > height) {
        yStore[i] = 50;
      }
      i++;
    }

    dropX = dropX+windRain;

    if (dropX > width) {
      dropX = 0;
    }
  }

  void drawRainDrops(int numdrops) {
    rainGfx.beginDraw();
    int i = 0;    
    rainGfx.stroke(50,46,255,130);
   // rainGfx.noStroke();

    while(i < numdrops) {

      rainGfx.line(dropX+xStore[i],dropY+yStore[i],dropX+xStore[i],dropY+yStore[i]-speed[i]);

      i++;
    }
    
    rainGfx.endDraw();
  }
}


