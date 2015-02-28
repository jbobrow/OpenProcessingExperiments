
/* @pjs preload= "Pics/Radio.png", "Pics/dialTune.png", "Pics/dialVol.png", "Pics/bar.png", "Pics/ON.fw.png", "Pics/OFF.fw.png", "Pics/Help Button.fw.png", "Pics/Help.fw.png", "Pics/Close.fw.png";  */
Maxim maxim;
AudioPlayer jazz;
AudioPlayer bolero;
AudioPlayer rock;
AudioPlayer elec;
AudioPlayer radioTune;
PImage band;
PImage dialVol;
PImage dialTune;
PImage bar;
PImage on;
PImage off;
PImage helpButton;
PImage info;
PImage close;
boolean flag;
boolean lockedTune;
boolean lockedVol;
boolean sintonizado;
boolean help;
int tunerPos;
int imgWidth;
int imgHeight;
int rango;
float rotate1;
float rotate2;
float volume;
float volSin;
int lockedVolPos;
int ax, bx, ay, cy, hx, hy, ix, iy;


void setup()
{
  size(840, 460);
  startComponents();
  
  loadAudio();
  loadRadio();
  
}

void startComponents()
{
  band = loadImage("Pics/Radio.png");
  dialVol = loadImage("Pics/dialVol.png");
  dialTune = loadImage("Pics/dialTune.png");
  bar = loadImage("Pics/bar.png");
  on = loadImage("Pics/ON.fw.png");
  off = loadImage("Pics/OFF.fw.png");
  helpButton = loadImage("Pics/Help Button.fw.png");
  info = loadImage("Pics/Help.fw.png");
  close = loadImage("Pics/Close.fw.png");
  
  locked = false;
  flag = false;
  sintonizado = false;
  help = false;
  
  rango = 1;
  imgWidth = 130;
  imgHeight = imgWidth*dialVol.height/dialVol.width;
  tunerPos = 400;
  rotate1 = 0.0;
  rotate2 = constrain(rotate2, -2.15, 2.15);
  rotate2 = 2.15;
  volume = 1.0;
  ax = 615 - (on.width/2) - 5;
  bx = 615 + (on.width/2) + 5;
  ay = 250 - (on.height/2) - 5;
  cy = 250 + (on.height/2) + 5;
  
  hx = 80 - (on.width/2) - 5;
  ix = 80 + (on.width/2) + 5;
  hy = 400 - (on.height/2) - 5;
  iy = 400 + (on.height/2) + 5;
}

void loadRadio()
{
  background(255);
  image(band, 0, 0);

  imageMode(CENTER);

  image(bar, tunerPos, 198);
  image(helpButton, 80, 400);
  
  if(flag)
  {
    image(on, 615, 250);
  }
  else
  {
    image(off, 615, 250); 
  }
  
  pushMatrix();
  translate(589, 320);
  rotate(rotate1);  
  image(dialTune, 0, 0, imgWidth, imgHeight);  
  popMatrix();

  pushMatrix();
  translate(457, 320);
  rotate(rotate2);  
  image(dialVol, 0, 0, imgWidth, imgHeight);
  popMatrix();  

  imageMode(CORNER);

  jazz.volume(volume);
  bolero.volume(volume);
  rock.volume(volume);
  elec.volume(volume);
  
  if(help)
  {
    image(info, 0, 0);
    imageMode(CENTER);
    image(close, 80, 400);
  }
  
  imageMode(CORNER);
}

void loadAudio()
{
  maxim = new Maxim(this);
  jazz = maxim.loadFile("jazz.wav");
  bolero = maxim.loadFile("bolero.wav");
  rock = maxim.loadFile("rock.wav");
  elec = maxim.loadFile("electronic.wav");
  radioTune = maxim.loadFile("radioTune.wav");
  radioTune.setLooping(true);
}

void draw()
{
  
    if (mousePressed == true && dist(mouseX, mouseY, 457, 320)<50)
    {
      lockedVol = true;
      lockedVolPos = mouseY;
    }
  
    if (mousePressed == true && dist(mouseX, mouseY, 589, 320)<50)
    {
      lockedTune = true;
    }
    
    loadRadio();
    
    if(flag)
    {
      tune(); 
    }
    volSin = (pow(sin(tunerPos/30), 2))/rango;
    radioTune.volume(volSin);
    if(volSin < 0.01 && sintonizado)
    {
      stroke(123, 255, 36);
      strokeWeight(10);
      point(tunerPos, 150);
    }
}

void tune()
{
  if(tunerPos >= 280 && tunerPos <= 285)
  {
    emisora("jazz");
    sintonizado = true;
  }
  else
  {
   if(tunerPos >= 374 && tunerPos <= 379)
    {
      emisora("rock");
      sintonizado = true;
    }
    else
    {
      if(tunerPos >= 469 && tunerPos <= 474)
      {
        emisora("bolero");
        sintonizado = true;
      }
      else
      {
        if(tunerPos >= 563 && tunerPos <= 568)
        {
          emisora("elec");
          sintonizado = true;
        }
        else
        {
           stopAll(true);
           sintonizado = false;
        }
      }
    } 
  }
  
}

void emisora(String e)
{
  switch(e)
  {
    case "jazz":
     bolero.stop();
     rock.stop();
     elec.stop();
     jazz.play();
     break;
     
    case "bolero":
     jazz.stop();
     rock.stop();
     elec.stop();
     bolero.play();
     break;
     
    case "elec":
     bolero.stop();
     rock.stop();
     jazz.stop();
     elec.play();
     break;
     
    case "rock":
     bolero.stop();
     jazz.stop();
     elec.stop();
     rock.play();
     break;
  } 
}

void mouseDragged()
{
  if (lockedTune)
  {
    int newTP = tunerPos + (pmouseY - mouseY);
    if (newTP > 200 && newTP < 640)
    {
      tunerPos = newTP;
      if (mouseY < pmouseY)
      {
        rotate1 += PI/35;
      }
      else
      {
        rotate1 -= PI/35;
      }
    }
  }

  if (lockedVol)
  {
    
    if (mouseY < pmouseY)
    {
      if(volume != 1.0)
      {
        rotate2 += 4.3/30;
        volume += 1/30;
        rango += 3;
      }    
    }
    else
    {
      if(volume >= 0.03333333333333354)
      {
        rotate2 -= 4.3/30;
        volume -= 1/30;
        rango -= 3;
      }    
    }
  }
}

void mouseReleased()
{
  lockedTune = false;
  lockedVol = false;
}

void mousePressed()
{
   if(mouseX >= ax
     && mouseX <= bx
     && mouseY >= ay
     && mouseY <= cy)
    {
      flag = !flag;
      onoffRadio();
    }
    if(mouseX >= hx
     && mouseX <= ix
     && mouseY >= hy
     && mouseY <= iy)
    {
      help = !help;
    }
}

void onoffRadio()
{
  if(flag)
  {
    radioTune.play();
    tune();
  }
  else
  {
     stopAll(false);
  }
}

void stopAll(boolean b)
{
  jazz.stop();
  bolero.stop();
  rock.stop();
  elec.stop();
  if(!b)
  {
    radioTune.stop();  
  }  
} 


