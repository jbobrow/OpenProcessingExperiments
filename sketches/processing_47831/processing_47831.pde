
PImage tictac;
PFont dan;

void setup(){
  size(250,250);
  tictac=loadImage("tictac.png");
  background(tictac);
  dan= loadFont("Narkisim-48.vlw");
}

void draw(){
}

 
 
void mousePressed(){
  stroke(255);

  if (mouseButton ==LEFT){
     textSize(50);
 text("X",pmouseX,pmouseY);

  }
  
  if (mouseButton == RIGHT){
     textSize(50);
  text("O",pmouseX,pmouseY);
  }
}
  void keyPressed(){
  
   if(keyPressed && key=='r'){
 image(tictac,0,0);
   }
  }



