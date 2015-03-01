
//

import processing.video.*;
import ddf.minim.*;

Minim minim;
AudioInput in;
float boxSize;

Movie myMovie;
float movieEndBuffer = .5;
boolean bPlayMovie;


void setup(){
  size(800, 450);
  rectMode(CENTER);
  
  minim = new Minim(this);
  in = minim.getLineIn();
  
  myMovie = new Movie(this, "karenfinalsm.mov");
  
  // Pausing the video at the first frame. 
  myMovie.play();
  myMovie.jump(0);
  myMovie.pause();
  
  bPlayMovie = false;
  
}

void draw(){
  background(0);
  stroke(255);
  
  //draw movie
  image(myMovie, 0, 0, width, height);

  //draw sound line
  for(int i = 0; i < in.bufferSize() - 1; i++){
    line( i, height/7 + in.left.get(i)*height/7, 
          i+1, height/7 + in.left.get(i+1)*height/7 );
    line( i, height*6/7 + in.right.get(i)*height/7, 
          i+1, height*6/7 + in.right.get(i+1)*height/7 );
  }
  
  //draw volume box
  boxSize = in.left.level() * 100;
  noFill();
 
 ellipse( 100, height/2, boxSize, boxSize);
  boxSize = in.right.level() * 100;
 ellipse( 700, height/2, boxSize, boxSize);
  
  
  if ( in.left.level() > 0.25){
    bPlayMovie = true;
  }
  
  if ( bPlayMovie ){ 
    myMovie.play();
  }
  
  if ( myMovie.duration() - myMovie.time() < movieEndBuffer ){
    myMovie.jump(0);
    myMovie.pause();
    bPlayMovie = false;
  }
  
  println(myMovie.duration() - myMovie.time());
  
}

void keyPressed(){
  if ( key == 'm' || key == 'M' ){
  }
}

void movieEvent(Movie m) {
  m.read();
}


