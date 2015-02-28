
/*
The MIT License (MIT) - See Licence.txt for details

Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies


images from www.wikihow.com/Draw-a-Kitten
dog video from www.flickr.com/photos/59888866@N00/2953291552/
sounds from  www.freesound.org/

*/




Maxim maxim;
AudioPlayer []aModes = new AudioPlayer[3];
AudioPlayer aDog;
int cMode = 0;
long oTime = millis();
int avgMax = 50;
float []avgMode = new float[avgMax];
int avgModeIdx = 0;
//0 - normal
//1 - happy
//2 - angry
int dogX;
int dogY;
int catX;
int catY;
float safeDistance = 150;
PImage []pDog;
int iDog;

PImage [] pModes = new PImage[3];

void setup()
{
  size(320, 480);
  pModes[0] = loadImage("cat_0.png");
  pModes[1] = loadImage("cat_1.png");
  pModes[2] = loadImage("cat_2.png");
  setBackground();

  maxim = new Maxim(this);
  
  aDog = maxim.loadFile("dog.wav");
  aDog.setLooping(true);
  
  aModes[0] = maxim.loadFile("normal.wav");
  aModes[1] = maxim.loadFile("happy.wav");
  aModes[2] = maxim.loadFile("angry.wav");
 
  for (int i=0;i<3;i++)
    aModes[i].setLooping(true);
    
  aModes[0].speed(.8);
  aModes[1].speed(.7);
  aModes[2].speed(.25);
  cMode = 0;
  
  imageMode(CENTER);
  
  pDog = loadImages("dog/dog",".jpg", 115);
  iDog = 0;

  dogX = width/2;
  dogY = 60;

  catX = width/2;
  catY = height/2;
  playSound(0);
  drawDog();
  drawCat(catX,catY);

}

void draw()
{
  if (distFromDog() < safeDistance) {
    imageMode(CENTER);
    image(pDog[iDog++],dogX,dogY,160,90);
    if (iDog >= pDog.length)
      iDog = 0;
    aDog.play();
  } else {
    aDog.stop();
  }
}

void playSound(int idx) 
{
  if (distFromDog() < safeDistance)
    idx = 2;
  else if (millis() - oTime < 1000)
    return;
  if (cMode == idx)
    return;
//  println("playing "+idx);
  for (int i=0;i<3;i++)
    aModes[i].stop();
  aModes[idx].play();
  cMode = idx;
}

float avg(float []a) {
  float avg = 0.;
  for (int i=0;i<a.length;i++)
    avg += a[i];
  return avg/(float)a.length;
}

void mouseDragged()
{
  float speed = dist(pmouseX,pmouseY,mouseX,mouseY);
  speed = map(speed,0,100,0.,1);
  speed = constrain(speed,0.,1.);
  setBackground();
  drawDog();
  drawCat(mouseX,mouseY);
  if (distFromDog() < safeDistance) {
    playSound(2);
    aDog.play();
  } else {
    aDog.stop();
  }
  if (avgModeIdx == avgMax) {
    avgModeIdx = 0;
    speed = avg(avgMode);
    if (speed <= 0.01)
      playSound(0);
    else if (speed <= 0.1)
      playSound(1);
    else if (speed <= 0.25)
      playSound(2);
//    println(speed);
  }
  catX = mouseX;
  catY = mouseY;  
  avgMode[avgModeIdx++]=speed;
}

void mousePressed()
{
// code that happens when the mouse button
// is pressed
}

void mouseReleased()
{
  if (distFromDog() >= safeDistance) {
    cMode = 0;
    for (int i=0;i<3;i++)
      aModes[i].stop();
    aModes[0].play();
  }
  
  setBackground();
  drawDog();
  drawCat(mouseX,mouseY);
// code that happens when the mouse button
// is released
}

void drawDog() {
  imageMode(CENTER);
  image(pDog[iDog],dogX,dogY,160,90);
}

void drawCat(int x,int y) {
  imageMode(CENTER);
  image(pModes[(int)cMode],x,y,200,100);
}


float distFromDog() {
  return dist(catX,catY,dogX,dogY);
}

void setBackground() {
  background(59,116,161);
}


PImage [] loadImages(String stub, String extension, int numImages)
{
  PImage [] images = new PImage[0];
  for(int i =0; i < numImages; i++)
  {
    PImage img = loadImage(stub+i+extension);
    if(img != null)
    {
      images = (PImage [])append(images,img);
    }
    else
    {
      break;
    }
  }
  return images;
}




