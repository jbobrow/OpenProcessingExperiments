
import ddf.minim.*;



Minim minim;
AudioInput in;

void setup(){
  size(1000,800);
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO,512);
  colorMode(HSB,255);
  background(255);
  smooth();
  
}

void draw(){
  for(int y=0;y<20;y++){
  for(int x=0; x<20;x++){
  rectMode(CENTER);
  ellipse(x*90,y*90,in.mix.get(y)*2000,in.mix.get(y)*2000);
  stroke(random(1000),random(1000),random(1000),100);
  fill(random(1000),random(1000),random(1000),100);
  
  }
  }
  
  
  
}


void stop()
{
  in.close();
  minim.stop(); 
  super.stop();
}



