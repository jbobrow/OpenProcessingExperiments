
PFont font;
PImage xray;
int time, pace, x;
float shade, siz;
boolean alive;

void setup() {
  size(800, 600);
  font = loadFont("DaunPenh-72.vlw");
  xray = loadImage("chest.jpg");
  textFont(font);
  textAlign(CENTER);
  pace = 900;
  loop();
  alive = true;
}

//DaunPenh-72

void draw() {
  background(200);
  image(xray, 0, 0, 800, 600);
  shade = map(x, 0, 500, 0, 200);      //modifies coloring and sizing variables to fit proper scale
  siz = map(x, 0, 430, 0, 20);
  text("pulmonary", width/2 + 100, height/2-100);
  /*time = second() % 6;
   if (time == 3) {
   textSize(120);
   } else if (time == 5) textSize(90);
   else textSize(72);*/
  x = int(dist(width/2+100, height/2-100, mouseX, mouseY));
  pace = (2*x + 600);

  if (alive) {
    fill(200 - shade, 0, shade);
    time = millis() % pace;          //the greater "pace" is, the longer the heartbeat cycle takes; pace is dependent on mouse distance from heart location
    if (((time > 50) && (time < 100)) || ((time > 130) && (time < 180))) {
      textSize(95-siz);
    } 
    else if ((time >=100) && (time < 130)) {
      textSize(130-siz);
    } 
    else if ((time > 350) && (time < 400)) {
      textSize(110-siz);
    }
    else textSize(72);
  } else {
    fill(0);
  }
}

void mouseClicked() {        //clicking the mouse "kills" the patient; clicking again revives him/her
  if (alive) alive = false;
  else if (!alive) alive = true;
  //println(alive);
}

