
PFont myFont1;
PFont myFont2;
float x;
float y;


void setup(){
  size(800,500);
  smooth();
  noStroke();
  
}

void draw(){
  background(255); 
  
  if(abs(mouseX-x)>0.1) {
    x = x + (mouseX - x)*0.05;
  }
  
  if(abs(mouseY - y) > 0.1){
    y = y + (mouseY - y)*0.05;
  }
  
  if(mousePressed){
    stop();
  }
  
  
  fill(random(0,256),random(0,256),random(0,256),random(0,256));
  myFont1 = loadFont("Adler-24.vlw");
  textFont(myFont1);
  text("What's up Helvetica", x, y);
  
  fill(150);
  myFont2 = loadFont("Helvetica-35.vlw");
  textFont(myFont2);
  text("get away from me", mouseX, mouseY);
  text("click to stop", mouseX, mouseY+26);
  
  
}

