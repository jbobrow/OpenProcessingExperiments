
PFont f;
PImage img1;

  
void setup() {
  size (360,600);
  stroke(255);
  smooth();
}

void draw() {
  
   noStroke();
   float mapColorG =  map(mouseX, 0, 600, 0,250);    

   float mapColorB =  map(mouseX, 0, 600, 0,200);    

   fill(0, mapColorG, mapColorB);    

  rect(0, 0, width, height); // Black line  
 
 
  f = loadFont("Bauhaus93-48.vlw");
  textFont(f);
   int s = second();
  int m = minute();
  int h = hour();
  fill(255);
  String t = nf(h,2) + ":" + nf(m,2) + ":" + nf(s,2);
  text(t,85,420);
//time
 
  fill(97,42,216);
  noStroke();
  ellipse(175,200,200,200);
  float ss = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float mm = map(minute(), 0, 60, 0, TWO_PI) - HALF_PI;
  float hh = map(hour() % 12, 0, 12, 0,TWO_PI) - HALF_PI;
  stroke(255);
   
   
   
   
  strokeWeight(2);
  line(175, 200, cos (mm) * 80 + 175, sin(mm) * 80 + 200);
  strokeWeight(4);
  line(175, 200, cos (hh) * 60 + 175, sin(hh) * 60 + 200);
  strokeWeight(1);
  line(175, 200, cos (ss) * 100 + 175, sin(ss) * 100 + 200);
 
  PImage img = loadImage("image1.png");
  imageMode(CENTER);
  image(img, cos(ss) * 100 + 175, sin(ss) * 100 + 200, 100,100);
 
 
 float sss = map(second(),0,60,0,360);
 float mmm = map(minute(),0,60,0,360);
 float hhh = map(hour(),0,24,0,360);
  PImage a = loadImage("image2.png");
  image(a , sss, 500,100,50);
  noStroke();
  line(sss, 600, sss, 550);
 
    
    if (mousePressed){
    if (mouseButton == LEFT)
    stroke(225,220,0);
    strokeWeight(2);
    fill(250,0,50);
    ellipse(45,45,40,40);
    ellipse(100,100,20,20);
    ellipse(315,45,40,40);
    ellipse(265,100,20,20);
    ellipse(45,350,40,40);
    ellipse(100,300,20,20);
    ellipse(315,350,40,40);
    ellipse(265,300,20,20);
   
 
  
    }

}



