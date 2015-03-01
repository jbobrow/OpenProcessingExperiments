
float r = 50;
float g = 50;
float b = 50;
int score = 0;
float speedx = 5;
float speedy = 7;
float posx = random(100, 700);
float posy = 100;
float dir = 0;

void setup() {
  size(800, 500);
  frameRate(30);
  background(0);
}

void draw() {
  //fill(0);
  textSize(100);
  text(score, 50, 150); 
  noStroke();
  fill(0, 30);
  rect(0, 0, width, height);
  fill(r, g, b);
  ellipse(posx, posy, 75, 75);
  posx = posx + speedx; 

  if (posx+75/2 >= 800 || posx-75/2 <= 0) {
    speedx=-speedx;
  } 

  posy = posy + speedy;
  if (posy-75/2 <= 0) {
    speedy=-speedy;
  } 
  fill(random(100, 255), random(100, 255), random(100, 255));
  rect(mouseX-125, mouseY-10, 250, 20);
  float rectxb1 = mouseX-125;
  float rectxb2 = mouseX+125;
  float recty = mouseY+-10;
  if (posy>=recty && posy-recty<=10 && rectxb1<=posx && posx<=mouseX) {
    speedy=-speedy;
    //speedx=-speedx;
    score = score +1;
    r = r+random(0, 101);
    r = r-random(0, 100);  
    g = g+random(0, 100);
    g = g-random(0, 100);
    b = b+random(0, 100);
    b = b-random(0, 100);
  } else {
    r= random(0, 255);
    g= random(0, 255);
    b= random(0, 255);
  }

  if (posy>=recty && posy-recty<=10 && mouseX<=posx && posx<=rectxb2) {
    speedy=-speedy;
    speedx=-speedx;
    score = score +1;
    r = r+random(0, 100);
    r = r-random(0, 100);
    g = g+random(0, 100);
    g = g-random(0, 100);
    b = b+random(0, 100);
    b = b-random(0, 100);
  } else {
    r= random(0, 255);
    g= random(0, 255);
    b= random(0, 255);
  }

  if (posy>=525) {
    background(255); 
    fill(0);
    textSize(100);
    text("GAME OVER", 50, 150);
  }
}
void keyPressed() {
  if (key=='r') {
    posx = 100;
    posy = 100;
    score = 0;
  }
}

