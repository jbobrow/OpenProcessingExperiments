
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
Minim hel;
AudioPlayer helice;
Minim fhel;
AudioPlayer fast_helice;
Minim shel;
AudioPlayer slow_helice;

PGraphics rainGfx;


int LIGHTNING_DURATION = 5;


PImage t;
PImage s;
int nr = 4;
int dr = 160;
float fadeSpeed = 100;
float count = 0;

int ex = 750;
int ey = height/2;

float inc = 0;
float inc2 = 0;

int lightningPlay = 0;

Cloud clouds[] = new Cloud[4];
Rain drops[] = new Rain[dr];
Heli helic = new Heli(740, 260, 35, 740, 330, 0.0, 0, 1);

void setup() {
  size(700, 400);

  t = loadImage("lightning2.jpg");
  s = loadImage("greysky.jpg");

  rainGfx = createGraphics(width, height, P2D);

  m = new Minim(this);
  rain = m.loadFile("rain_1.mp3");
  so = new Minim(this);
  wind = so.loadFile("Wind.mp3");
  ki = new Minim(this);
  lightning = ki.loadFile("lightning.wav");
  hel = new Minim(this);
  helice = hel.loadFile("helice.wav");
  fhel = new Minim(this);
  fast_helice = fhel.loadFile("fast_helice.wav");
  shel = new Minim(this);
  slow_helice = shel.loadFile("slow_helice.wav");

  smooth();

  int i = 0;

  while (i < 4) {

    clouds[i] = new Cloud((i+1)*(width/4), 55, 0.3, 60, 45);
    drops[i] = new Rain((i+1)*(width/4), 35, 0.3, 0);

    i++;
  }


  stroke(255);
}



void draw() {

  int i = 0;

  inc = 1;

  if (inc == 1) {
    PImage b;
    b = loadImage("sky.jpg");
    image(b, 0, 0);

    count++;
  }

  if (mouseY > clouds[i].yPos-50 && mouseY < clouds[i].yPos+50) {

    inc = 0;
    image(s, 0, 0);


    if (lightningPlay < LIGHTNING_DURATION) {

      if(!lightning.isPlaying()) {
        lightning.loop(0);
      }


      image(t, 0, 0);
      lightningPlay++;
    }
  }
  else {
    lightningPlay = 0;
  }   


  helic.drawHeli();
  helic.rotation();

  image(rainGfx, 0, 0);
  fadeRain();
  while (i < nr) {

    if (mouseY > clouds[i].yPos-50 && mouseY < clouds[i].yPos+50) {

      if(mouseX > helic.heliX - helic.heliS && mouseX < helic.heliX + helic.heliS ) {
        helic. shrink();
      }
      else {
        helic.expand();
      }

      float d = dist(mouseX, 0, clouds[i].xPos, 0);
      float t = map(d, 0, 300, 125, 255);
      int numdrops =  (int)map(d, 0, 300, 160, 0);
      color c = color(t);
      clouds[i].drawCloud(c);


      if (!rain.isPlaying()) {
        rain.loop(0);
      }
      drops[i].drawRainDrops(numdrops);
    }
    else {
      helic.expand();
      clouds[i].drawCloud(255);
      rain.pause();
      rain.rewind();
    }

    wind.play();
    if (!wind.isPlaying()) {
      wind.rewind();
      wind.loop(0);
    }  
    clouds[i].fly();

    drops[i].Move();

    helic.Go();

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

  float end;
  float pluser;

  Heli(float ex, float ey, float es, float hx, float hy, float rt, float ed, float pl) {

    heliX = ex;
    heliY = ey;
    heliS = es;

    heliceX = hx;
    heliceY = hy;
    rotating = rt;

    end = ed;
    pluser = pl;
  }  

  void Go() {

    heliX = heliX-1;
    if(heliX < 740) {

      //      helice.play();
    } 

    if (heliX == -80) {
      heliX = 740;
      heliS = 35;
    }
  }
  void drawHeli() {

    stroke(0, 85);
    line(heliX, heliY, heliX, heliY+80);
    noStroke();
    fill(0, 0, 0, 120);
    ellipse(heliX, heliY, heliS, heliS);
    fill(0, 80);
    ellipse(heliX, heliY, 15, 15);


    if (heliY < -80) {
      heliX = 740;
      heliY = 260;
      pluser = 0;
      heliS = 35;
    }
    pluser = 1;
//    if (heliX == -80) {
//      heliS = 35;
//    }
  }


  void expand() {
    heliS = heliS+0.5;
    if(!helice.isPlaying());
    helice.loop(0);


    if (heliS > 160) {
      heliS = 160;
      heliY = heliY - pluser;

      //      helice.pause();

      //      fast_helice.play();
    }
  }

  void shrink() {
    helice.pause();
    heliS = heliS-0.5;

    if (heliS < 35) {
      heliS = 35;
      heliY = heliY + pluser;

      if (heliY > 440) {
        heliY = 260;
        heliX = 740;
        heliS = 35;
      }
    }

    println("SHRINK");
  }

  void rotation() {


    pushMatrix();
    translate(heliX, heliY+80);
    rotate(rotating);
    stroke(0);
    line(15, 0, 0, 0);
    line(0, 15, 0, 0);
    line(-15, 0, 0, 0);   
    line(0, -15, 0, 0);
    rotating = rotating + 7;//dist(mouseX,mouseY,heliX,heliY)/10.0;  
    heliceX = heliceX - 1;
    popMatrix();
  }
}


