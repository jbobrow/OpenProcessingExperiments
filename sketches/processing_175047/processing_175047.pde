
//Hello. I'd like you to meet my friend Spaceworm. He's a nomadic,
//intergalactic annelid with music on the brain. Space is big for
//a tiny little worm, so it takes him a long time to get
//anywhere, but he keeps on trucking anyway, thinking up 
//different sounds for space songs as he goes. You can help! 
//When you press any of the letters which spell the word 'space',
//different sounds are played. Help Spaceworm write his 
//masterpiece. But please, use lower case letters only - he is
//just a little guy, after all!


//Declare a PImage variable type
PImage space;

//Import 'minim' library files
import ddf.minim.*;

//Declare global variables
Minim minim;
AudioSample spaceworm1;
AudioSample spaceworm2;
AudioSample spaceworm3;
AudioSample spaceworm4;
AudioSample spaceworm5;



int step = 1, numFrames = 120, edge=-80, maxY=20;
float theta;
 
void setup() {
  size(1280, 800);
  space = loadImage("space.jpg");
  minim = new Minim(this);
  spaceworm1 = minim.loadSample("spaceworm1.wav");
  minim = new Minim(this);
  spaceworm2 = minim.loadSample("spaceworm2.wav");
  minim = new Minim(this);
  spaceworm3 = minim.loadSample("spaceworm3.wav");
  minim = new Minim(this);
  spaceworm4 = minim.loadSample("spaceworm4.wav");
  minim = new Minim(this);
  spaceworm5 = minim.loadSample("spaceworm5.wav");
}
 void draw() {
  image (space,0,0);
  fill(#AC192A, 150);
  noStroke();
  float angle=0;
  for (int x=-edge; x<width+edge; x+=step) {
    float y = height/2 + map(sin(theta+angle), -1, 1, -maxY, maxY);
    float sz= map(sin(theta+angle*2), -1, 1, 2, 4);
    float rx = map(sin(theta+angle*3), -1, 1, -20, 40);
    float r = map(sin(angle*2), -1, 1, PI/4, PI/2);
    pushMatrix();
    translate(x,y);
    rotate(r);
    ellipse(rx, 0, sz, sz);
    popMatrix();
    angle += (TWO_PI/width*step);
  }
  theta -= TWO_PI/numFrames;
  //if (frameCount<=numFrames) saveFrame("image-###.gif");
}

//Create key triggers
void keyPressed(){
 if (key == 's') spaceworm1.trigger();
 if (key == 'p') spaceworm2.trigger();
 if (key == 'a') spaceworm3.trigger();
 if (key == 'c') spaceworm4.trigger();
 if (key == 'e') spaceworm5.trigger(); 
}

