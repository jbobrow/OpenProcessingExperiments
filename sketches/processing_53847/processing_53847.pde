
/*Assignment *4
 *Nancy Toure
 *ntoure@brynmawr.edu
 *CS 110 Section 2
 *Submitted 2/27/2012
 This program contains the code for creating
 an object and an array. Arrays were used to make multiply
 falling raindrops. When you press anywhere on
 the screen a raindrop appears and it has a
 maximum number of raindrops. This drawing
 was diffucult because it involved
 bringing together different topics in order to make
 an animated sketch.
 */


//maximum number of raindrops
int MAX_NUM_OBJECTS = 20;
//Array of Raindrops
Raindrop[] drops = new Raindrop[MAX_NUM_OBJECTS];
int idx=0;



float w;
float h;

void setup () {
  //sky and ground
  size(600, 600);

  w= width;
  h= height/2;
}
float r;// x ellipse cloud
float s;// y ellipse cloud
float u;//width of ellipse cloud
float v;//height of ellipse cloud


void draw () {
  //drawing cloud
  r=width/4;
  s=height/4;
  u=width/5;
  v=height/5;
  //sky
  noStroke();
  smooth();
  background(0, 50, 250);
  
   //horizon of the sun
  for (int i= 400; i>50; i-=30) {
    noStroke();
    fill(246, 255, 0);
    ellipse(width/2, height/2, i, i);
  }

  //ground, grass area
  noStroke();
  fill(0, 255, 0);
  rect(0, h, w, h);

  //drawing cloud
  fill(255);
  noStroke();
  smooth();
  ellipse(r, s+10, u, v);
  ellipse(r+40, s+40, u, v);
  ellipse(r-40, s+40, u, v);

  for ( int i=0; i<drops.length;i++) {
    if ( drops[i] != null)
    {
      drops[i].display();
      drops[i].step();
    }
  }
}


void mousePressed () {
  drops [idx]= new Raindrop(mouseX, mouseY);
  idx=(idx+1) % MAX_NUM_OBJECTS;
}



//A raindrop class
class Raindrop {
  int w;
  int h;
  float x;
  float y;

  //Constructor of Raindrop
  Raindrop(float c, float d ) {
    x=c;
    y=d;
    h=10;
    w=10;
  }

  void display () {
    fill(random(255), random(255), random(255));
    ellipse(x, y, w, h);
  }


  void step() {
    y= y+1;
  }
}


