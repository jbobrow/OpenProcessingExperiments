
/* @pjs preload = "portrait.jpg */
PFont myFont;
PFont garamond;
PImage portrait;
float x = 0;
float y = 0;
int sec = 0;

void setup() {
  background(5);
  size(720, 720);
  myFont = createFont("Georgia", 32);
  garamond = createFont("Garamond",24);
  portrait = loadImage("portrait.jpg");
}
void draw(){
  image(portrait,0,0);
  sec = second();
  if (portrait.width >1){
    sec += 1;
  }
  x = x + 1;
  y = y + 1;
  if (sec >= 2 && sec <= 15){
    textFont(garamond);
    textAlign(LEFT);
    text("People tend to see me as introverted,",100, 100);
    text("reclusive",(-30+x),400);
    text("cold",100,(-40+y));
    text("standoffish",200,(-70+y));
    text("secretive",(-40+x),300);
    text("uncommunicative",500,(-60+y));
  }
  if (sec > 15 && sec <= 50){
    image(portrait,0,0);
    fill(81,222,154);
    textFont(garamond);
    textAlign(LEFT);
    text("But to me introverted means,",100, 100);
    fill(81,157,222);
    text("observant",(-30+x),400);
    fill(155,81,222);
    text("thoughtful",100,(-40+y));
    fill(81,222,211);
    text("self-aware",200,(-70+y));
    fill(127,222,81);
    text("appreciates detail",(-40+x),300);
    fill(81,157,222);
    text("listens",500,(-60+y));
  }
}


