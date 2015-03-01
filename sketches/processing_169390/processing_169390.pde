
PFont font1;
void setup(){
  size(400,200);
  background(#38FADE);
}
void draw(){
  PFont f1;
  f1 = loadFont("Chalkduster-48.vlw");
  
  for(int i = -1; i<20; i++){
    fill(random(255),random(255));
    textFont(f1);
    text("L",i*20,40);
    text("O",i*20,70);
    text("V",i*20,100);
    text("E",i*20,130);
    text("L",i*20,160);
    text("Y",i*20,190);
  }
}
