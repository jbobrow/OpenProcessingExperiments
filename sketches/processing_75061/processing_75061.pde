

// variable for a specific font
PFont font;
float angle = 0;

void setup(){

  background(0);
  size(400, 400, P2D);
  
  font = loadFont("AvantGardeBold-40.vlw");
  textFont(font);
  
}

void draw(){
  
  translate(width/2, height/2);
  
  rotate(radians(angle));
  
  textSize(35);
  fill(255, 10);
  text("ROTATING", 0, 0);
  
  angle = angle + 1;
  
  if(mousePressed) {
    background(0);
    textSize(35);
  fill(255);
  text("ROTATING", 0, 0);
  }
    
}

