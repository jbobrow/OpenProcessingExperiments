
//2.9.11

PImage g1;
PImage g2;
PImage g3;
PImage g4;

PImage inImg;
PImage outImg;

PFont font;
int s, m, h, lastS;
int time;


void setup()
{
  background (255);
  size(640,480);
  smooth();
  noStroke();
  
  font = loadFont("Megaton-140.vlw");

  g1 = loadImage ("1lines.png");
  g2 = loadImage ("2lines.png");
  g3 = loadImage ("3lines.png");
  
  inImg = g2;
  outImg = g1;
  }


void draw()
{
  background (0);
  textFont (font);

  m = minute ();
  h = hour ();
  s = second();

// set images
  if (s == 0 && lastS == 59) {
    outImg = inImg;
  if (inImg == g1) {
      inImg = g2;
  } else if (inImg == g2) {
      inImg = g3;
  } else if (inImg == g3) {
      inImg = g1;
    }
  }
  
//time
  if (h<10) 
  { text (( "0"+h), 60, 340); 
  }
  else 
  { text ((h), 60, 340); 
  }
  if (m<10) 
  { text (("0" +m), 350, 340); 
  }
  else 
  { text ((m), 350, 340); 
  }
  if(s%2 == 0)
  { text((":"), 305, 340); 
  }

//seconds
  textSize (450);
  if (s<10) 
  { text (( "0"+s), -20,240); 
  }
  else 
  { text ((s), -20, 240); 
  }

PImage screenShot = get(0, 0, width, height);

//draws masks
  tint(255, 255);
  image (inImg, 0, 0, width, height);
  
  float mappedS = map(s, 0, 60, 255, 0);
  tint(255, mappedS);
  image (outImg, 0, 0, width, height);

  float mappedS2 = map(s, 0, 30, 0, 255);
  mappedS2 = constrain(mappedS2, 0, 255);
  tint(255, mappedS2);
  PImage clockImage = inImg.get(0, 0, width, height);
  clockImage.mask(screenShot);
  image (clockImage, 0, 0, width, height);
  
  lastS = s;
  }




