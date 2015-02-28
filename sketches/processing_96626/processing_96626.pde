
/*
A simple sketch inspired by the amazing work of Simon Page
http://www.flickr.com/photos/simoncpage/4300431842/in/set-72157623099901702/

Made by @ramayac
*/

float[] rejilla = new float[25];

int margen = 40;
int step = 12;
PFont font;

void setup(){
  size(350, 450);
  
  /*font = loadFont("EuphemiaCAS-18.vlw");
  textFont(font, 18);*/
  
  for(int i = 1; i < 24; i++){
    float x = rejilla[i];
    x = x + step;
    rejilla[i+1] = x;
    //println(rejilla[i]);
  }
}


void draw(){
  background(#050126);
  
  stroke(255);
  text("FUTURISM", 257, 100);
  
  stroke(#B45235);
  for(int i = 0; i < 25; i++){
    line(margen, height/4, margen + rejilla[i], height-margen);  
    
    line(margen + rejilla[i], height/4, margen + rejilla[24], height-margen);
  }

  noLoop();

}

void mousePressed(){
  println(mouseX + ", "+ mouseY); 
}
