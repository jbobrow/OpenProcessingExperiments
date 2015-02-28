
PFont myFirstFont;
PFont mySecondFont;
int fontPosY = 150;


void setup() {
  size(400, 400);
  noFill();
  smooth();
  fill(0);
  background(0);
  noStroke();
  
  myFirstFont = loadFont("Helvetica-14.vlw");
  mySecondFont = loadFont ("NokiaCellphoneFC-Small-40.vlw");
}

void draw(){
  rect(100,100,200,200);
  
  fill(255);
  textFont(myFirstFont);
  text("Instructions:", 20, 20);
  text("with your mouse try to guess where is the green rect", 20, 35);
  
  if (mouseX>100 && mouseX <300 && mouseY > 100 && mouseY < 200){
    fill(255,0,0);
    rect(100,100,200,100);
    
    fill(255);
    textFont(mySecondFont);
    text("loose", 150, fontPosY);
    
    fill(0);
  }
  
  if (mouseX>100 && mouseX <300 && mouseY > 200 && mouseY < 300){
    fill(0,255,0);
    rect(100,200,200,100);
    
    fill(0);
    textFont(mySecondFont);
    text("win", 175, fontPosY+100);
    
    fill(0);
  }
  

 

}



