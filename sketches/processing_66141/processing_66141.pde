
int posX, posY;
int posXinc, posYinc;
int movState;

void setup () {
size (500, 500);

smooth ();

posX = width / 2;
posY = height / 2;

posXinc = 0;
posYinc = 2;

movState = 0;

}

void draw () {
  
  background (posX/2, posY/2, 0);

  ellipse (posX, posY, 70, 70);
  
  posX = posX + posXinc;
  posY = posY + posYinc;

if (movState == 0) {
  
  posYinc = 2;
  posXinc = 0;
  
}

if (movState == 1) {
  
  posYinc = 0;
  posXinc = 2;
  
}

if (movState == 2) {
  
  posYinc = -2;
  posXinc = 0;
  
}

if (movState == 3) {
  
  posYinc = 0;
  posXinc = -2;
  
}

if (posY >= height - 35) {

 movState = 2;

}

if (posY <= 35) {

 movState = 0;

}

if (posX >= width - 35) {
 
movState = 3;
  
}

if (posX <= 35) {

 movState = 1;

}

println (posYinc);

}

  void mouseClicked() {
   movState += 1;
   
   if (movState > 3) {
     
     movState = 0;   
  }
  
}


