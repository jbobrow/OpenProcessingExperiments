

int pointsize = 2;
int distance = 1; 
float rate1 = 0.02;
Fade myFade;
float time =0;
int FadeAmount = 40 ;


float rand ;
float randsize ; 
float randspeed;
float hold;
float hold2;
float holdspeed;

int sec;
void setup () 
{
  frameRate(24);
  hold = millis();
  size ( 800, 400);
  smooth();
  background(#1D2124);
  myFade = new Fade();
  frameRate (25);
  mouseX = 10;

 
}
 

void draw () {
  if (millis()-hold > 2100) // could be (frames%24 ==0) or (frameCount%24 == 0)
  {
    sec++;  
    hold=millis();
    rand = random(80);
  }

  if (millis()-hold2 > 3000) // could be (frames%24 ==0) or (frameCount%24 == 0)
  {
    sec++;  
    hold2=millis();
    println("        segundo: "+sec);
    randsize = random(40);
  }

  if (millis()-holdspeed > 2800) // could be (frames%24 ==0) or (frameCount%24 == 0)
  {
    sec++;  
    holdspeed=millis();
    println("        segundo: "+sec);
    randspeed = random(0.02 );
  }



  float rate  ; 
  myFade.display();

  for ( float i = 0 ; i < width ; i ++   ) {
    stroke (255);
    strokeWeight(pointsize);
    point (i+=distance, height* noise(i/100, time));
  }

  rate = rate1 ;
  time = time+rate;

  pointsize = int (randsize);
  distance = int (rand);
  rate1 = randspeed;
} 



class Fade 
{
  // global vars
  int FadeAmount_ = FadeAmount;
  // constructor
  Fade ()
  {
  }
  //  function 
  void display () {

    fill ( #1D2124, FadeAmount);
    noStroke ();
    rect (0, 0, width, height);
  }
}
                
