
int y = 380;
int l = 10;
int counter = 5;

PFont font;
String txt = "reset";

void setup() {
  size(400, 400, P2D);
  smooth(8);
  noStroke();
  fill(255);
  rect(0, 20, width, height -50);
  
  font = loadFont("AmericanTypewriter-Light-14.vlw");
  textFont(font, 14);
}

void draw() {

  noStroke();
  fill(250, 188, 18);
  rect(160, y, l, l);
  fill(185, 60, 75);
  rect(180, y, l, l);
  fill(106, 188, 102);
  rect(200, y, l, l);
  fill(90, 182, 192);
  rect(220, y, l, l);
  fill(0);
  rect(240, y, l, l);

  fill(100);
  rect(320, y-2, 50, 14);
  fill(250);
  textAlign(CENTER);
  text(txt, 347, y + 9); 

  changeColor();
  
  if (mousePressed && mouseY>25 && mouseY<365) {
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
  
}

 void changeColor() {
    
    if(counter == 1) {
      stroke(250, 188, 18);
    }
    else if (counter==2) {
      stroke(152, 58, 75);
    }
    else if (counter==3) {
      stroke(247, 148, 132);
    }
    else if (counter==4){
      stroke(90, 112, 142);
    }
    else if(counter==5){
      stroke(0);
    }
    else if(mouseY>370){
      noStroke();
    }


    
  }
  
  void mouseClicked() {
  if (mouseX>160 && mouseX<170 && mouseY>380 && mouseY<390) {
    counter=1;
  }
  else if (mouseX>180 && mouseX<190 &&mouseY>380 && mouseY<390) {
    counter=2;
  }
  else if (mouseX>200 && mouseX<210 && mouseY>380 && mouseY<390) {
    counter=3;
  }
  else if (mouseX>220 && mouseX<230 && mouseY>380 && mouseY<390) {
    counter=4;
  }
  else if (mouseX>240 && mouseX<250 && mouseY>380 && mouseY<390) {
    counter=5;
  }
  else if (mouseX>320 && mouseX<370 && mouseY>378 && mouseY<392) {
    noStroke();
    fill(255);
    rect(0, 20, width, height-50);
  }
  
}




