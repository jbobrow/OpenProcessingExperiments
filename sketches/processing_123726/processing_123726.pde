

import ddf.minim.*;
Static s1;
Minim minim;
AudioPlayer song;

int numDrops = 2000;
Static[] lines = new Static[numDrops]; // Declare and create the array

void setup() {
  size(600,600);
  minim = new Minim(this);
  song = minim.loadFile("chant1.wav");
    song.loop();
    background(255);
  smooth();
  noStroke();
  //Loop through array to create each object
  for (int i = 0; i < lines.length; i++) {

    lines[i] = new Static(); // Create each object
    s1 = new Static();
  }
}

void draw(){
  fill(255,80);
  rect(0,0,600,600);
  //Loop through array to use objects.
  for (int i = 0; i < lines.length; i++) {
    lines[i].fall();
  }
  ellipseMode(CENTER);
fill(250,0,0,10);
ellipse(width/2, height/2, song.left.get(1)*1000, song.left.get(1)*1000);
  ellipseMode(CENTER);
fill(250,0,0,10);
ellipse(width/2, height/2, song.left.get(1)*700, song.left.get(1)*700);
ellipseMode(CENTER);
fill(#CC0000);    
ellipse(width/2, height/2, song.left.get(1)*500, song.left.get(1)*500);
ellipseMode(CENTER);
fill(#330000);
ellipse(width/2, height/2, song.left.get(1)*250, song.left.get(1)*250);
}

class Static {
  float r = random(600);
  float y = random(-height);

  void fall() {
    y = y + 15;
    fill(0);
    rect(r, y, 1, 100);

   if(y>height){
   r = random(600);
   y = random(-200);
   }

  }
}


