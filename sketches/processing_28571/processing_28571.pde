

PImage bg;
PImage [] dance;
float frame = 0;
int x = 250; //xy where danceman starts out
int y = 375;
int change = 2;
int counter = 0;
float destinY = 0;
boolean hit = false;




void setup() {
  size (500,500);

  dance = new PImage[5];
  for(int i = 0; i<dance.length; i++) {
    dance[i] = loadImage("dance"+ (i+1) +".png");
  }
  bg = loadImage("bg.jpg");
}


void draw() {


  //if (hit == false) {
      if (frame > 4) frame = 0;
 // }
  if (hit == true) {
    //image(dance[5], x, y);
    if(counter%60 == 0) {
      destinY = int(200); 
    }

    }
  if (y == 200) { 
    hit = false;
    if(counter%60 == 0) {
      destinY = int(475);
    }

    //println ("y at 200");
  }
  y += (destinY-y)*0.01;


  image(bg, 0, 0, 500, 500);
  translate(x, y);
  image(dance[int(frame)], -38, -30, 75, 100);
  frame += .1;
  x += change;
  if(x >= 400) {
    change *= -1;
  }
  if(x <= 100) {
    change *= -1;
  }
}

void keyPressed() {
  if(key == 'j') {
    println ("letter j HIT");
    hit = true;
   // frame = 5;

  }
}


