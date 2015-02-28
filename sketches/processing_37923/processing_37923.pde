
//     孙燕姿  我怀念的  MP3

import ddf.minim.*;

AudioInput in;
Minim minim;


void setup(){
  size(1024,600);
  smooth();
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO,1024); 
  background(0);
}

void draw(){
  fill(0,5);
  rect(0,0,width,height);
  noStroke();
 

  
  for(int i = 0;i < in.bufferSize() -1; i+=1) {
    fill(abs(in.left.get(i)*255),random(255),random(255));
    rect( i,  120+in.left.get(i)*100,   in.left.get(i)*6,  in.left.get(i)*100+100);
    
    fill(abs(in.right.get(i)*255),255,0);
    ellipse( i,   280+in.right.get(i)*100,  in.right.get(i)*9,  in.right.get(i)*9);
  } 
}

void stop(){
  in.close(); 
  minim.stop();
  super.stop();
}				
