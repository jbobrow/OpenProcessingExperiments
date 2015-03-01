
/*
AR Shooter
By Heein Park

Shotgun Modelling
By Valve Corporation

-- Reference --
https://processing.org/reference/libraries/video/Capture_start_.html
http://www.youtube.com/watch?v=RBVseisC-VQ
https://www.processing.org/examples/animatedsprite.html
https://www.processing.org/examples/sequential.html
*/

//import processing.video.*;
//import ddf.minim.analysis.*;
//import ddf.minim.*;

/*******************/
/* Minim Variables */
/*******************/

//Minim minim;
//FFT fft;
//AudioInput in;
//float[] fftHistory;
//
//float volumevalue = 50.0;
//float tolerance = 1.0;

/********************/
/* Camera Variables */
/********************/

//Capture cam;

/*********************/
/* Graphic Variables */
/*********************/

Animation animation;
PImage shotgun_idle;
PGraphics screen;

boolean death = false;
boolean record = false;
boolean shoot = false;

/*******/
/* etc */
/*******/

boolean pressed;
int respawntime = 10000;
//int recoiltime = 1250;
Timer timer  = new Timer(respawntime);
//Timer recoil_timer  = new Timer(recoiltime);

void setup()
{
/***************/
/* Minim Setup */
/***************/

//  minim = new Minim(this);
//  minim.debugOn();
//  in = minim.getLineIn(Minim.STEREO, 512);
//  fft = new FFT(in.bufferSize(), in.sampleRate());
//  fftHistory = new float[in.bufferSize()];

/****************/
/* Camera Setup */
/****************/
//
//  String[] cameras = Capture.list();
//  
//  if (cameras.length == 0) {
//    println("There are no cameras available for capture.");
//    exit();
//  } else {
//    println("Available cameras:");
//    for (int i = 0; i < cameras.length; i++) {
//      println(cameras[i]);
//    }
//    
//    // The camera can be initialized directly using an 
//    // element from the array returned by list():
//    cam = new Capture(this, cameras[0]);
//    cam.start();
    
//  if (frame != null)
//  {
//    frame.setResizable(true);
//  }

/****************/
/* Images Setup */
/****************/

  size(1280, 720);
  animation = new Animation("shotgun_shoot", 30);
  screen = createGraphics(width, height);
  shotgun_idle = loadImage("shotgun_idle.png");
  frameRate(24);
//  }      
}

void draw()
{
  timer.update();
  background(0, 0);
//  recoil_timer.update();
  
  // Graphic Screen Start
  screen.beginDraw();
  screen.background(0, 0);
  
  /***************/
  /* Camera Draw */
  /***************/
//  
//  if (cam.available() == true)
//  {
//    cam.read();
//  }
//  screen.image(cam, 0, 0, displayWidth, displayHeight);
  // The following does the same, and is faster when just drawing the image
  // without any additional resizing, transformations, or tint.
  //set(0, 0, cam);
  
  /***************/
  /* Images Draw */
  /***************/
  
  if(death == false && shoot == false)
  {
    screen.image(shotgun_idle, 0, 0, width, height);
  }
  
  screen.endDraw();
  
  image(screen, 0, 0);
  
  /***********************/
  /* Timers and Booleans */
  /***********************/
  
  // If you are death
  if(death == true)
  {
    shoot = false;
    animation.reset();
    filter(BLUR, 10);
    filter(GRAY);
    textSize(32);
    textAlign(CENTER);
    fill(255);
    stroke(0);
    text("Respawn in " + timer.remaining(), width/2, height/2);
  }
  
  // Graphic Screen End
//  println(shoot);
  
  if(timer.result() == true)
  {
    death = false;
    timer.reset();
  }
  
  if(shoot == true && death == false)
  {
    animation.display();
  }
  
  if(animation.framenum() >= 26)
  {
    shoot = false;
    animation.reset();
  }
  
  /*******/
  /* FFT */
  /*******/
  
//  fft.forward(in.mix);
//  
//  for(int i = 1; i < fft.specSize(); i++)
//  {
//    println(fft.getBand(i)*1600);
//    println(in.mix.get(i)*100);
//
//    if(record == true)
//    {
//      if(in.mix.get(i)*100 >= volumevalue)
//      {
//        fftHistory[i] = fft.getBand(i)*16;
//        println(fftHistory[i]);
//      }
//    }
//    else
//    {
//      if(fft.getBand(i)*16 >= fftHistory[i] - tolerance && fft.getBand(i)*16 <= fftHistory[i] + tolerance)
//      {
//        if (shoot == false)
//        {
//          {
//            shoot = true;
//          }
//        }
//
//        println("OK");
//      }
//    }
//
//    if(in.mix.get(i)*100 >= volumevalue)
//    {
//      if (shoot == false)
//      {
//        shoot = true;
//      }
//    }
//  }
}

void keyPressed()
{
  if (death == false)
  {
    if (key == 'd' || key == 'D')
    {
      death = true;
      timer.trigger();
    }
  
    if (shoot == false)
    {
      if (key == 's' || key == 'S')
      {
        shoot = true;
      }
    }
  }
  
  if (key == 'r' || key == 'R')
  {
    if (record == false)
    {
      record = true;
    }else
    {
      record = false;
    }
  }
}

//boolean sketchFullScreen()
//{
//  return true;
//}
// Class for animating a sequence of GIFs

class Animation
{
  PImage[] images;
  int imageCount;
  int frame = 0;
  boolean stop = true;
  
  Animation(String imagePrefix, int count)
  {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++)
    {
      String filename = imagePrefix + nf(i + 1, 2) + ".png";
      images[i] = loadImage(filename);
//      println(filename);
    }
  }

  void display()
  {

    frame = (frame+1) % imageCount;

    image(images[frame], 0, 0, width, height);
//    println(frame);
  }
  
  void reset()
  {
//    stop = false;
    frame = 0;
  }
  
  int framenum()
  {
    return frame;
  }
}
class Timer
{
  int prev_millis;
  int now_millis;
  int timer_millis;
  
  boolean timer_result = false;
  
  Timer(int _x)
  {
    timer_millis = _x;
  }
  
  
void update()
  {
    now_millis = millis();
//    println(now_millis - prev_millis);
//    println(timer_millis);
//    println(timer_result);
    
    if(now_millis - prev_millis >= timer_millis)
    {
      timer_result = true;
    }
  }
  
  void trigger()
  {
    prev_millis = millis();

  }
  
  boolean result()
  {
    return timer_result;
  }
  
  void reset()
  {
    timer_result = false;
  }
  
  int remaining()
  {
    return 10 - int(float(now_millis - prev_millis)/1000);
  }
}


