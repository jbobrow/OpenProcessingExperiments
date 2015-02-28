
int tamanoPunto = 1;
int distance = 1; 
Fade myFade;
float time =0;
void setup () 
{
  size ( 800, 400);
    smooth();
  background(#1D2124);
  myFade = new Fade();
    frameRate (25);   
}

void draw () {
  float rate  ; 
myFade.display();

 for ( float i = 0 ; i < width ; i ++   ){
stroke (255);
strokeWeight(tamanoPunto);
 point (i+=distance, height* noise(i/100, time));
  }
 
 rate = float(mouseX) / 800;
  time = time+rate;
   
}

void keyPressed()
{
 if (key == 'w' ) {
  distance+=1;
    } 
    if (key == 'q' ) {
  distance-=1;
    } 
     if (key == 's' ) {
  tamanoPunto+=1;
    } 
      if (key == 'a' ) {
  tamanoPunto-=1;
    } 
}
















class Fade 
{
// global vars
int amount = 40;
// constructor
Fade ()
{
}
//  function 
  void display (){
  
  fill ( #1D2124,amount);
  noStroke ();
  rect (0, 0, width, height);


}}
                                
