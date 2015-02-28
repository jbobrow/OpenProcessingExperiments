
String[] s = {
  " _(:3 ⌒ﾞ)_ ", 
  "└(:3」┌)┘", 
  "  (:3_ヽ )_ ", 
  " _(:3ゝ∠)_ "
};

PFont font;

void setup(){
  size(200,150);
  background(255);
  smooth();
  
  font = loadFont("font.vlw");
  textFont(font);
  textAlign(CENTER);
  
  frameRate(8);
}

void draw(){
  background(255);
  
  translate(width/2,height/2);
  
  int r = (int)random(3.4);
  fill(0);
  text(s[r],0,0);
}

