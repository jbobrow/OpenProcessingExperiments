
PFont myFont;

void setup() {

  size(200, 200); 
  frameRate(8);
  background(0);
  myFont = createFont("noteworthy", 100);
  textFont(myFont);
  
}

void draw(){
    
    fill(random(250), random(250), random(250), random(250));
    text("oh", random(0,90), 150);
}
