
//Varibles--------------
int nR=6; ///number of images
float []circleX=new float [nR]; // First circle float varible 
float []circleY=new float [nR]; // Second circle float varible 
float []yVel=new float [nR]; // Velocity for balls so they can move across the y axis 
boolean buttonClicked=false; // button rule 
color ballColor; // color of ball 
//ellipse = the image I load --- what name should I do this as? // name of eliipse image tag
//image varible ----
PImage[] rI = new PImage[nR];
//postions for images
//rX[]=new Float[];
//rY[]=new float[];
//rV[]= new float[]; ----velocity for image


// The Setup-------------
void setup() {
  size(500, 500);
  smooth();
  frameRate(30);
  ballColor= color (255, 0, 0); 
  noStroke();
  for (int i = 0;i<nR;i++) {
    circleX[i] = 50*(i+1);
    circleY[i] = 0;
    yVel[i]=random (0, 20);
    //   for(int i=0 i<nR; i++){
    rI[0] = loadImage("0.png");   
    rI[1] = loadImage("1.png");
    rI[2] = loadImage("2.png");
    rI[3] = loadImage("3.png");
    rI[4] = loadImage("4.png");
    rI[5] = loadImage("5.png");



    //      (all the points in the for loop for the images)
  }
}

//The Drawing-------------
void draw() {
  background(0);
  ballColor= color(255, 0, 0);
  for (int i=0; i<nR;i++) { 
    image(rI[i], circleX[i], circleY[i]);
  }
  if (buttonClicked==false) {
    rect(100, 100, 50, 20);
  }
  else {
    background(255);
  }
  update(); // function name
  //  update2();
}

// Update Function-----------

void update() {
  for (int i=0;i<nR;i++) {
    circleY[i]=circleY[i]+yVel[i];
    ballColor=color(0, 0, 150);
  }
}
//void update2() {
//  for (int i=0;i<nR;i++) {
//    rX[i]=rY[i]+rV[i];
//  }
//}
// Mouse Function-------------
void mouseReleased() {
  println("Mouse Released ----------- mouseX = " + mouseX + "mouseY=" + mouseY);
  if (mouseX>100 && mouseX<150 && mouseY>100 && mouseY<120) {
    buttonClicked=true;
  }
}

// do I need a mouse function name? Why does adding the button then override the balls? How do I create a image array? 
// Input Images into the place of the ecllipse? Input into the draw loop and write a name for each image and a position? 


