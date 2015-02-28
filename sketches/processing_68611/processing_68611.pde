
float[] flowerxpos = new float [13];
float[] flowerypos = new float [13];

//people sneezing - class example
PImage[] images= new PImage [3];
int imageCounter;

void setup() {
  size(300,300);
  smooth();
  noCursor();
  //background(255);
  
  drawflower();
  
  bounceball();
  xPos=50;
  yPos=50;
  xVelocity=1;
  yVelocity=-2;
  bee=width*.5;
  
  //people sneezing
  images[0] = loadImage("sneeze0.jpg");
  images[1] = loadImage("sneeze1.jpg");
  images[2] = loadImage("sneeze2.jpg");
  
  
  //other flowers
  for (int i=0; i<22;i++){
    stroke(75);
    strokeWeight(2);
    ellipse(random(0,width), random(0, height), 40,40);
    
  //how do you make another ellipse inside the random ellipses and how do you see flowers(background problems)!?
 //nested forloops?
 
 //array flowers
 for (int k=0; k<13;k++){
flowerxpos[k] = random(width);
 }
for (int g=0; g<13;g++){
  flowerypos[g] = random(height);
}
  }
  
  
}

int xPos;
int yPos;
int xVelocity;
int yVelocity;
float bee;

void draw() {
  //people sneezing
image(images[imageCounter],0,0);
//  background(255);
  fill(75);
  ellipse (50,50,40,40);
  drawflower();
  
  
 // for(int i=0; i<5; i++){
 // bounceball();
 // }
  if(mouseX>30&&mouseX<70&&mouseY>30&&mouseY<70){
    bounceball();
    bounceball();
    bounceball();
    }
    
bee=(cos(millis()*.01)*10+mouseX); 
noStroke();
fill(234,242,17);
ellipse(bee, mouseY, 20,20);

for(int k=0; k<13; k++){
  ellipse(flowerxpos[k], flowerypos[k], 20,20);
}
for(int g=0; g<13; g++){
  strokeWeight(5);
  ellipse(flowerxpos[g], flowerypos[g], 20,20);
}



}

//people sneezing
void mouseClicked() {
  imageCounter++;
  if (imageCounter > 2) {
    imageCounter = 0;
  }
}
void drawflower(){
// background(255);
//  fill(75);
ellipse(50,50,40,40);
fill(234,242,17);
ellipse(50,50,25,25);
//line(70,50,30,50);
//line(50,70,50,30);
}

void bounceball(){
//ellipse(xpos, ypos, 25,25);
// background(255);
 xPos=xPos+xVelocity;
 yPos=yPos+yVelocity;
 noStroke();
 fill(234,242,17);
 ellipse(xPos, yPos, 10, 10);


if(xPos<13==true||xPos>287==true){
///xVelocity+1=true;  
 xVelocity=xVelocity*(-1);//=true;
}

if(yPos<13==true||yPos>287==true){
  yVelocity=yVelocity*(-1);//=true;
//xPos=5&&yPos=7=true;
}
}

