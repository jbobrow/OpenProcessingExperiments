
PFont font;
int pause = 1;

String[] textpool = {"","","",
  "I","have","said", "that", "I", "dwelt", "apart","from","the","visible","world",",","but","I","have","not","said","that","I","dwelt","alone","","",""};
int[] textX = new int[27];
int centor = 3;

void setup(){
  size(600,450);


  font = loadFont ("Monaco-24.vlw");

}
//drawing rectangle

void drawrectangle(){
  stroke(0);
  strokeWeight(14);
  fill(0,0,0,0);
  rect(200,185,200,80);
}


//texts
void textdisplay(){

  fill(0);

  textX[centor] = textpool[centor].length() * 7;
  text(textpool[centor],300 - textX[centor],240);
  for(int i = 1; i <= 3; i++){
    textX[centor - i] = textX[centor - i + 1] + textpool[centor - i].length() * 14 + 14;
    text(textpool[centor - i],300 - textX[centor - i], 240);
  }
  for(int j = 1; j <= 3; j++){
    if (j == 1){
    textX[centor + j] =  14;
    text(textpool[centor + j],300 + textX[centor] + textX[centor + j], 240);
    }
    if (j >= 2){
    textX[centor + j] =  textX[centor + j - 1] + textpool[centor + j - 1].length()  * 14 + 14; 
   text(textpool[centor + j],300 + textX[centor] + textX[centor + j], 240);
    } 
  }

}

void drawinstruction(){
  fill(200,200,200,200);
  noStroke();
  rect(150,150,300,150);
  fill(0,200);
  triangle(250,180,250,270,175,225);
  triangle(350,180,350,270,425,225);

}



void draw() {
  background(255);
  textFont(font);
  PImage imgleft = loadImage("l.png");
  PImage imgright = loadImage("r.png");
  image (imgleft,0,0);
  image (imgright,300,0);
  textdisplay();

  drawrectangle();
  println(pause);
  if (pause == 1)
  {
    drawinstruction();
  }
}

void mouseReleased(){
 // centor = centor + 1;
 pause = 0;
}

void keyPressed(){
      if(key == CODED){
      if(keyCode == RIGHT){
        if(centor < 23 ){
        centor = centor + 1;
        }
      }
      if(keyCode == LEFT){
        if(centor > 3) {
        centor = centor - 1;
        }
      }
    
      }
}



