
int globalx = 150;
int globaly = 150;
int y = 30;
int speed = -10;
int speed2 = +10; 
PImage myImage;
boolean bg = false;


void setup() {
  size(700, 700);
  myImage = loadImage("tumblr_lvcn67O5dN1qa1z8jo1_500.jpg");
}
//board
void draw() {
  background(100, 200, 100);
  if (bg == false) {
    tint(255);
    image(myImage, 0, 0, 700, 700);
    }

  if (bg == true) {
    tint(44, 151, 255);
    image(myImage, 0, 0, 700, 700);
  }
  display();
  int x = 30;
  while (x <= width) {
    int y = 30;
    while (y <= height) {
      fill(255, 0, 0);

      rect(x, y, 20, 20);
      y= y + 70;
    }
    x = x + 70;
  }
}

//pacman 
void display() {
  fill(222, 250, 20);
  ellipse(globalx, globaly, 20, 20);
}
//conrolls 
//right  
void move() {
  //globalx = globalx + speed;
  globalx = globalx + speed2;
  if (globalx==700) {
    globalx = globalx + speed;
    bg = false;
  }
}
//left
void move2() {
  globalx = globalx + speed;
  if (globalx==0) {
    globalx = globalx + speed2;
    bg = false;
  }
}
//down
void move3() {

  globaly = globaly +speed2;
  if (globaly==700) {
    globaly = globaly + speed;
        bg = true;

  }
}
//up
void move4() {
  globaly = globaly + speed;
  if (globaly==0) {
    globaly = globaly +speed2;
        bg = true;

  }
}

void keyPressed() {
  /*w is up
   s is down
   a is left
   d is right*/
  if (key == 'w') {
    move4();
  }
  if (key == 's') {
    move3();
  }
  if (key == 'a') {
    move2();
  }
  if (key == 'd') {
    move();
  }
}



