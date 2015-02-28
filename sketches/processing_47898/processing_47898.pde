
Button buttonStart;
int mode = 0;
float gameTime, startTime;
PImage blast;
void setup(){
  size (500,500);
  textSize(18);
  buttonStart = new Button(250,300,50,color(255,0,0),color(0,255,0),color(0,0,255));
  blast = loadImage("rocket.png");
}

void draw(){
  background(255);
  manageButtons();
  fill(50);
  //println(gameTime);
  
  if(gameTime >= 8.0){
      text("BLAST OFF",275,200);
      image(blast,6,64);
  }else{
      text("time left:0:0" + int (8-gameTime), 200,200);
  }
    
  if(mode == 1){
    gameTime = (millis()-startTime)/1000;
    
    
  }
}

void manageButtons(){
  buttonStart.update();
  buttonStart.display();
}
 
void mousePressed(){
  if (buttonStart.press() == true) {mode = 1;}
    startTime = millis();
}
 
void mouseReleased(){
  buttonStart.release(); 
}

