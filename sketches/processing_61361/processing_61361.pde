
PFont fontA;

int R=0;
int G=0;
int B=0;
int mode=0;
int mode2 = 0;
int brush=50;

void setup() {
  smooth();
  size(screen.width, screen.height);
  fontA = loadFont("CourierNewPSMT-28.vlw");
  textFont(fontA, 24);
} 

void draw() {
  noStroke();
  fill(0);
  rect(0,0,screen.width/4, 20);
  rect((screen.width/4)*3,0,screen.width-20, 7);    
  fill(0,190,25);
  rect(screen.width/4,0,screen.width/4, 20);
  rect((screen.width/4)*3,7,screen.width-20, 7);      
  fill(0,125, 190);
  rect(screen.width/2,0,screen.width/4, 20);
  rect((screen.width/4)*3,14,screen.width-20, 6);    
  fill(190);
  rect(screen.width-80, 0, screen.width, 20);
  fill(0);
  text("reset", screen.width-75, 16);


  if(mousePressed == true && mouseX < screen.width/4 && mouseY < 20){
    mode = 0;
  }
  else if(mousePressed == true && mouseX > screen.width/4 && mouseX < screen.width/2 && mouseY < 20){
    mode = 1;
  }
  else if(mousePressed == true && mouseX > screen.width/2 && mouseX < (screen.width/4)*3 && mouseY < 20){
    mode = 2;
  }
  else if(mousePressed == true && mouseX > (screen.width/4)*3 && mouseX < screen.width-80 && mouseY < 20){
    mode = 3;
  } 
  if(mode == 0){
    R=0;
    G=0;
    B=0;
  }
  else if(mode == 1){
    R=0;
    G=190;
    B=25;
  }
  else if(mode == 2){
    R=0;
    G=125;
    B=190;
  }
  else if(mode == 3){
    mode2 = int(random(3));
    if(mode2 == 0){
      R=0;
      G=0;
      B=0;
    }
    else if(mode2 == 1){
      R=0;
      G=190;
      B=25;
    }
    else if(mode2 == 2){
      R=0;
      G=125;
      B=190;
    }  
  }

  if(mousePressed == true && mouseX>screen.width-80 && mouseY < 20){
    background(192);
  }

  if(mousePressed == true && mouseY > 20){
    stroke(R,G,B);
    line(mouseX-brush, mouseY-brush, mouseX+brush, mouseY+brush);

  }


}




