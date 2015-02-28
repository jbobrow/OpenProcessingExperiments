
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim m;
AudioPlayer rain;
Minim so;
AudioPlayer wind;
Minim ki;
AudioPlayer lightning;

PGraphics rainGfx;


int nr = 4;
int dr = 160;
float fadeSpeed = 100;
float count = 0;

int ex = 750;
int ey = height/2;

Cloud clouds[] = new Cloud[4];
Rain drops[] = new Rain[dr];
Heli helic = new Heli(740, 260, 50, 740, 330, 0.0, 255, 0, 0, 0);

void setup() {
  size(700, 400);

  rainGfx = createGraphics(width, height, P2D);

  m = new Minim(this);
  rain = m.loadFile("rain_1.mp3");
  so = new Minim(this);
  wind = so.loadFile("Wind.mp3");
  ki = new Minim(this);
  lightning = ki.loadFile("lightning.wav");

  smooth();

  int i = 0;

  while (i < 4) {

    clouds[i] = new Cloud((i+1)*(width/4), 70, 0.3, 60, 45);
    drops[i] = new Rain((i+1)*(width/4), 50, 0.3, 0);

    i++;
  }


  stroke(255);
}



void draw() {

  wind.play();
  if (!wind.isPlaying()) {
    //    wind.pause();   ?
    //    wind.rewind();  ?
    wind.loop();
  }

  int i = 0;

  PImage b;
  b = loadImage("sky.jpg");
  image(b, 0, 0);

  count++;

  if (mouseY > clouds[i].yPos-50 && mouseY < clouds[i].yPos+50) {

    if (count > 2) {

      lightning.play();

      //    if(lightning.isPlaying()){
      //    lightning.pause();
      //    lightning.rewind();
      //    }

      PImage t;
      t = loadImage("lightning2.jpg");
      image(t, 0, 0);
    }

    if (count > 4) {
      count = 3;  
      PImage s;
      s = loadImage("greysky.jpg");
      image(s, 0, 0);
    }
  }   

  image(rainGfx, 0, 0);
  fadeRain();
  while (i < nr) {

    if (mouseY > clouds[i].yPos-50 && mouseY < clouds[i].yPos+50) {

      float d = dist(mouseX, 0, clouds[i].xPos, 0);
      float t = map(d, 0, 300, 125, 255);
      int numdrops =  (int)map(d, 0, 300, 160, 0);
      color c = color(t);
      clouds[i].drawCloud(c);


      if (!rain.isPlaying()) {
        rain.loop();
      }
      drops[i].drawRainDrops(numdrops);
    }
    else {
      clouds[i].drawCloud(255);
      rain.pause();
      rain.rewind();
    }
    clouds[i].fly();

    drops[i].Move();

    helic.Go();

    helic.drawHeli();

    //    helic.Rotation();

    i++;
  }
}   

void fadeRain() {

  rainGfx.loadPixels();

  for (int i = 0; i < rainGfx.pixels.length; i++) {
    rainGfx.pixels[i] = color(red(rainGfx.pixels[i]), green(rainGfx.pixels[i]), blue(rainGfx.pixels[i]), max(alpha(rainGfx.pixels[i])-fadeSpeed, 0));
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

    while (i < 20) {

      xStore[i] = random(-50, 50);
      yStore[i] = random(-20, 20);
      s1Store[i] = random(55, 60);
      s2Store[i] = random(55, 60);

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

    while (i < 20) {

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

    while (i < dr) {

      xStore[i] = random(-50, 50);
      yStore[i] = random(-20, 20);
      speed[i] = random(6, 15);

      i++;
    }
  }


  void Move() {

    int i = 0;

    while (i < dr) {

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
    rainGfx.stroke(50, 46, 255, 130);
    rainGfx.strokeWeight(0.3);

    while (i < numdrops) {

      rainGfx.line(dropX+xStore[i], dropY+yStore[i], dropX+xStore[i], dropY+yStore[i]-speed[i]);

      i++;
    }

    rainGfx.endDraw();
  }
}

class Heli {

  float heliX;
  float heliY;
  float heliS;

  float heliceX;
  float heliceY;
  float rotating;

  float filly;
  float filly2;
  float filly3;
  
  float end;

  Heli(float ex, float ey, float es, float hx, float hy, float rt, float fl, float fl2, float fl3, float ed) {

    heliX = ex;
    heliY = ey;
    heliS = es;

    heliceX = hx;
    heliceY = hy;
    rotating = rt;

    filly = fl;
    filly2 = fl2;
    filly3 = fl3;
    
    end = ed;
  }  

  void Go() {

    heliX = heliX-5;
    if (heliX < -40) {
      heliX = 740;
      filly = 0;

if (heliX < -40) {
  
  end = end + 1;
}  
  
      if (end == 1) {
        filly3 = 255;
      } 
      if (end == 2) { 
        filly = 255;
      } 
      if (end == 3) {
        filly3 = 0;
      }
      if (end == 3){
        end = 0;
    }
  }
}
  void drawHeli() {

    stroke(0, 85);
    line(heliX, heliY, heliX, heliY+80);
    noStroke();
    fill(filly, filly2, filly3, 60);
    ellipse(heliX, heliY, heliS, heliS);
    fill(0, 80);
    ellipse(heliX, heliY, 15, 15);
  }

  /*  void Rotation(){
   
   translate(heliceX, heliceY);
   rotate(rotating);
   line(-16, -16, 16, 16);
   
   rotating = rotating + dist(mouseX,mouseY,heliceX,heliceY)/10.0;  
   heliceX = heliceX - 1;
   
   }
   */
}


