
/*import ddf.minim.*;    //for music
 Minim minim;
 AudioPlayer in;*/

PImage pedo;
PImage back;

PImage princess;
Princess pr1= new Princess();
Princess pr2= new Princess();

float x;
float y;
float bpos=0;

int N = 200;

void setup() {
  size(670, 500);
  background(0);
  smooth();
  back = loadImage("space.png");
  pedo = loadImage("pedo1.png");
  princess = loadImage("princess1.png");
  imageMode(CENTER);

  /*minim = new Minim(this);
   in = minim.loadFile("ontherun.mp3");
   in.play();*/
}

void draw() {
  background(0);
  back();
  bear();  
  pr1.run();
  pr2.run();
}

void back() {
  image(back, bpos, height/2);
  bpos=bpos+5;
  if (bpos==width+500) {
    bpos=0;
  }
}
void bear() {
  float p_y = random(-1, 1);
  x = width-190;
  y = mouseY;
  pushMatrix();
  translate(x, y+p_y);
  noStroke();
  fill(255, 150);
  for (int i = 0; i < N;i++) {
    ellipse(i, random(-10, 10)+p_y, 15, 15);
  }
  image(pedo, 0, 0);
  popMatrix();
}

public class Princess {
  float c_x = 0;
  float c_y = 0;
  float speedX = 0;

  Princess () {
    c_x = random(-200, -50);
    c_y = random(50, 550);
    speedX = random (1.5, 3);
  }
  public void init() {
    translate(0, 0);
    image(princess, c_x, c_y);
    if (c_x > width + 80) {
      c_y = random(height);
      c_x = random(-200, 0);
    }
    //counter++;
  }

  public void speed() {
    c_x+=speedX;
  }

  /*public void collision() {
    if (c_x==width-190 && c_y==mouseY) {
      c_y = random(height);
      c_x = random(-200, 0);
    }
  }*/

  public void run() {
    init();
    speed();
    //collision();
    /*if (counter>150){
     speedX=random(1.5,3)+1;
     }*/
  }
}


