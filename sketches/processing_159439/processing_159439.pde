
int a;
void setup () {
  background (124, 30, 175);
  size (150, 800);
  stroke(189, 70, 255);
  for (int a = 10; a<620; a= a+10) {
    line(0, a, width-25, a);
  } 
  PFont font;
  font    = loadFont("SansSerif-10.vlw");
  textFont(font);
  fill(189, 70, 255);
  text("0", 130, 15+10);
  text("5", 130, 25+50);
    text("10", 130, 25+100);
    text("15", 130, 25+150);
    text("20", 130, 25+200);
    text("25", 130, 25+250);
    text("30",130,25+300);
    text("35",130,25+350);
    text("40",130,25+400);
    text("45",130,25+450);
    text("50",130,25+500);
    text("55",130,25+550);
  
} 
void draw () {

  noStroke();

  int s = second()*10+20;
  int m = minute()*10+20;
  int h = hour()*10+20;

  fill(random(100, 220), s/5, random(0, 150));

  ellipse(20, s, 10, 10);
  fill(random(180, 255), m/5, random(80, 148));
  ellipse(50, m, 10, 10);
  fill(random(0, 150), h/2, random(70, 170));
  ellipse(80, h, 10, 10);
}
