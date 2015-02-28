
int maxDots = 2000;
float [] xPos = new float [maxDots];
float [] yPos = new float [maxDots];
String [] colour = new String [maxDots];
int dotDiameter = 2;

float ySpeed =0;
float xSpeed = 3;
float gravity = -1;

void setup(){
  size(700,400);
  background (0);
  noStroke();
//frameRate(1);  
ellipseMode(CORNER);
//create();

 for (int i = 0; i < maxDots; i++){
    xPos[i] = random(0, width);
yPos[i] = random (0,height); 
 
 float chooseColour = random (3);
      if (chooseColour <= 1){
       colour[i] = ("red");      
    }
      else if (chooseColour >1 && chooseColour <=2){
      colour[i] = ("green");
      }
      else if (chooseColour > 2 && chooseColour <=3){
       colour[i] = ("blue");
      }
 
 }
 




}

void draw(){
fill(255,10);


  for (int j = 0; j < maxDots; j++){
fill(0);
ellipse(xPos[j],yPos[j], dotDiameter, dotDiameter);

 yPos[j] = yPos[j] + ySpeed;
 ySpeed = ySpeed + gravity;
    
     xPos[j] = xPos[j] + xSpeed;

 
 
 if (colour[j].equals("red")){
   fill(255,0,0);
 }
 else if (colour[j].equals("green")){
   fill(0,255,0);
 }
 if (colour[j].equals("blue")){
   fill(0,0,255);
 }
ellipse(xPos[j],yPos[j], dotDiameter, dotDiameter);

if (yPos[j] < 0){
  ySpeed = ySpeed * -0.95;
  }   
if(xPos[j]>width || xPos[j] < 0){
xSpeed = xSpeed * -1;
}

if (mouseX>pmouseX){
xSpeed = 5;
frameRate(frameRate*4);
}
if (mouseX<pmouseX){
xSpeed = -5;
frameRate(frameRate/4);
}

if (mouseY>pmouseY){
ySpeed = 5;

}
if (mouseY<pmouseY){
ySpeed = -5;

}
}
}

void mousePressed() {
  noLoop();
  
  }

void mouseReleased() {
 for (int j = 0; j < maxDots; j++){
fill(0);
ellipse(xPos[j],yPos[j], dotDiameter, dotDiameter);
   loop();
}
}
void mouseDragged(){
 filter(INVERT); 
}

