

int snail_speed = 2;
int chicken_speed = -2;
int duck_speed = 1;
int witch_speed = -1;


PImage chicken;
int chicken_x = 300;
int chicken_y = 100;
int chicken_w = 100;
int chicken_h = 100;

PImage duck;
int duck_x = 0;
int duck_y = 200;
int duck_w = 100;
int duck_h = 100;

PImage snail;
int snail_x = 20;
int snail_y = 0;
int snail_w = 100;
int snail_h = 100;

PImage witch;
int witch_x = 300;
int witch_y = 300;
int witch_w = 100;
int witch_h = 100;

void setup() {
  size(400, 400);
  chicken = loadImage("chicken.jpg");
   duck = loadImage("duck.jpg");
    snail = loadImage("snail.jpg");
     witch = loadImage("witch.jpg");
};

void draw() {
  background(#FFFFFF);
  /*rect(rect_x, 20, rect_w, 100);
  rect_x =  rect_x + rect_speed;*/

  /*chicken stuff*/

  image(chicken, chicken_x, chicken_y, chicken_w, chicken_h);

  chicken_x = chicken_x + chicken_speed;

  /*duck stuff*/

  image(duck, duck_x, duck_y, duck_w, duck_h);

  duck_x = duck_x + duck_speed;

/*snal stuff*/
  image(snail, snail_x, snail_y, snail_w, snail_h);
  
  snail_x = snail_x + snail_speed;
  
  /*witch stuff*/

  image(witch, witch_x, witch_y, witch_w, witch_h);
  
  witch_x = witch_x + witch_speed;

  if ((snail_x + snail_w > width) || (snail_x < 0) ) {
    snail_speed = snail_speed *-1;
  }

  if ((chicken_x + chicken_w > width) || (chicken_x < 0 )) {
    chicken_speed = chicken_speed *-1;
  }

  if ((duck_x + duck_w > width) || (duck_x < 0 )) {
    duck_speed = duck_speed *-1;
  }
    
    if ((witch_x + witch_w > width) || (witch_x < 0 )) {
    witch_speed = witch_speed *-1;
  }
};


