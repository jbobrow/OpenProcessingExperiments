

PImage chicken, hand;
float p1 = 0; //chicken x position
float p2 = 0; //hand x position
float v1 = 10; //chicken speed
float v2 = 10; //hand speed

float ex = 50, ey = 90; //position of egg
float r = 10; //radius of egg
float vx = 1, vy = 3;//egg speed

int score1; //chicken score
int score2; //hand score

boolean l1, l2, r1, r2; 

void setup () {
  size(600, 600);
  chicken = loadImage("Chicken.jpg");
  hand = loadImage("hand.jpg");
  noStroke();
  textSize(20);
}


void draw () {
  background(#F8E4A1);

  drawFence();
  movement();
  stopPaddle();
  collision();

  fill(#7A3710);
  text(score1, 560, height/2 + 50);
  text(score2, 560, height/2 - 45);


  image(chicken, p1, 500);
  image(hand, p2, 50);

  fill(#F3AC83);
  ellipse(ex, ey, 2*r, 2*r);
}


void keyPressed() {
  //hand movement
  if (key == 'z') {
    l1 = true;
    r1 = false;
  }
  if (key =='x') {
    r1 = true;
    l1 = false;
  }

  //chicken movement
  if (key == CODED) {
    if (keyCode == LEFT) {
      l2 = true;
      r2 = false;
    }
  }
  if (key ==CODED) {
    if (keyCode == RIGHT) {
      r2 = true;
      l2 = false;
    }
  }

//increse and decrese egg speed
  if (key == CODED) {
    if (keyCode == UP) {
      vy += 1;
    }
  }
  if (key == CODED) {
    if (keyCode == DOWN) {
      vy -= 1;
    }
  }
}

void keyReleased() {
  //hand 
  if (key == 'z') {
    l1 = false;
  }
  if (key =='x') {
    r1 = false;
  }

  //chicken
  if (key == CODED) {
    if (keyCode == LEFT) {
      l2 = false;
    }
  }
  if (key ==CODED) {
    if (keyCode == RIGHT) {
      r2 = false;
    }
  }
}


void movement() {
  ex += vx;
  ey += vy;

  if (l1) p1 -= v1;
  if (l2) p2 -= v2;
  if (r1) p1 += v1;
  if (r2) p2 += v2;
}

//stop the paddles(hand and chicken) from going outside the border
void stopPaddle() {
  if (p1 + 100 >= width) {
    p1 = width - 100;
  }
  if ( p1 <= 0) {
    p1 = 0;
  }

  if (p2 + 100 >= width) {
    p2 = width - 100;
  }

  if ( p2 <= 0) {
    p2 = 0;
  }
}

void collision () {
  //ball to chicken
  if ((ey +r >= 500) && (ex-r >= p1) && (ex+r <= p1 + 100)) {
    ey = 500 -r -1;
    vy *= -1;
  } 

  if ((ey +r >= 500) && (ex-r < p1) && (ex+r > p1 + 100)) {
    ey = 501 -r;
    vy *= 1;
  }  

  if (ey +r >= height) {
    score2++;
    delay(1000);
    ex = width/2;
    ey = height/2;
  }

  //ball to hand
  if ((ey - r <= 82) && (ex-r >= p2) && (ex+r <= p2 + 100)) {//82 is 50+ height of the pic(hand)
    ey =  82 + r;
    vy *= -1;
  } 

  if ((ey - r <= 82) && (ex-r < p2) && (ex+r > p2 + 100)) {
    ey = 82 +r;
    vy *= 1;
  }

  if (ey - r <= 0) {
    score1 ++;
    delay(1000);
    ex = width/2;
    ey = height/2;
  }

  //left and right border
  if ((ex - r <= 0) || (ex +r >= width)) {
    vx *= -1;
  }
}


void drawFence() {
  rectMode(CENTER);
  fill(#7A3710, 150);
  rect(width/2, height/2 - 15, width, 10);
  rect(width/2, height/2 + 15, width, 10);
  for (int i = 0; i <30; i ++) {
    int f = 0;
    f = f + 30*i;   
    rect(20+f, height/2, 10, 60);
  }
}



