
import ddf.minim.*;

int x = 150;
int y = 200;
int i = 150;
int k = 170;
int a = 290;
int b = 130;
int c = 180;
int o = 0;
int leyew;
int leyeh;
int reyew;
int reyeh;
color ran;

Minim pika1;
Minim pika2;
Minim pika3;
AudioPlayer player1;
AudioPlayer player2;
AudioPlayer player3;

void setup() { 
  size(450, 400);
  frameRate(3);
  leyew = 12;
  leyeh = 16;
  reyew = 20;
  reyeh = 20;
  
  pika1 = new Minim(this);
  pika2 = new Minim(this);
  pika3 = new Minim(this);
  
  player1 = pika1.loadFile("pika1.mp3");
  player2 = pika2.loadFile("pika2.mp3");
  player3 = pika3.loadFile("pika3.mp3");
}

void draw() {
  smooth();
  noStroke();
  background(ran);
  
  fill(251, 2, 84);
  ellipse(x, y, 15, 20);
  ellipse(x+100, y-3, 30, 30);
  
  fill(0); // Left Ear
    beginShape();
    curveVertex(k, i+10);
    curveVertex(k+5, i-38);
    curveVertex(k+30, i-100);
    curveVertex(k+40, i-60);
    curveVertex(k+50, i-55);
    endShape();
    
    beginShape(); // Right Ear
    curveVertex(a+5, b);
    curveVertex(a+-18, b-22);
    curveVertex(a+60, b-20);
    curveVertex(a-20, b+29);
    curveVertex(a-20, b+-151);
    endShape();
    
    beginShape(); // Mouth
    curveVertex(x+-3, c);
    curveVertex(x+25, c+-2);
    curveVertex(x+50, c+40);
    curveVertex(x+60, c+10);
    curveVertex(x+60, c);
    endShape();
    
  fill(ran); // Negative Space
    ellipse(k+33, i-23, 60, 70);
    ellipse(a-10, b, 50, 80);
    ellipse(x+40, c+5, 40, 20);
    
  fill(0); // Eyes
    ellipse(x+13, y-32, leyew, leyeh);
    ellipse(x+75, y-35, reyew, reyeh);

    beginShape(); // Tail
    vertex(282, 310);
    vertex(310, 334);
    vertex(320, 310);
    vertex(315, 290);
    vertex(320, 290);
    vertex(310, 270);
    vertex(301, 276);
    vertex(310, 316);
    vertex(300, 310);
    endShape();  
}

void mousePressed() {
  ran = color(random(255), random(255), random(255));
  if(o == 0) {
    o = 1;
    leyew = 12;
    leyeh =  5;
    reyew = 20;
    reyew = 20;
    player1.play();
    player1.rewind();
  } else if(o == 1) {
    o = 2;
    leyew = 12;
    leyeh = 16;
    reyew = 20;
    reyeh = 20;
    player2.play();
    player2.rewind();
  } else {
    o = 0;
    reyew = 20;
    reyeh = 5;
    player3.play();
    player3.rewind();
  }
}

