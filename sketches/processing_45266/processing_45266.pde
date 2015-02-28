
import controlP5.*;

ControlP5 controlP5;

int tamanoPunto = 2;
int distance = 1; 
float rate1 = 0.02;
Fade myFade;
float time =0;
int FadeAmount = 60 ;
void setup () 
{
  size ( 800, 400);
  smooth();
  background(#1D2124);
  myFade = new Fade();
  frameRate (25);
  mouseX = 10;

  // HERE !
  controlP5 = new ControlP5(this);
  controlP5.addSlider("distance", 0, 100, 0, width/70, height-(height/8), width/4-(width/40), 40).setId(1);   
  controlP5.addSlider("tamanoPunto", 0, 300, 2, width/4, height-(height/8), width/4-(width/40), 40).setId(2);   
  controlP5.addSlider("rate1", 0.007, 0.1, 0.02, width/2,height-(height/8), width/4-(width/40), 40).setId(3);
  controlP5.addSlider("FadeAmount", 0, 250, width-(width/4), height-(height/8), width/4-(width/40), 40).setId(4);
}
//    

void draw () {
  float rate  ; 
  myFade.display();

  for ( float i = 0 ; i < width ; i ++   ) {
    stroke (255);
    strokeWeight(tamanoPunto);
    point (i+=distance, height* noise(i/100, time));
  }

  rate = rate1 ;
  time = time+rate;
} 

//void keyPressed()
//{
//  if (key == 'w' ) {
//    distance+=1;
//  } 
//  if (key == 'q' ) {
//    distance-=1;
//  } 
//  if (key == 's' ) {
//    tamanoPunto+=1;
//  } 
//  if (key == 'a' ) {
//    tamanoPunto-=1;
//  }
//}

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


