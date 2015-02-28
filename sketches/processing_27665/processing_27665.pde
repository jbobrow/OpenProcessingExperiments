
PImage fish;
float speed3= 1;
int hfish = 40;
int wfish = 80;
float x = -wfish;

PShape bird;
int hbird = 60;
int wbird = 90;
float w= width;
float speed4 = 2.5;

float radius = 20;
float y = 510;
float speed = 2;
boolean drawBubble = false;
float angle = 0.0;
float offset = 0;
float scalar = 5;
float speed2 = 0.1;

int f = 20;


void setup() {
  size(640, 480);
  smooth();
  noStroke();
  fish = loadImage("fish.gif");
  bird = loadShape("Angry-Bird.svg");
}

void draw() {
  background(255);
  fill(23, 27, 206);
  float h = hour();
  float m = minute();
  float s = second();
  float y1 = offset + sin(angle) * scalar;
  float y3 = offset + -sin(angle) * scalar;
  float y2 = offset + cos(angle) * scalar;
  float y4 = offset + -cos(angle) * scalar;


  //MINUTES
  //OFFSET OF CURVE
  offset = m * 220/59;
  if (m>=2 && m<5) {
    offset = m* 350/59;
  }
  if (m>=5 && m<10) {
    offset = m * 400/59;
  }
  if (m>=10 && m<20) {
    offset = m * 450/59;
  }
  if (m >=20 && m<30) {
    offset = m * 460/59;
  }
  if(m>=30) {
    offset = m * (470)/59;
  }

  //CURVE
  m = map(m, 0, 59, 480, 0);
  rect(0, 480-m, 640, m);
  beginShape();
  curveVertex(-10, 485-m);
  curveVertex(-10, 485-m);
  for(int i = 0; i<39; i++) {
    if(i%4 == 0) {
      curveVertex(16*(i+1), y1);
    } 
    else if (i%4 == 1) {
      curveVertex(16*(i+1), y2);
    } 
    else if (i%4 == 2) {
      curveVertex(16*(i+1), y3);
    } 
    else if (i%4 == 3) {
      curveVertex(16*(i+1), y4);
    }
  }
  curveVertex(650, 485-m);
  curveVertex(650, 485-m);
  endShape();
  angle += speed2; 



  //SECONDS 
  if(s % 5 == 0 && drawBubble == false) {
    drawBubble = true;
  }

  if (drawBubble == true) {
    fill(255);
    y -= speed;
    ellipse(550 + sin(angle) * scalar*2.5, y, radius + cos(angle) *scalar, radius + -sin(angle) *scalar);
    if (y < 0) {
      drawBubble = false;
      y = 500;
    }
  }


  m = minute();
  //HOUR
  if(h > 12) {
    h -= 12;
  }
  x += speed3;
  if (x > width+hfish) { 
    x = -wfish;
  }

  w -= speed4;
  if (w< 0) {
    w=width+hbird;
  }

//FISHES+BIRDS
  //1 FB
  for(int u=1; u<= 12; u++) {
    if(h == u && m<32.305) {
      image(fish, x, 258.461, wfish, hfish);
    }
    if(h == u && m>=32.305) {
      shape(bird, w-hbird, 258.461-f, wbird, hbird);
    }
  }

  //2 FB
  for(int u=2; u<= 12; u++) {
    if(h == u && m<27.690) {
      image(fish, x, 221.538, wfish, hfish);
    }
    if(h == u && m>=27.690) {
      shape(bird, w-hbird, 221.538-f, wbird, hbird);
    }
  }

  //3 FB
  for(int u=3; u<= 12; u++) {
    if(h == u && m<36.92) {
      image(fish, x, 295.384, wfish, hfish);
    }
    if(h == u && m>=36.92) {
      shape(bird, w-hbird, 295.384-f, wbird, hbird);
    }
  }

  //4 FB
  for(int u=4; u<= 12; u++) {
    if(h == u && m<23.075) {
      image(fish, x, 184.615, wfish, hfish);
    }
    if(h == u && m>=23.075) {
      shape(bird, w-hbird, 184.615-f, wbird, hbird);
    }
  }

  //5 FB
  for(int u=5; u<= 12; u++) {
    if(h == u && m<41.535) {
      image(fish, x, 332.307, wfish, hfish);
    }
    if(h == u && m>=41.535) {
      shape(bird, w-hbird, 312.307, wbird, hbird);
    }
  }  

  //6 FB
  for(int u=6; u<= 12; u++) {
    if(h == u && m<18.460) {
      image(fish, x, 147.692, wfish, hfish);
    }
    if(h == u && m>=18.460) {
      shape(bird, w-hbird, 147.692-f, wbird, hbird);
    }
  }  

  //7 FB
  for(int u=7; u<= 12; u++) {
    if(h == u && m<46.15) {
      image(fish, x, 369.23, wfish, hfish);
    }
    if(h == u && m>=46.15) {
      shape(bird, w-hbird, 369.23-f, wbird, hbird);
    }
  }   

  //8 FB
  for(int u=8; u<= 12; u++) {
    if(h == u && m<13.845) {
      image(fish, x, 110.769, wfish, hfish);
    }
    if(h == u && m>=13.845) {
      shape(bird, w-hbird, 110.769-f, wbird, hbird);
    }
  }

  //9 FB
  for(int u=9; u<= 12; u++) {
    if(h == u && m<50.765) {
      image(fish, x, 406.153, wfish, hfish);
    }
    if(h == u && m>=50.765) {
      shape(bird, w-hbird, 406.153-f, wbird, hbird);
    }
  }

  //10 FB
  for(int u=10; u<= 12; u++) {
    if(h == u && m<9.230) {
      image(fish, x, 73.846, wfish, hfish);
    }
    if(h == u && m>=9.230) {
      shape(bird, w-hbird,73.846-f, wbird, hbird);
    }
  }

  //11 FB
  for(int u=11; u<= 12; u++) {
    if(h == u && m<55.380) {
      image(fish, x, 443.076, wfish, hfish);
    }
    if(h == u && m>=55.380) {
      shape(bird, w-hbird,443.076-f, wbird, hbird);
    }
  }  

  //12 FB
  for(int u=12; u<= 12; u++) {
    if(h == u && m<4.615) {
      image(fish, x, 36.923, wfish, hfish);
    }
    if(h == u && m>=4.615) {
      shape(bird, w-hbird ,36.923-f, wbird, hbird);
    }
  }
}


