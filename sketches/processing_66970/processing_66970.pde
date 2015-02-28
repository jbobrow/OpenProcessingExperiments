
PImage hands;
PFont font;
int r;
int b;
int g;

int [] xPositions = {4, 28, 92, 236, 310};
int [] yPositions = {12, 39, 116, 350, 420};

void setup(){
  size(375, 500);
  hands = loadImage("handheart.png");
  imageMode(CENTER);
  font = loadFont("Zapfino-22.vlw");
  textFont(font, 11);
  smooth();
  
  text("Hold an arrow key & drag mouse to color.", 25, 450);
}


void draw(){
  image(hands, width/2, height/2);
  
  fill(r, g, b);
  
  if(mousePressed == true){
    heartshape();}
    
  fill(41, 18, 6);  
    for (int i = 0; i < 5; i++) {
    text("i miss you", xPositions[i], yPositions[i]);
    }
}

void heartshape(){
  beginShape();
  vertex(mouseY,mouseX);
  bezierVertex( mouseX, mouseY - 30, mouseX - 50, mouseY - 30, mouseX - 50, mouseY);
  bezierVertex( 100,180, 150,185, 150, 210 );
  bezierVertex( 150,185, 200,180, 200, 150 );  
  bezierVertex( 200,120, 150,120, 150, 150 );  
  endShape();
}


void keyPressed() {
  if (keyCode == UP) {
    r = 245;
   g = 252;
  b = 51; 
  }  
   if (keyCode == DOWN) {
    r = 51;
    g = 86;
    b = 252;
  }
  
  if (keyCode == RIGHT) {
    r = 224;
    g = 134;
    b = 36;
  }
  
  if (keyCode == LEFT) {
    r = 224;
    g = 36;
    b = 212;
}
}

