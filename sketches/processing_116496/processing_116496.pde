
import peasy.*;
import toxi.geom.*;
import processing.opengl.*;
import java.awt.Frame;
import processing.core.PApplet;
import ddf.minim.analysis.*;
import ddf.minim.*;

int maxX = 60;
int maxY = 400;
int maxZ = 200;
int move= 0;

boolean isMoving = false;
boolean trackPlay = false;

PeasyCam cam;
Minim minim;
AudioPlayer clairDeLune;
FFT fftLin;
FFT fftLog;

Body movingBody;
PFrame f;
secondApplet s;

PImage dancingGirl;
PImage fade;
ArrayList arrayOfBoxes = new ArrayList();

void setup()
{
  size (800, 600, P3D);
  createCamera();
  createAgents();
  createAudio();
  movingBody = new Body();
  dancingGirl = loadImage("DancingGirl.png");
  PFrame f = new PFrame();
  //clairDeLune.loop();
}
void draw()
{
  background(255);
  lights();
  directionalLight(200, 255, 255, 1, 1, -1);
  playMusic();

  movingBody.run();
  runAgents();
  displayBase();
  analyserWindow();
  //recordAnim();
}
void recordAnim()
{
  println("recording start");
  String mi = str (minute()); 
  String hr = str (hour()); 
  String dy = str (day());    
  String mn = str (month());  
  String yr = str (year());
  //saveFrame("animationMain/"+yr+ mn+ dy+"_"+hr+mi+"_"+"frame####"+".png");
  //s.saveFrame("animationSec/"+yr+ mn+ dy+"_"+hr+mi+"_"+"frame####"+".png");
  fade.save("animationSec/"+yr+ mn+ dy+"_"+hr+mi+"_"+"frame####"+".png");
  println("recording end");
}
void analyserWindow()
{
  s.fill(255, 50);
  s.noStroke();
  s.rect(0, 0, s.width, s.height);
  analyseMusic();
  fade = s.get(0, 0, s.width, s.height);

  //image(fade, 0, 0,width/2, height/2);
  s.redraw();
}
void analyseMusic()
{
  fftLin.forward(clairDeLune.mix);
  s.noFill();
  s.colorMode(HSB);
  fullSpec();
  fftLog.forward(clairDeLune.mix);
  s.rectMode(CORNERS);
  linAvgSpec();
  fftLog.forward(clairDeLune.mix);
  logAvgSpec();
}
void logAvgSpec()
{
  int w = int(s.width/fftLog.avgSize());
  for (int i = 0; i < fftLog.avgSize(); i++)
  {
    float hVal = lerp(1, 255, fftLin.getAvg(i)/10);
    s.noStroke();
    s.fill(hVal, 255, 255);
    s.rect(i*w, s.height, i*w + w, s.height - fftLog.getAvg(i)*2);
  }
}
void linAvgSpec()
{
  float height23 = s.height/3 *2;
  int w = int(s.width/fftLin.avgSize());
  for (int i = 0; i < fftLin.avgSize(); i++)
  {
    float hVal = lerp(1, 255, fftLin.getAvg(i)/10);
    s.noStroke();
    s.fill(hVal, 255, 255);
    s.rect(i*w, height23, i*w + w, height23 - fftLin.getAvg(i)*2);
  }
}
void fullSpec()
{
  float height3 = s.height/3;

  for (int i = 0; i < fftLin.specSize(); i++)
  {

    float hVal = lerp(1, 255, fftLin.getBand(i)/4);
    s.stroke (hVal, 255, 255, 100);
    s.line(i, height3, i, height3 - fftLin.getBand(i)*2);
  }
}
void playMusic()
{
  if (trackPlay==true && clairDeLune.isPlaying()==false)
  {
    clairDeLune.loop();
    println("play");
  }
  if (trackPlay==false && clairDeLune.isPlaying()==true)
  {
    clairDeLune.pause();
    println("pause");
  }
}
void createAudio()
{
  minim = new Minim(this);
  clairDeLune = minim.loadFile("ClairdeLune.mp3", 2048);
  fftLin = new FFT(clairDeLune.bufferSize(), clairDeLune.sampleRate());
  fftLin.linAverages(100);
  fftLog = new FFT(clairDeLune.bufferSize(), clairDeLune.sampleRate());
  fftLog.logAverages(22, 3);
}
void runAgents()
{
  for (int i = 0; i<arrayOfBoxes.size(); i++)
  {
    Box b = (Box) arrayOfBoxes.get(i);
    b.run();
  }
}
void createAgents()
{
  float stepSizeY;
  float stepSizeZ;
  int agentNumY = 20;
  int agentNumZ = 10;
  stepSizeY = maxY/agentNumY;
  stepSizeZ = maxZ/agentNumZ;
  for (float i= stepSizeY/2; i<maxY; i+=stepSizeY)
  {
    for (float j = stepSizeZ/2; j<maxZ; j+=stepSizeZ)
    {
      Vec3D loc = new Vec3D (0, i, j);
      Box b = new Box (loc, stepSizeY);
      arrayOfBoxes.add(b);
    }
  }
}
void createCamera()
{
  cam = new PeasyCam(this, 350);
  cam.setRotations(0, radians(-90), radians(90));
  cam.lookAt(maxX/2, maxY/2, maxZ/2);
}
void displayBase()
{
  pushMatrix();
  translate(0, maxY/2, 0);
  fill(150, 100);
  noStroke();
  box(maxX*2, maxY, 0.1);
  popMatrix();
}
void keyPressed()
{
  if (s.key == ' ')
  {
    trackPlay = !trackPlay;
  }
  if (key == ' ')
  {
    isMoving = !isMoving;
    trackPlay = !trackPlay;
  }
  if (keyCode == LEFT)
  {
    if (movingBody.loc.y>0)
    {
      movingBody.loc.y -=2;
    }
  }
  if (keyCode == RIGHT)
  {
    if (movingBody.loc.y>0)
    {
      movingBody.loc.y +=2;
    }
  }
  if (keyCode == DOWN)
  {
    if (movingBody.loc.z>0)
    {
      movingBody.loc.z +=2;
    }
  }
  if (keyCode == UP)
  {
    if (movingBody.loc.z>0)
    {
      movingBody.loc.z -=2;
    }
  }
}
void stop()
{
  clairDeLune.close();
  minim.stop(); 
  super.stop();
}

class Body
{
  Vec3D loc;
  //Constructor
  Body()
  {
    loc = new Vec3D (-maxX/2, maxY/2, maxZ/2);
  }

  //functions
  void run()
  {
    displayAvatar();
    display();
  }
  
  void displayAvatar()
  {
    loadPixels();
    dancingGirl.loadPixels();
    imageMode(CENTER);
    for (int x = 0; x < dancingGirl.width; x++ ) 
    {
      for (int y = 0; y < dancingGirl.height; y++ )
      {
        int loc = x + y*dancingGirl.width;
        float a = alpha (dancingGirl.pixels[loc]);
        color c = color(50, a);
        dancingGirl.pixels[loc] = c;
      }
    }
    dancingGirl.updatePixels();  
    pushMatrix();
    translate(-loc.x, loc.y, maxZ/2);
    rotateZ(radians(90));
    rotateX(radians(-90));    
    image (dancingGirl, 0, 0, 59, 200);
    popMatrix();
  }
  void display()
  {
    stroke(255, 0, 0, 100);
    strokeWeight(20);
    point(loc.x, loc.y, loc.z);
  }
}

class Box
{
  Vec3D loc;
  float size;
  float maxTranslation = 50;
  float speed = 0;
  Box(Vec3D _loc, float _size)
  {
    loc = _loc;
    size =_size-1;
  }
  void run()
  {
    if (isMoving)
    {
      reactToBodyMove();
    }
    returnToInitPos();
    display();
  }
  void returnToInitPos()
  {
    if (loc.distanceTo(movingBody.loc) > maxTranslation 
      && loc.x <0)
    {
      speed = .5;
      loc.x +=speed;
    }
  }
  void reactToBodyMove()
  {

    if (loc.distanceTo(movingBody.loc)<maxTranslation && loc.x > -(size/4))
    {
      for (int i = 0; i < fftLog.avgSize(); i++)
      {
        //speed = speed + (maxTranslation/loc.distanceTo(movingBody.loc));
        speed = lerp(0, (size/4), fftLin.getAvg(i)/11);
        loc.x -=speed;
      }
    }
  }

  void display()
  {
    fill(255, 150);
    stroke(150, 200);
    strokeWeight(1);
    pushMatrix();    
    translate(loc.x, loc.y, loc.z);    
    box(size);
    popMatrix();
  }
}

public class PFrame extends Frame 
{
  public PFrame() 
  {
    setBounds(100, 100, 600, 300);
    s = new secondApplet();
    add(s);
    s.init();
    show();
  }
}

public class secondApplet extends PApplet 
{
  public void setup() 
  {
    size(400, 300);
    noLoop();
  }

  public void draw() 
  {
  }
  public void mousePressed() 
  {

  }

  }


