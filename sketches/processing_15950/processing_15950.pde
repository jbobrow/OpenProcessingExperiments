
int s = second(); 
int m = minute();
int h = hour();
PImage b;
PFont font;


void setup(){
  size(360,600);
  stroke(255);
  smooth();
  textAlign(CENTER);
    
}
void draw(){
  
  fill(247,112,7,67);
  noStroke();
  b = loadImage("bgimage_002.jpg");
  background(b);
  
  
  
  
  float e = random(170,190);
  float e2= random(173,191);
  float e3= random(30, 60);
  float e4= random(45, 65);
  float e5= random(400, 420);
  float e6= random(360, 400);
  float e7= random(380, 420);
  float e8=random(170,191);
  float e9=random(175,193);
  float r = random(2,6);
  float r2 = random(7,13);
  float r3 = random(10,15);
  float c = random(182, 250);
  float c2 = random(182, 250);
  float c3 = random(182, 250);
  float t = random(50,70);
  ellipse(180, 130, e, e2);
  ellipse(180, 130, e3, e4);
  fill(247,100,7,20);
  ellipse(30, 230, e3, e4);
  fill(247,100,7,50);
  ellipse(45, 247, e3, e4);
  ellipse(330, 530, 30+ e3, 30+ e4);
  fill(247,100,7,80);
  ellipse(390, 700, e5, e6);
  fill(87,100,247,40);
  ellipse(-30, 680, e5, e7);
  fill(87,100,247,40);
  ellipse(160, 480, e5-350, e7-350);
  ellipse(118,545, e5-370, e6-360);
  stroke(247,100,7,80);
  strokeWeight(r);
  fill(247,100,7,0);
  ellipse(180,130,e8+25,e9+25);
  
  font = loadFont("FreestyleScript-Regular-48.vlw");
  textSize(t);
  fill(250,211,182,93);
  textFont(font, t);
  text("T I M E",180, 295);
  
  
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float s2 = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute(), 0, 60, 0, TWO_PI) - HALF_PI;
  float h = map(hour() % 12, 0, 12, 0, TWO_PI) - HALF_PI;
  stroke(255);
  strokeWeight(r);
  
  line(180, 130, cos(s) * 76 + 180, sin(s) * 76 + 130);
  stroke(255);
  
  strokeWeight(r2);
  line(180, 130, cos(m) * 63 + 180, sin(m) * 63 + 130);
  
  stroke(c3,c3,c3);
  strokeWeight(r3);
  line(180, 130, cos(h) + 50 + 180, sin(h) * 50 + 130);
  
  strokeWeight(r2-5);
  line(180, 25, 180, 30);
  line(80, 130, 85, 130);
  line(272, 130, 277, 130);
  line(180, 225, 180, 230);
  
  
 
 
}
  

