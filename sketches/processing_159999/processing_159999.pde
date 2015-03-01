
PImage background;
int posx;
int posy;
int xd = 20;
int yd = 20;
int w = 10;
int h = 10;
int posx2;
int posy2;
int xd2 = 30;
int yd2 = 30;

void setup(){
    size(1072, 746);

  frameRate(60);
}

void draw(){
  //background(50);
    background = loadImage("Football_Pitch_by_Haqn.jpg");
    background(background);
  ball (posx, posy, w, h);
  posx = posx + xd;
  posy = posy + yd;
  if (posx > width){
    xd = -xd;
  }
  if(posy>height){
      yd = -yd;
    }
  if(posx < 0){
    xd = -xd;
  }
  if(posy < 0){
    yd = -yd;
  }
  ball (posx2, posy2, w, h);
  posx2 = posx2 + xd2;
  posy2 = posy2 + yd2;
  if (posx2 > width){
    xd2 = -xd2;
  }
  if (posx2 < 0){
    xd2 = -xd2;
  }
  if (posy2 > height){
    yd2 = -yd2;
  }
  if (posy2 < 0){
    yd2 = -yd2;
  }
}
    
void keyPressed(){
  loop();
}
void keyReleased(){
  noLoop();
}
void ball (int x, int y, int w, int h){
fill(255, 255, 255);
ellipse(x, y, w, h);
}


