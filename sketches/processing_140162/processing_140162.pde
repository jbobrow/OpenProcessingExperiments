
// EVIL ROBOT

void setup() {
  size(600,600);
  smooth();
}

void draw() {
  background(#49DB8C);
  
  float x = mouseX;
  float y = mouseY;
  
  // leg
  
  noFill();
  stroke(80);
  strokeWeight(20);
  line(300,400,300,450);
  bezier(250,500,250,450,350,450,350,500);
  noStroke();
  fill(0);
  ellipse(250,500,50,50);
  ellipse(350,500,50,50);
  
  // eyes
  
  fill(255);
  stroke(80);
  strokeWeight(3);
  ellipse(270,180,80,80);
  ellipse(330,180,80,80);
  
  float pupilX1 = map(mouseX,0,width,245,280);
  float pupilX2 = map(mouseX,0,width,305,355);
  float pupilY = map(mouseY,0,height,150,210);
  noStroke();
  fill(0);
  ellipse(pupilX1,pupilY,20,20);
  ellipse(pupilX2,pupilY,20,20);
  
  // main body
  
  rectMode(CENTER);
  fill(80);
  noStroke();
  rect(300,300,300,200);
  fill(0);
  rect(300,300,280,180);
  
  // moving arms and text
  
  /*
  quadrant 1 is upper left, x < 300 and y < 300
  quadrant 2 is upper right, x > 300 and y < 300
  quadrant 3 is lower left, x < 300 and y > 300
  quadrant 4 lower right, x > 300 and y > 300
  */
  
  PFont font;
  font = loadFont("AmericanTypewriter-Condensed-48.vlw");
  textFont(font);
  
  // qudrant 1
  
  if ((x < 300) && (y < 300)) {
    stroke(80);
    strokeWeight(20);
    noFill();
    bezier(140,300,0,300,50,150,50,150);
    bezier(460,300,600,300,550,150,550,150);
    noStroke();
    fill(0);
    ellipse(50,150,50,50);
    ellipse(550,150,50,50);
    fill(#49DB8C);
    textSize(15);
    String a = "Hello world!";
    String b = "What a great day to be born!";
    textAlign(CENTER);
    text(a,300,300);
    text(b,300,315);
  }
  
  // quadrant 2
  
  if ((x > 300) && (y < 300)) {
    stroke(80);
    strokeWeight(20);
    noFill();
    bezier(140,300,0,300,50,150,50,150);
    bezier(460,300,600,300,550,450,550,450);
    noStroke();
    fill(0);
    ellipse(50,150,50,50);
    ellipse(550,450,50,50);
    fill(#49DB8C);
    textSize(15);
    String c = "Beep boop boop bop!";
    String d = "Pewwwww pewwwwwwwwww!";
    textAlign(CENTER);
    text(c,300,300);
    text(d,300,315);
  }
  
  // quadrant 3
  
  if ((x < 300) && (y > 300)) {
    stroke(80);
    strokeWeight(20);
    noFill();
    bezier(140,300,0,300,50,450,50,450);
    bezier(460,300,600,300,550,150,550,150);
    noStroke();
    fill(0);
    ellipse(50,450,50,50);
    ellipse(550,150,50,50);
    fill(#49DB8C);
    textSize(15);
    String e = "The hills are alive";
    String f = "with the sound of Processing";
    textAlign(CENTER);
    text(e,300,300);
    text(f,300,315);
  }
  
  // quadrant 4
  
  if ((x > 300) && (y > 300)) {
    stroke(80);
    strokeWeight(20);
    noFill();
    bezier(140,300,0,300,50,450,50,450);
    bezier(460,300,600,300,550,450,550,450);
    noStroke();
    fill(0);
    ellipse(50,450,50,50);
    ellipse(550,450,50,50);
    fill(#49DB8C);
    textSize(15);
    String g = "I'm lonely";
    String h = "Someone code me a friend!";
    textAlign(CENTER);
    text(g,300,300);
    text(h,300,315);
  }
}


