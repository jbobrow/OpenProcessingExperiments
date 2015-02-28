
//*** Übung 1.5 K.I.T.T Evolution

PImage foto;

int xPos = 160;
int yPos = 187;
int speed = 4;
int state = 0;

void setup(){
  size(500, 500);
  background(0);
  foto = loadImage("robocop2.png");
}

void draw(){
  
  fill(0, 0, 0, 20);
  rect(0, 0, 500, 500);
  
    if (state == 0) {
    xPos = xPos + speed;
    if (xPos >= width-152) {  
      xPos = width-152 ;
      state = 1;
    }
  }
  
  
  if (state == 1) {
    xPos = xPos - speed;  
    if (xPos <= 160) {  
      xPos = 160;
      state = 0;
    }
  }
  
 //background(255,255,255,10);
  noStroke();
  fill(255,0,0);
  ellipse(xPos, yPos, 20, 15);
  image(foto, 0, 0, 500,500);//
}

 void mouseReleased(){
 saveFrame("KITT_Evolution.png");
 }

