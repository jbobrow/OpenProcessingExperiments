
PImage jon_selfie, pizza, pizza2, pizza3, donna;
float donna_orig_w, donna_orig_w_half;
float donna_orig_h, donna_x;
float pizza_x, pizza_x2, pizza_x3;

boolean shiftL;

void setup() {
  size(720,960);
  jon_selfie = loadImage("jon_selfie.jpg");
  pizza = loadImage("pizza.png");
  pizza2 = loadImage("pizza.png");
  pizza3 = loadImage("pizza.png");
  donna = loadImage("donna.png");
  image(jon_selfie, 0, 0);
  fill(80);
  donna_orig_w = donna.width;
  donna_orig_h = donna.height;
  donna_orig_w_half = donna.width / 2;
  shiftL = false;
  
  pizza_x = - pizza.width;
  pizza_x2 = 200;
  pizza_x3 = 500;
  
  donna_x = -499;
}

void draw() {
  image(jon_selfie, 0, 0);
  
  if ( pizza_x > width ){
    pizza_x = - pizza.width;
  }
  if ( pizza_x2 > width ){
    pizza_x2 = - pizza.width;
  }
  if ( pizza_x3 > width ){
    pizza_x3 = - pizza.width;
  }
  
  image(pizza, pizza_x, 0);
  image(pizza2, pizza_x2, 150);
  image(pizza3, pizza_x3, 300);
  
  pizza_x += 15;
  pizza_x2 += 15;
  pizza_x3 += 15;
  
  if (shiftL) {
    donna_x -= 10;
    if(donna_x < -500) {
      shiftL = false;
    }
  } else {
    donna_x += 10;
    if(donna_x > 200) {
      shiftL = true;
    } 
  }
  image(donna, donna_x, 450);
}


