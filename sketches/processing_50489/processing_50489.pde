
int getRandomColor() {
  return color(random(100, 255), 0, 255);
}

int FadeAmount = 20;
int sec;

float pntsize = 0.02;
float distance = 0.01;
float rate1 = 0.02;
float time = 0;
float rdm, rdmsize, rdmspeed, hld, hld2, hldspeed;

Fade myFade;


void setup () {
  frameRate(24);
  hld = millis();
  size (800, 400);
  smooth();
  background(200, 0, 255);
  myFade = new Fade();
  frameRate (25);
  //mouseX = 10;
}

void draw () {
  if (frameCount%24==0)
  {
    sec++; 
    hld=millis();
    rdm = random(80);
  }

  if (frameCount%24==0)
  {
    sec++; 
    hld2=millis();
    rdmsize = random(400);
  }

  if (frameCount%24==0)
  {
    sec++; 
    hldspeed=millis();
    rdmspeed = random(0.02);
  }


  float rate;
  myFade.display();

  for (float i=0; i<width; i++) {
    stroke (getRandomColor());
    //strokeWeight(pntsize);
    point (i+=distance, height*noise(i/500, time));
  }

  rate = rate1 ;
  time = time+rate;

  pntsize = int (rdmsize);
  distance = int (rdm);
  rate1 = rdmspeed;
}



class Fade
{
  int FadeAmount_ = FadeAmount;
  Fade ()
  {
  }
  void display () {
    //#1D2124
    fill (20, 0, 50, FadeAmount);
    noStroke ();
    rect (0, 0, width, height);
  }
}
