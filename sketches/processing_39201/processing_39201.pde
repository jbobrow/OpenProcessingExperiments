
float timer;
void setup() {
  size (400, 400);
  smooth();
  noStroke();
}

void draw() {
  background (170,235,195);
  countDown();
  loadBar();
  loadingText();
  lightSaber();
}

void countDown() {
  fill(45,125,210);
  textAlign(CENTER, CENTER);
  timer= 5-millis()/1000;
  textSize(20*timer);
  text (" "+timer, 200, 200);
}



void loadBar() {
  float w = map(millis(), 0, 5000, 0, 340);
  rect(20, 350, 360, 40);
  fill(170,235,195);
  rect(30, 360, w, 20);
}


void loadingText() {
  if ((millis()/250)%2<1) {
    fill(45,125,210);
    textSize(12);
    textAlign(LEFT, BOTTOM);
    text("Loading...", 25, 346);
  }
}

void lightSaber() {
  if (timer <=0) {
    imageMode(CENTER);
    PImage kayak;
    kayak=loadImage("kayak.jpg");
    image(kayak, 200, 200);
    fill(255);
    textAlign(CENTER,CENTER);
    textSize(30);
    text("MEOW!!!", random(20,380),random(20,380));
    fill(random(255), random(255), random(255));
    quad(315, 174, 312, 165, 410, 90, 410, 240);
    quad(69, 195, -10, 180, -10, 240, 70, 202);
  }
}


