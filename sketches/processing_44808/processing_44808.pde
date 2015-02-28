
import colorLib.calculation.*;
import colorLib.*;
import colorLib.webServices.*;

Palette p1;

PImage img;

int step = 1;
int inc = 10;
int N = 500;
int T = 0;

Walker[] walkers;

void setup() {    

  smooth();

  img = loadImage("greenie1.png");
  p1 = new Palette(this, img);

  size(700, 700);
  background(120);

  walkers = new Walker[N];

  for ( int i = 0; i < N; i++) {

    walkers[i] = new Walker();
    walkers[i].start();
  }
  
  frameRate(10);
}

void draw() {

  fill(30, 35);
  ellipseMode(CENTER);
  stroke(255);
  rect(0, 0, width, height);
  

    for ( int i = 0; i < N; i++) {
      walkers[i].walk_periodic_free();
    }

    T += 1;
    
    if( T % 10 == 0){
      if( step < 1 || step == 351 ){
      inc = -inc;
      }    
    step += inc;
    }
    
}

void keyPressed(){
  
 if( key == ' '){
      saveFrame("  #### imagen.png");
 } 
}



