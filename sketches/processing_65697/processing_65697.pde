
PImage room1, dim, stat_noise, shadow, shadow2, window;
PImage hands;
PImage room2;

import ddf.minim.*;

Minim minim;
AudioSample screech;
AudioSample crash;
AudioSample chime;
AudioSample creak;
AudioSample knock;
AudioSample buzz;
AudioSample ambi;
AudioSample squeak;
AudioSample scratch;
AudioSample scream;
AudioSample laugh;
AudioSample stat;

float sp = 2;

int ghost_startX = 255;
int ghost_stopX = -50;
int ghost_startY = 153;
int ghost_stopY = 320;
float x = ghost_startX;
float y = ghost_startY;
float pct = 0.0;
float step = 0.01;

float staticY = 150;
float staticY_end = 400;
float speed = 0.1;

int nextTime;
int middleTime;
int firstTime;
float angle = 0.0;

boolean flicker = false;
boolean prevMouse = false;
boolean prevMouse1 = false;
boolean ghost_trigger = false;
boolean ghost_done = false;
boolean static_trigger = false;
boolean static_done = false;
boolean shadow_trigger = false;
boolean shadow_done = false;
boolean clock_done = false;
boolean window_trigger = false;
boolean window_done = false;
boolean window_start = false;
int window_time1, window_time2, window_time3;

boolean sound_trigger = false;

String message = "";
int messagePos = 0;
boolean firstmessage = false;
boolean hold = false;
boolean secondmessage = false;
boolean thirdmessage = false;
boolean fourthmessage = false;

void setup()  {
  size(510, 640);
  smooth();
  imageMode(CENTER);
  
  room1 = loadImage("background.jpg");
  dim = loadImage("background2.jpg");
  stat_noise = loadImage("static.png");
  shadow = loadImage("shadow.png");
  shadow2 =  loadImage("shadow2.png");
  window = loadImage("window_shadow.png");
  
  minim = new Minim(this);
  chime = minim.loadSample("clock_chimming.wav", 2048);
  knock = minim.loadSample("door-knock-2.mp3", 2048);
  screech = minim.loadSample("Monster.wav", 2048);
  crash = minim.loadSample("crash.wav",2048);
  creak = minim.loadSample("door_open.wav", 2048);
  buzz = minim.loadSample("neon_light.wav", 2048);
  ambi = minim.loadSample("background_ambient.wav", 2048);
  squeak = minim.loadSample("swing_squeaks.wav", 2048);
  stat = minim.loadSample("static_noise.wav", 2048);
  scratch = minim.loadSample("static_scratch.wav", 2048);
  scream = minim.loadSample("woman_scream.wav", 2048);
  laugh = minim.loadSample("laugh.wav", 2048);
  frameRate(34);
}

void draw()  {
  int i = frameCount;
  
  background(0);
  //room1
  image(room1, width/2, height/2);
  
  if (sound_trigger == false && i%10 == 0){
    scratch.trigger();
    squeak.trigger();
    laugh.trigger();
    scream.trigger();
    sound_trigger = true;
  }
  
  textSize(16);
  fill(0);
  if(firstmessage == false)
    message = "KKkkkzzttss. kKzTsZkZtS. Static. Static and noise. Voices and laughs and screams. Enjoy your stay.";
  else if (secondmessage == false)
    message = "Click the center of the room to begin.";
  else if (thirdmessage == false)
    message = "The lights flicker on and off. Light, ضوء, licht, luz, akari, ljus, освещение, światłość. Travels at 299,792,458 meters per second. Eigengrau. Noun. 'Dark light' or 'brain grey' the color seen by the eye in perfect darkness.";
  else if (fourthmessage == false)
    message = "From now on, click around the room to trigger different events.";
  if(message.length()>0 && hold == false){
      text(message.substring(0, messagePos), 20, 500, 480, 500);
      if(messagePos < message.length())
        messagePos++;
      else if(firstmessage == false)
      {
        if(i%60 == 0){
          firstmessage = true;
          messagePos = 0;}
      }
      else if (secondmessage == false)
        hold = true;
      else if (thirdmessage == false)
      {
        if(i%35 == 0){
          thirdmessage = true;
          messagePos = 0;}
      }
      else if (fourthmessage == false)
        hold = true;
        
  }
  else
   text(message.substring(0, messagePos), 20, 500, 480, 500);
  
  //lights
  if(mouseX >= 210 && mouseX <= 340 && mouseY >= 230 && mouseY <= 320 && mousePressed == true && prevMouse == false)
  {
    if (flicker == false){
       firstTime = i + 6;
       middleTime = firstTime + 8;
       nextTime = middleTime + 7;
    }
    flicker = true;
    buzz.trigger();
    
    prevMouse = true; 
    hold = false;
    secondmessage = true;
    messagePos = 0;
  }
  
  if (i < firstTime || (i >= middleTime && i < nextTime))
     image(dim, width/2, height/2);
  
  if(mouseX>=0 && mouseX <= 250 && mouseY>=70 && mouseY<=390)
  {
    if(prevMouse == true && mousePressed == true && ghost_done == false)
    {
      ghost_trigger = true;
      ambi.trigger();
    }
  }
  
  if (ghost_trigger == true)
  {    
    messagePos = 0;
    if (pct < 1.0)
    {
      x = ghost_startX + ((ghost_stopX-ghost_startX)*pct);
      y = ghost_startY + ((ghost_stopY-ghost_startY)*pct);
      pct += step;
    }
    else
      ghost_done = true;
    image(shadow, x, y);
    prevMouse1 = true;
  }
  
  if(mouseX>=400 && mouseX <=520 && mouseY>=220 && mouseY<=500 && prevMouse == true && shadow_done == false)
  {
    
    if(mousePressed == true)
    {    
      shadow_trigger = true;
      screech.trigger();
    }
  }
  
  if (shadow_trigger == true)
  {
    messagePos = 0;
    pushMatrix();
      rotate(angle);
      image(shadow2, 290, -70);
      if(angle < PI)
        angle += 0.05;
      else
        shadow_done = true;
    popMatrix();
  }
  
  if (mouseX>=65 && mouseX <=320 && mouseY>=420 && mouseY<=620 && prevMouse == true && static_done == false)
  {
    if(mousePressed == true)
    {
       static_trigger = true;
       stat.trigger();
    }
  }
  
  if (static_trigger == true)
  {
    messagePos = 0;
    if (static_done == false)
    {
       if (staticY < staticY_end)
         staticY += sp;
       else
         static_done = true;
       image(stat_noise, -15, staticY);
    }
  }

  if(mouseX>=350 && mouseX <=460 && mouseY>=20 && mouseY<=185 && prevMouse == true && window_done == false)
  {
    
    if(mousePressed == true)
    {    
      window_trigger = true;
      knock.trigger();
    }
  }
  
  if (window_trigger == true)
  {
    messagePos = 0;
    if (window_start == false) {
        window_time1 = i + 3;
        window_time2 = window_time1 + 5;
        window_time3 = window_time2 + 4;
    }
    window_start = true;
    
    if (i < window_time1 || (i >= window_time2 && i <= window_time3))
    {
       image(window, int(random(380, 420)), int(random(90, 120)));
    }
  }
  
  if (mouseX>=290 && mouseX <=340 && mouseY>=120 && mouseY<=195 && mousePressed == true && prevMouse == true)
  {
    if (clock_done == false)
    {
      chime.trigger();
      clock_done = true;
    }
  }
}

void stop()
{
  buzz.close();
  ambi.close();
  screech.close();
  scratch.close();
  scream.close();
  laugh.close();
  stat.close();
  chime.close();
  minim.stop();
  
  super.stop();
}

