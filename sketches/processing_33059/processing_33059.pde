

int img3_speed = 5;
int img1_speed = -4;
int img2_speed = 3;
int img4_speed = -1;


PImage chicken;
int img1_x = 300;
int img1_y = 100;
int img1_w = 100;
int img1_h = 100;

PImage duck;
int img2_x = 0;
int img2_y = 200;
int img2_w = 100;
int img2_h = 100;

PImage snail;
int img3_x = 20;
int img3_y = 0;
int img3_w = 100;
int img3_h = 100;

PImage witch;
int img4_x = 300;
int img4_y = 300;
int img4_w = 100;
int img4_h = 100;

void setup() {
  size(400, 400);
};

void draw() {
  background(#FFFFFF);
  /*rect(rect_x, 20, rect_w, 100);
  rect_x =  rect_x + rect_speed;*/

  /*chicken stuff*/
  chicken = loadImage("chicken.jpg");
  image(chicken, img1_x, img1_y, img1_w, img1_h);

  img1_x = img1_x + img1_speed;

  /*duck stuff*/

  duck = loadImage("duck.jpg");
  image(duck, img2_x, img2_y, img2_w, img2_h);

  img2_x = img2_x + img2_speed;

/*snal stuff*/
  snail = loadImage("snail.jpg");
  image(snail, img3_x, img3_y, img3_w, img3_h);
  
  img3_x = img3_x + img3_speed;
  
  /*witch stuff*/
  witch = loadImage("witch.jpg");
  image(witch, img4_x, img4_y, img4_w, img4_h);
  
  img4_x = img4_x + img4_speed;

  if ((img3_x + img3_w > width) || (img3_x < 0) ) {
    img3_speed = img3_speed *-1;
  }

  if ((img1_x + img1_w > width) || (img1_x < 0 )) {
    img1_speed = img1_speed *-1;
  }

  if ((img2_x + img2_w > width) || (img2_x < 0 )) {
    img2_speed = img2_speed *-1;
  }
    
    if ((img4_x + img4_w > width) || (img4_x < 0 )) {
    img4_speed = img4_speed *-1;
  }
};


