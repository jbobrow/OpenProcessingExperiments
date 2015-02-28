
PFont font;
PFont font2;
PFont impact;
PImage keanu;
PImage yodawg;

void setup(){
  size(500,500);
  font = loadFont("font.vlw");
  font2 = loadFont("ColonnaMT-48.vlw");
  impact = loadFont("Impact-48.vlw");
  keanu = loadImage("conspiracy-keanu.jpg");
  yodawg = loadImage("yodawg.jpeg");
}

 void draw(){
 textAlign(CENTER);
 background(0,0,0);
 
 tint(190,175,200);
 image(keanu,0,0,500,500);
 
 image(yodawg,380,405, yodawg.width/5, yodawg.height/5);
 
 
 textFont(impact);
 textSize(30);
 fill(0,0,0);
 text ("What if 12/21/2012 is the day", mouseX+2, mouseY+2); 
 fill(255,255,255);
 text ("What if 12/21/2012 is the day", mouseX, mouseY); 
 fill(0,0,0);
 text("processing becomes self-aware?", 250,410);
 fill(255,255,255);
 text("processing becomes self-aware?", 252,412); 
 
 textSize(15);
 fill(0,0,0);
 text("yo dawg I hear", 350,450);
 fill(255,255,255);
 text("yo dawg I hear",352,452);
  fill(0,0,0);
 text("you like processing", 350,480);
 fill(255,255,255);
 text("you like processing",352,482);
 
}


