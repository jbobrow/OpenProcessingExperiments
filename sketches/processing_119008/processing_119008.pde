


void setup(){
  size(600,400);
  background(0);
//  println(PFont.list());
  PFont fnt = createFont("Times-Roman", 48);
//  PFont fnt = loadFont("Times-Roman-48.vlw");
  textFont(fnt);
}

void draw(){
  background(0);
  stroke(255);
  drawString("Hello World! Hello There!");
}

void drawString(String s){
  int x = 50;
  line(x,100, x+textWidth(s),100);
  for(int i = 0; i < s.length(); i++){
    float y = 100 + sin(radians(x*2.0+millis()*0.5)) * 10;
    char c = s.charAt(i);
    text(c, x, y);
    x += textWidth(c);
  }
}


