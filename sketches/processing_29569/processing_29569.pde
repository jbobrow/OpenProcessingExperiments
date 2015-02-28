
//alex mcdougal, P5, worddookie, minim
//murder and create .com/physics/
PImage can;
PImage butt;
PImage derpderp;
PImage bars;

//spore
Spores [] spore;

//controll
import controlP5.*;
import processing.opengl.*;
ControlP5 controlP5;


//auid
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;


Minim minim;
AudioPlayer fresh;
AudioSample llama;
AudioPlayer back;
AudioSample trig1;
AudioSample trig2;
AudioSample trig3;
AudioSample trig4;
AudioSample trig5;


//butterflies
float[] butter;
float[] yplace;
float[] buttspeed;
int spacebutt = int(random(100, 250));
//can
float[] yCoord;
float[] speed;
float[] cann;
int space=150;
float theColor;
int derp = mouseX;
int derk = mouseY;
int f = 0;
int h = 0;
int g = 0;
int gg =1;
int b = 80;
int a =200;





void setup()
{
  noCursor();
  //audio
  minim = new Minim(this);
  fresh = minim.loadFile("identity.mp3");
  llama = minim.loadSample("identity.mp3");
  back = minim.loadFile("panoramic.mp3");
  trig1 = minim.loadSample("ting.mp3");
  trig2 = minim.loadSample("dong.mp3");
  trig3 = minim.loadSample("ding_L.mp3");
  trig4 = minim.loadSample("dumbba.mp3");
  trig5 = minim.loadSample("chong.mp3");




  //buttons
  controlP5 = new ControlP5(this);
  controlP5.addSlider("volume", -40, 12, 128, 20, 100, 10, 100);
  ControllerSprite sprite = new ControllerSprite(controlP5, loadImage("buttonSprite.png"), 75, 75);
  sprite.setMask(loadImage("buttonSpriteMask.png"));
  sprite.enableMask();
  //slider
  controlP5.Button b = controlP5.addButton("play", 100, 20, 20, 50, 50);
  b.setSprite(sprite);  

  //background
  size (800, 1164);
  bars = loadImage("bar.png");
  derpderp = loadImage("dream_shirt.jpg");
  can = loadImage("Girrafe.png");
  butt = loadImage("butt.png");
  smooth();

  //butterflies
  yplace = new float [width/spacebutt];
  buttspeed = new float [width/spacebutt];
  for (int z=0;z<yplace.length;z=z+1) {
    yplace[z]=0;
    buttspeed[z]=random(1, 2);
  }
  butter = new float [50+1];
  for (int a=0;a<butter.length;a=a+1) {
    butter[a]=5;
  }

  //cans
  yCoord = new float [width/space+1];
  speed = new float [width/space+1];
  for (int i=0;i<yCoord.length;i=i+1) {
    yCoord[i]=0;
    speed[i]=random(1, 3);
  }
  cann = new float [50+1];
  for (int n=0;n<cann.length;n=n+1) {
    cann[n]=5;
  }

  //audio
  fresh.play();
  back.play();

  spore = new Spores[20];
}









void draw()
{

//g = 100*(cos(random(0, 1)));
//b = 100*(cos(random(0, 1)));
//a = 100*(cos(random(0, 1)));
  //background
  fill(0, 0, 0, 20);
  rect(0, 0, width, height);

  
  noStroke();

if (g < 253 ) {
      g+=gg;
    }
    if (g >= 254 ) {
      gg= -gg;
    }

  //butterflies
  for (int i=0;i<yplace.length;i=i+1) {
    yplace[i]= yplace[i] + buttspeed[i];
    image(butt, i*spacebutt, yplace[i]);
    if (yplace[i]>1200)
    {
      yplace[i]=0;
    }
  }

  //cans
  for (int i=0;i<yCoord.length;i=i+1) {
    yCoord[i]= yCoord[i] + speed[i];
    image(can, i*space, yCoord[i]);
    if (yCoord[i]>1200)
    {
      yCoord[i]=0;
    }
  }
  if (h>0) {
    for (int a = 0; a<h; a++) {
      spore[a].update();
    }
  }
  
  
  
  
  
  
 fill(0, g, b, 200);
  ellipse(mouseX, mouseY, 30, 30); 
  
  
}









void mouseClicked() {
  spore[f] = new Spores(mouseX, mouseY);
  println("working" );

  if (f > spore.length-2) {
    f = 0;
    h = 18;
    println("reset");
  }
  else {
    f++;
    if (h < 18) h = f; 
    println("h = " + h);
  }
  fill(255);
  ellipse(mouseX,mouseY,35,35);
}




//controlls
void volume(int theValue) {
  theColor = theValue;
  fresh.setGain(theColor);
  llama.setGain(theColor);
}
public void play(int theValue) {
  println("playing : " + theValue);
  llama.trigger();
}





class Spores {
  float y;
  float x;


  Spores(float xtemp, float ytemp) {
    x = xtemp;
    y = ytemp;
  }

  void update() 
  {

    pushMatrix();
    translate(x, y);
    fill(9, 52, 13);
    stroke(0, 255, 18);
    ellipse(0, 0, 10, 10);
    y+= 1;
    popMatrix();

    if (y == 200 ) {
      trig1.trigger();  
      image(derpderp, 0, 0);
    }
    if (y == 400 ) {
      trig2.trigger();  
      image(derpderp, 0, 0);
    }
    if (y == 600 ) {
      trig3.trigger();  
      image(derpderp, 0, 0);
    }
    if (y == 800 ) {
      trig4.trigger();  
      image(derpderp, 0, 0);
    }
    if (y == 1000) {
      trig5.trigger();  
      image(derpderp, 0, 0);
    }

    if (y == 200 ) {
      image(bars, 0, 200);
    }
    if (y == 400 ) {
      image(bars, 0, 400);
    }
    if (y == 600 ) {
      image(bars, 0, 600);
    }
    if (y == 800 ) {
      image(bars, 0, 800);
    }
    if (y == 1000) {
      image(bars, 0, 1000);
    }
  }
}

void stop()
{
  trig1.close();
  trig2.close();
  trig3.close();
  trig4.close();
  trig5.close();
  llama.close();
  fresh.close();
  back.close();
  minim.stop();
  super.stop();
}


