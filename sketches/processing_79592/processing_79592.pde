
// A and D for left and right
//avoid rain, collect sun
//the color of the cloud is the score
//the color will change when is less than 4, 4 to 9, 9 to 13
// 13 to 16, 16 above
//get 17 in 20sec to win




int x = 100;
int z = 0;

int sunY = 0;
int sunX = 0;
int sunY1 = 0;
int sunX1 = 0;
int sunY2 = 0;
int sunX2 = 0;
int sunY3 = 0;
int sunX3 = 0;
int sunY4 = 0;
int sunX4 = 0;
int rainX =0;
int rainY =0;
int rainX1 =0;
int rainY1 =0;
int rainX2 =0;
int rainY2 =0;
int rainX3 =0;
int rainY3 =0;

int s = 0;
PFont font; 
int time = 20;
int timeLast = 0; 
boolean game = true;
PImage[] images = new PImage[10];
void setup() {
  smooth();
  noStroke();

  font = loadFont("Serif-48.vlw"); 
  timeLast = second();
  textFont(font, 32); 
  sunX = int(random(50, 450));
  sunX1 = int(random(50, 450));
  sunX2 = int(random(50, 450));
  sunX3 = int(random(50, 450));
  sunX4 = int(random(50, 450));
  sunY1 = int(random(-240, -300));
  sunY2 = int(random(-90, -100));
  sunY3 = int(random(-250, -300));
  sunY4 = int(random(-200, -240));
  rainX = int(random(0, 500));
  rainX1 = int(random(0, 500));
  rainX2 = int(random(0, 500));
  rainX3 = int(random(0, 500));
  rainY = int(random(-240, -300));
  rainY1 = int(random(-100, -200));
  rainY2 = int(random(-300, -500));
  rainY3 = int(random(-0, -500));


  size(500, 500);
  images[0]  = loadImage("1.png");
  images[1]  = loadImage("2.png");
  images[2]  = loadImage("3.png");
  images[3]  = loadImage("sun.png");
  images[4]  = loadImage("back.png");
  images[5]  = loadImage("rain.png");
  images[6]  = loadImage("win.png");
  images[7]  = loadImage("loss.png");
}

void draw() {
  image(images[4], 0, 0);
  if (second()!=timeLast) { 
    timeLast=second(); 
    time-=1;
  }
  if (time <=0) {
    game = false;
    image(images[7], 0, 0);
    textFont(font, 28); 
    text("Time's up, you did not save the sunflower", 5, 250);
  }
  if (s >= 17) {
    game = false;
    image(images[6], 0, 0);
    textFont(font, 28); 
    text("yeah, the sunflower is happy again", 15, 250);
  }
  if (game) {
    touch();
    flower();
    sundrop();
    rain();
    rainDrop();
    cloud();
  }
  fill(255, 0, 0);
}


void flower() {
  image(images[0], x, 430);

  if (keyPressed) {

    if (key == 'a' || key == 'A') {
      x-=4;
    }

    if (key == 'd' || key == 'D') {
      x+=4;
    }
  }
}
void sundrop() {
  if (time > 15) {
    sunY+=4;
    sunY1+=4;
    sunY2+=4;
    sunY3+=4;
    sunY4+=4;
  }
  if (time>=5 && time <= 15) {
    sunY+=3;
    sunY1+=2;
    sunY2+=4;
    sunY3+=2;
    sunY4+=3;
  }
  if (time < 5) {
    sunY+=4;
    sunY1+=4;
    sunY2+=4;
    sunY3+=4;
    sunY4+=4;
  }
  image(images[3], sunX, sunY);
  image(images[3], sunX1, sunY1);
  image(images[3], sunX2, sunY2);
  image(images[3], sunX3, sunY3);
  image(images[3], sunX4, sunY4);
}

void touch() {
  println(s);
  text("Time left" + time, 0, 100);

  if (sunY4 > 450) {
    sunY4 = 0; 
    sunX4 = int(random(0, 500));
  }
  if (sunY3 > 450) {
    sunY3 = 0; 
    sunX3 = int(random(0, 500));
  }
  if (sunY2 > 450) {
    sunY2 = 0; 
    sunX2 = int(random(0, 500));
  }
  if (sunY1 > 450) {
    sunY1 = 0; 
    sunX1 = int(random(0, 500));
  }
  if (sunY > 450) {
    sunY = 0; 
    sunX = int(random(0, 500));
  }

  if ( dist(sunX, sunY, x, 430) <= 30) {
    sunY = 0;
    sunX = int(random(0, 500));
    s++;
    background(255, 255, 0);
  }

  if ( dist(sunX1, sunY1, x, 430) <= 30) {
    sunY1 = 0;
    sunX1 = int(random(0, 500));
    s++;
    background(255, 255, 0);
  }
  if ( dist(sunX2, sunY2, x, 430) <= 30) {
    sunY2 = 0;
    sunX2 = int(random(0, 500));
    s++;
    background(255, 255, 0);
  }
  if ( dist(sunX3, sunY3, x, 430) <= 30) {
    sunY3 = 0;
    sunX3 = int(random(0, 500));
    s++;
    background(255, 255, 0);
  }
  if ( dist(sunX4, sunY4, x, 430) <= 30) {
    sunY4 = 0;
    sunX4 = int(random(0, 500));
    s++;
    background(255, 255, 0);
  }
}
void rainDrop() {
  if (time > 15) {
    rainY+=2;
    rainY1+=2;
    rainY2+=2;
    rainY3+=2;
  }
  if (time <= 15 && time >= 5) {
    rainY+=4;
    rainY1+=4;
    rainY2+=4;
    rainY3+=4;
  }
  if (time < 5) {
    rainY+=7;
    rainY1+=7;
    rainY2+=7;
    rainY3+=7;
  }

  image(images[5], rainX, rainY);
  image(images[5], rainX1, rainY1);
  image(images[5], rainX2, rainY2);
  image(images[5], rainX3, rainY3);
}
void rain() {

  if (rainY3 > 450) {
    rainY3 = 0; 
    rainX3 = int(random(0, 500));
  }
  if (rainY2 > 450) {
    rainY2 = 0; 
    rainX2 = int(random(0, 500));
  }
  if (rainY1 > 450) {
    rainY1 = 0; 
    rainX1 = int(random(0, 500));
  }
  if (rainY > 450) {
    rainY = 0; 
    rainX = int(random(0, 500));
  }

  if ( dist(rainX, rainY, x, 430) <= 30) {
    rainY = 0;
    rainX = int(random(0, 500));
    s--;
    background(0, 255, 255);
  }

  if ( dist(rainX1, rainY1, x, 430) <= 30) {
    rainY1 = 0;
    rainX1 = int(random(0, 500));
    s--;
    background(0, 255, 255);
  }
  if ( dist(rainX2, rainY2, x, 430) <= 30) {
    rainY2 = 0;
    rainX2 = int(random(0, 500));
    s--;
    background(0, 255, 255);
  }
  if ( dist(rainX3, rainY3, x, 430) <= 30) {
    rainY3 = 0;
    rainX3 = int(random(0, 500));
    s--;
    background(0, 255, 255);
  }
}
void cloud() {
  if ( s <4) {
    fill(100, 100, 255);
  }
  if (s >= 4&& s< 9) {
    fill(100, 100, 0);
  }
  if (s >=9 && s <13) {
    fill(150, 150, 0);
  }
  if (s >= 13&& s< 16) {

    fill(200, 200, 0);
  }
  if (s>=16) {

    fill(255, 255, 0);
  }
  ellipse(160, 50, 355, 50);
  ellipse(160, 30, 455, 50);
  ellipse(360, 30, 455, 50);
  ellipse(360, 50, 155, 50);
}


