

PImage bg;
PImage [] dance;
Dance [] dances; 
boolean jump = false; 




void setup() {
  size (500,500);
  dance = new PImage[5];

  dances = new Dance [5];
  for(int i = 0; i < dances.length; i++) {
    dances[i] = new Dance(random(0,500), 400); // where they start
  }

  for(int i = 0; i < dance.length; i++) {
    dance[i] = loadImage("dance"+ (i+1) +".png");
  }
  bg = loadImage("bg.jpg");
}



void draw() {

  image(bg, 0, 0, 500, 500);
  for(int i = 0; i < dance.length; i++) {
    dances[i].update();
  }
}

class Dance {
  float x;
  float y;
  float velY;
  float velX;
  float destinY;
  float destinX;
  int counter;
  int frame;
  int speedFrame;


  Dance (float xpos, float ypos) {
    x = xpos;
    y = ypos;
    speedFrame = int (random(2,25));
    destinX = x;
    destinY = y;
  }
  void update () {

    if(frame > 3) frame = 0;
    pushMatrix ();
    translate (x, y);

    if(counter%100 == 0) {
      destinX = int(random(-100,600));
    }
    if (jump = false) {
      if(counter%60 == 0) {
        destinY = int(395);
      }
      else {
        destinY = int(325);
      }
    }

    x += (destinX-x)*0.01;
    y += (destinY-y)*0.01;
    if(counter%speedFrame==0) {
      frame++;
    }

    image (dance[frame], -50, -50, 100, 100);
    popMatrix();
    counter++;
  }
}






