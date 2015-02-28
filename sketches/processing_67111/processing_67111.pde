
int numBall = 400; 
int Csize = 50; // squire color

float[] ballX = new float[numBall]; // position
float[] ballY = new float[numBall];
float[] dy = new float[numBall]; // y direction

float[] ballR = new float[numBall];

float gravity =0.1;

void setup() {
  size(500, 500);
  smooth();
  noStroke();
  ellipseMode(RADIUS);
  
  colorMode(HSB,width,height,90);
  
  for (int i=0; i<numBall; i++) {
    ballX[i]=mouseX;
    ballY[i]=mouseY;

    ballR[i] = random (4, 30);  

    // dy[i] = random (10);
  }
}

void draw() {
  //background(0);
 
  colorSquire();

  for (int i=0; i< numBall-1; i++) {
    ballX[i]=ballX[i+1];
    ballY[i]=ballY[i+1];
    // dy[i] += gravity;
  }

  ballX[numBall-1] = mouseX;
  ballY[numBall-1] = mouseY;

  for (int i = 0; i < numBall; i++) {
    fill(225, 242, 242);
    
   if  (mousePressed) {
     changeColor();
     ellipse(ballX[i], ballY[i], ballR[i], ballR[i]);
      
    }
  }
}
void colorSquire(){
  fill(6,99,29, 20);
  rect(0, 0, width, height);
  
  // Top Left
  fill(336, 99, 96);
  rect(0, 0,Csize, Csize);

  // Top Right
  fill(0, 99, 99);
  rect(width-Csize, 0, Csize, Csize);

  //Btn Left
  fill(137, 99, 99);
  rect(0, height-Csize, Csize, Csize);

  // Btn Right
  fill(250, 99, 99);
  rect(width-Csize, height-Csize , Csize , Csize );
  
   fill(359,0,99);
  rect(width/2-Csize /2,height/2-Csize/2, Csize , Csize );
}

void changeColor(){
      //Top Left
      if (mouseX > 0 && mouseX < Csize  && mouseY > 0 && mouseY < Csize ) {
        fill(336, 99, 96);
      }
      //Top Right
      else if (mouseX > width-Csize  && mouseX < width && mouseY > 0 && mouseY < Csize ) {
        fill(0, 99, 99);
      }
      //Btn Left
      else if (mouseX > 0 && mouseX <Csize  && mouseY > height-Csize  && mouseY < height) {
        fill(131, 99, 99);
      }
      //Btn Right
      else if (mouseX > width-Csize && mouseX < width 
             && mouseY > width-Csize && mouseY < width) {
        fill(250, 99, 99);
      } 
       else if (mouseX > width/2-25 && mouseX < width/2+25 && mouseY < height/2+25 && mouseY > height/2-25) {
        fill(359,0,99);
       }
}
//void mouseReleased () {
//  for (int i=0; i<numBall; i++) {
//    // for (int j = 0; j < drop; j++) {
//    ballX[i] = mouseX;
//    ballY[i] = mouseY;
//    dy[i] = dy[i] + gravity;
//    fill(255, 0, 0);
//  }
//}


