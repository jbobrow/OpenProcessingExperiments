
import ddf.minim.*;

Minim myMinim;
AudioPlayer myPlayer;

int butX = 200;
int butY = 200;
int butW = 100;
int butH = 100;
color col = color(random(0), random(255), random(255));
boolean lightOn = false;

void setup() {
  size(400,400);
  fill(0,0,255);
  myMinim = new Minim(this);
  myPlayer = myMinim.loadFile("wasps.wav");
  
}

void draw() {
  if (lightOn) {
    background(255);
    float x = random(mouseX-10,mouseX+10);
    float y = random(mouseY-10,mouseY+10);
     fill(col);
    for (int diam = 25; diam > 0; diam = diam - 5) {
      ellipse(x, y, 50 , diam);
      ellipse(x+70, y, 50, diam);
      ellipse(x+35, y-20, 50, diam);
      ellipse(x+35, y+20, 50, diam);
    
  }
 
  } else {
    background(0);
    fill(255,0,0);
    ellipse(butX,butY,butW,butH);
    fill(255);
    textSize(20);
    textAlign(CENTER);
    text("START", 200, 210);
  }
  
   
}

void mousePressed() {
  if (mouseX > butX && mouseX < butX + butW && mouseY > butY && mouseY < butY + butW) {
    lightOn = !lightOn;
    myPlayer.rewind();
    myPlayer.play();  
 
  }
}

void mouseClicked(){
  myPlayer.rewind();
    myPlayer.play();  
}






