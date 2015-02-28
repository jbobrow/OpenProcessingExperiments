
import ddf.minim.signals.*;
import ddf.minim.*;

basic_circle basic_circle_new = new basic_circle();
interf interf_new = new interf();

int how_many_points;
points[] points_new;
int now = 0;
Minim minim;
AudioOutput out;





void setup(){
    minim = new Minim(this);
out = minim.getLineOut(Minim.STEREO,512);
  size(500,500);
  frameRate(30);
  smooth();
  basic_circle_new.init();
  interf_new.init();
  
  how_many_points = 10;

  rectMode(CENTER);
  
    points_new = new points[how_many_points];
  for (int i = 0; i < how_many_points; ++i) {
    points_new[i] = new points();
  }
  
  
    for (int i = 0; i < how_many_points; ++i) {
    points_new[i].init();
    points_new[i].number = i;
    }  



}



void draw(){

  background(255);
  
 


    for (int i = 0; i < how_many_points; ++i) {
      points_new[i].run();
    }  
  
   basic_circle_new.run();
   interf_new.run();

   


}

public void stop() {
  out.clearSignals();
  out=null;
  super.stop();
}

