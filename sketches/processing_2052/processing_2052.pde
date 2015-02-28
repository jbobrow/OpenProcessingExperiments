

PFont font;
float t;
int step = 0;
String l, r;

void setup() {
  size(300, 100);
  font = loadFont("font.vlw");
  textFont(font, 28);
  textAlign(CENTER, CENTER);
  l = "zzz";
  r = ":(";
  noStroke();
  ellipseMode(CENTER);
}

void draw() {
  
  t += 0.1;
  
  background(150 + sin(t) * 20 + random(10));
  
  for(int i = 0; i < 10; i++) {
    fill(random(100, 200), random(30, 60)); 
    rect(random(width), 0, random(10, 20), height);
  }
  
  fill(100, 50);
  float rr = random(40, 80);
  ellipse(50, 50, rr, rr);
  ellipse(250, 50, rr, rr);
    
  if(step == 0) l = "zzz";
  if(step == 50) r = ":(";
  if(step == 100) l = ":)";
  if(step == 150) r = ":)";
  if(step == 200) l = "?";
  if(step == 250) {
     int ran = int(random(3));
    if(ran == 0) r = "!!!";
    if(ran == 1) r = "...";
    if(ran == 2) r = ":|";
  }
  if(step == 300) r = "?";
  if(step == 350) {
     int ran = int(random(3));
    if(ran == 0) l = "!!!";
    if(ran == 1) l = "...";
    if(ran == 2) l = ":|";
  }
  if(step == 400) r = "<3";
  if(step == 450) l = "<3";
  if(step == 500) r = "zzz";
  if(step == 550) l = ":(";
  
  if(step == 600) r = ":)";
  if(step == 650) l = ":)";
  if(step == 700) r = "?";
  if(step == 750) {
     int ran = int(random(3));
    if(ran == 0) l = "!!!";
    if(ran == 1) l = "...";
    if(ran == 2) l = ":|";
  }
  if(step == 800) l = "?";
  if(step == 850) {
     int ran = int(random(3));
    if(ran == 0) r = "!!!";
    if(ran == 1) r = "...";
    if(ran == 2) r = ":|";
  }
  if(step == 900) l = "<3";
  if(step == 950) r = "<3";
  
  step += 1;
  if(step == 1000) step = 0;
  
  fill(#FFE308);
  text(l, 50, 50);
  fill(#FC3B3B);
  text(r, 250, 50);
}























