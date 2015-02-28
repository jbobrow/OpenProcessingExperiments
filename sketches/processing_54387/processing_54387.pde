
PFont myfont;

void setup(){
  size(600,600);
  background(255,255,255);
  myfont = loadFont("Proxy8-48.vlw");
}
void draw(){
    textFont(myfont);
    fill(random(255),random(255),random(255),random(255));
    textSize(random(10, 1000));
    text("Caproccio\nTextron\nAlphagrapghics",random(-50,300),random(-50,300));
  }



