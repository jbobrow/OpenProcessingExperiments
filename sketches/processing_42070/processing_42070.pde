
PFont font;
String message;
float sineWave;

void setup(){
  size(500,500);
  font =loadFont("HelveticaNeue-36.vlw");
  textFont(font,36);
  sineWave=0;  
  message="hello architects";
}

void draw(){
  background(0);
  fill(255,255,255,255*sin(sineWave));
  
  sineWave+=0.02;
  text(message,10,50);
  
}
