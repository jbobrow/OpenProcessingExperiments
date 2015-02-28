
Jelly[] bob = new Jelly[170];

void setup() {

  //set the canvas
  size(800, 600);
  background(5);

  //draw jelly beams
  for (int i=0;i<bob.length;i++) {  
    bob[i]=new Jelly();
    bob[i].prime(random(20, width-20), random(20, height-20), 25, 25, int(random(0, 10)), int(random(0, 155)), int(random(0, 155)));
  }
  
  //write out instructions
  fill(255);
  text("Hold on to your UP and DOWNs",80,100);
}

void draw() {
  for (int i=0;i<bob.length;i++) {
    bob[i].animate();
  }
}

class Jelly {

  //declare variables
  float x;
  float y;
  float w;
  float h;
  int jellyR;
  int jellyG;
  int jellyB;

  //declare animation variables
  float ySpeed;
  float xSpeed;
  float gravity;

  //set up
  void prime(float a, float b, float c, float d, int R, int G, int B) {
    //rename variables
    x=a;
    y=b;
    w=c;
    h=d;
    jellyR=R;
    jellyG=G;
    jellyB=B;

    //define speed and gravity
    ySpeed=random(-0.1, 0.1);
    xSpeed=random(-0.1, 0.1);
    gravity=0.8;
  }

  void animate() {
    //Jelly body
    noFill();
    stroke(jellyR, jellyG, jellyB);
    strokeWeight(5);
    arc(x, y, w, h, 0, PI / 2.0);

    //Jelly float
    x += xSpeed;
    y += ySpeed;

    //keep Jellies in the canvas
    if (x<0 || x>width) {
      xSpeed*=-1;
    }
    if (y<0 || y>height) {
      ySpeed*=-1;
    }

    //key pressed create actions to jelly beams
    if (keyPressed==true) {
      if (key == CODED) {
        if (keyCode == UP) {
          jellyR += 5;
        }
        if (keyCode == DOWN) {
          jellyR -= 5;
        }
      }
    }
  }
}



