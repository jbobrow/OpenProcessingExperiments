
int page = 0;

int numEllipse = 200;

int[] posX = new int[numEllipse];
int[] posY = new int[numEllipse];

int ellipseSize = 40;

PFont myFont;




void setup() {
  size(600, 600);

  for (int i=0;i<numEllipse;i++) {
    posX[i] = int(random(width));
    posY[i] = int(random(height));
  }
  myFont= loadFont("font.vlw");
}


void draw() {



  if (page==0) {
    background(0);
    textFont(myFont, 18);
    
    text("Instructions: Click and drag any yellow ball to change its position and color, press + and - to change size!!",155,height/2-100, 300,300);
    text("PRESS ANY KEY TO CONTINUE!!!",150,height/2 + 50, 400,300);
    if (keyPressed) {
      page=1;
    }
  }

  if (page == 1) { 
    background(0); 
    for (int i=0;i<numEllipse;i++) { 
      fill(238, 2255, 5);
      ellipse(posX[i], posY[i], ellipseSize, ellipseSize);
    }



    for (int i = 0; i < numEllipse; i++) {

      if (mouseX > posX[i] - ellipseSize/2 && mouseX < posX[i] + ellipseSize/2) {
        if (mouseY > posY[i] - ellipseSize/2 && mouseY < posY[i] + ellipseSize/2) {
          if (mousePressed) {
            posX[i] = mouseX;
            posY[i] = mouseY;
            fill(221, 5, 255);
            ellipse(posX[i], posY[i], ellipseSize, ellipseSize);
          }
        }
      }
    }
  }
}
void mouseClicked() {
if(page==1){
  for (int i=0;i<numEllipse;i++) {   
    if (dist(mouseX, mouseY, posX[i], posY[i]) < ellipseSize/2) {
      fill(221, 5, 255);
      ellipse(posX[i], posY[i], ellipseSize, ellipseSize);
    }
  }
}
}

void keyPressed(){
  if (key == '+'){
    ellipseSize=ellipseSize+1;
  }else if (key == '-'){
    ellipseSize=ellipseSize-1;
  }

}
