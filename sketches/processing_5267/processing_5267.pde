
boolean vector = false;

color mad = color (244, 42, 90, 255);
float m = 50;
color polar = color(247, 245, 242);
PShape cake;
PShape normalhead;
PShape s;
PShape body;
PShape s2;
PShape happy;
PShape smoke;
PImage i;
PImage r;
PFont feed;

void setup(){
  size(480,320);
  strokeWeight(3);
  strokeCap(ROUND);
  smooth();
  stroke(0);
  cake = loadShape("layeredcake.svg");
  normalhead = loadShape("normalhead.svg");
  s = loadShape("eyesnose.svg");
  body = loadShape("body.svg");
  s2 = loadShape("eyesnose2.svg");
  smoke = loadShape("smoke.svg");
  happy = loadShape("happy.svg");
  i = loadImage("icecream.png");
  r = loadImage("realbear.png");
  feed = loadFont("feed.vlw");
  textFont(feed, 20);
  boolean over = true;
}

void draw(){
  background(255);
  
     if(vector == true){
       image(r, 0, 0);
       shape(happy, 0, 0);
       
     }else{
    
     if(dist(151, 98, mouseX, mouseY)<80) {
        //normal bear
        fill(polar);
        normalhead.disableStyle();
        shape(normalhead, 0, 0);
        shape(s, 0, 0);
        shape(body, 0, 0);
        
     }
     else { 
    if(m<255){
     m = m+1; 
     mad = color (244, 42, 90, m);
    }
    fill(mad);
        normalhead.disableStyle();
        shape(normalhead, 0, 0);
        shape(s2, 0, 0);
        shape(body, 0, 0);
        shape(smoke, 0, 0);
     }
     }
// follow mouse here
      fill(244, 42, 90, 200);
      text("feed!", mouseX, mouseY);
      noFill();
}

void mouseClicked() {
  if(dist(151, 98, mouseX, mouseY)<80 && vector == false) { //change distance
     //normal bear
        shape(happy, 0, 0);
        shape(normalhead, 0, 0);
        shape(s, 0, 0);
        shape(body, 0, 0);
        noLoop(); 
        
  }
  image(i, 200, 100);
}

void keyPressed() {
  if(key == ' '){
    if(vector==true){
    vector = false;
  } else {
    vector = true;
  }
  }
}

