
PFont ghostbusters;
String words;
String words2;
int c1, c2;
int x, y;


void setup (){
  size (600, 600);
  smooth();
  ghostbusters = loadFont("ghostbusters_48.vlw");
  textFont(ghostbusters);
  words = "there's something strange in your neighborhood";
  words2 = "GHOSTBUSTERS!";
  textAlign(CENTER);
  c1 = 255;
  c2 = 255;
  x = 0;
}

void draw (){
  background (200);
  fill(6, 148, 15);
  textSize(18);
  text (words, 300, 200);
  strokeWeight(2);
  fill(c1);
  ellipse (175, 400, 100, 100);
  fill(c2);
  ellipse(425, 400, 100, 100);
  if(dist(mouseX, mouseY, 175, 400) < 50){
    c1 = 0;
    words = "there is no dana, only zuul!";
  }else if(dist(mouseX, mouseY, 425, 400) < 50){
    c2 = 0;
    words = "who you gonna call?";
  }else{c1 = 255;
  c2 = 255;
  words = "there's something strange in your neighborhood";
  }
  x = x+4;
  if(mousePressed && dist(mouseX, mouseY, 175, 400) < 50) {
    //words = "ahhh! a ghost!";
    noStroke();
    fill(150);
    rect(0, 0, 599, 599);
    fill(255);
    ellipse(x, 150, 65, 100);
    fill(0);
    ellipse(x+5, 125, 10, 10);
    ellipse(x-10, 125, 10, 10);
    ellipse(x, 150, 10, 25);
    textSize(36);
    text("ahhh! a ghost!", 300, 300);
  } else if(mousePressed && dist(mouseX, mouseY, 425, 400) < 50) {
    noStroke();
    fill(0);
    rect(0, 0, 599, 599);
    fill(255);
    textSize(48);
    text(words2, 300, 300);
    }else{x = 0;
  stroke(0);
  }
}


