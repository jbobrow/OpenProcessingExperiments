
String xmas[] = {"happy", "yule", "year", "merry", "xmas", "joy", "wishes", "satan", "carol", 
"pagan", "goat", "sacrifice", "snow", "candle", "chestnuts", "gift", "greetings", "holly", "jingle", 
"reindeer", "ritual", "sleigh", "slay", "tinsel", "tree", "astral", "pentagram", };
int xmasLen = xmas.length;

void setup(){
  size(595, 842);
  smooth();
  noStroke();
  background(255, 0, 0);
  
}

void draw(){

}

void mousePressed(){
  background(255, 0, 0);
  for (int x = 0; x < 600; x = x+20) {
  for (int y = 0; y < 850; y = y+20) {
    float a = random(255);
    fill(a);    //Colour
    triangle(0+x,10+y,20+x,0+y,20+x,20+y);
}
}
for (int l = 0; l < 842; l++){
  stroke(255);
  float top = random(200);
  float bot = random(200);
  line(0, l, top, l);
  line(595, l, 595 - bot, l);
  text("*", top, l);
  text("*", 595 - bot, l);
}
for (int m = 0; m < 40; m++){
  //textSize(48);
  fill(random(255));
  textAlign(CENTER);
  rotate(-HALF_PI);
  text(xmas[(int)random(xmasLen)], (int)random(595), (int)random(842));
}

noStroke();
save(random(10000) + "card.tif");
}
