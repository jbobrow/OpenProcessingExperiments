
// s keyis for starting the sequence

import de.looksgood.ani.*;

float x, y, diameter;
AniSequence seq;

void setup() {
  size(512,512);
  smooth();
  noStroke();
  textAlign(CORNERS);
  background(255);

  x = 50;
  y = 50;
  diameter = 10;

 
  Ani.init(this); // Ani must be called always first

  seq = new AniSequence(this);
                                       // create a sequence

  seq.beginSequence();
  
  // step 1
  seq.add(Ani.to(this, 1, "diameter", 55));

  // step 2
  seq.add(Ani.to(this, 2, "x:100,y:100"));
  
  // step 3
  seq.add(Ani.to(this, 1, "x:40,y:400"));
  
  // step 4
  seq.add(Ani.to(this, 1, "x:100,y:450"));
  
  // step 5

seq.add(Ani.to(this, 1, "x:200,y:450"));

  // step 6
seq.add(Ani.to(this, 1, "x:150,y:250"));

  // step 7
seq.add(Ani.to(this, 1, "x:10,y:50"));

  // step 8
seq.add(Ani.to(this, 1, "x:120,y:440"));
 
seq.add(Ani.to(this, 1, "x:500,y:350"));

seq.add(Ani.to(this, 1, "x:200,y:30"));


seq.add(Ani.to(this, 1, "x:404,y:40"));

seq.add(Ani.to(this, 1, "x:100,y:450"));

seq.add(Ani.to(this, 1, "x:100,y:450"));


seq.add(Ani.to(this, 1, "x:10,y:50"));

  // step 15
seq.add(Ani.to(this, 1, "x:14,y:45"));
  // step 9
  seq.beginStep();
  seq.add(Ani.to(this, 1, "x:50,y:50"));
  seq.add(Ani.to(this, 2, "diameter", 5));
  seq.endStep();

  seq.endSequence();

  // start the whole sequence
  seq.start();
}

void draw() {
  fill(255,5);
  rect(15,100,width,height);
  
  //println(seq.isFinished());

  fill(12);
  ellipse(x,y,diameter,diameter);
}

// pause and resume animation by pressing SPACE
// or press "s" to start the sequence
void keyPressed() {
  if (key == 's' || key == 'S') seq.start();
  if (key == ' ') {
    if (seq.isPlaying()) seq.pause();
    else seq.resume();
  }
}



