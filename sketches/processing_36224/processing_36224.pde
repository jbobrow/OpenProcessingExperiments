
int maxDots = 4000;
float [] xPos = new float [maxDots];
float [] yPos = new float [maxDots];
String [] colour = new String [maxDots];
int dotDiameter = 1;
int dotEnlarge = 50;

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
 
 float chooseColour = random (4);
      if (chooseColour <= 0.5){
       colour[i] = ("light blue");      
    }
     // else if (chooseColour >1 && chooseColour <=2){
      //colour[i] = ("green");
     // }
      else if (chooseColour > 0.5 && chooseColour <=4){
       colour[i] = ("blue");
      }
 
 }
 




}

void draw(){
for (int j = 0; j < maxDots; j++){
 fill(0);
ellipse(xPos[j],yPos[j], dotDiameter, dotDiameter);

 yPos[j] = yPos[j] + ySpeed;
 ySpeed = ySpeed + gravity;
    
     xPos[j] = xPos[j] + xSpeed;

 
 
 if (colour[j].equals("light blue")){
   fill(0,255,255);
 }
 //else if (colour[j].equals("green")){
   //fill(0,255,0);
// }
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
xSpeed = -10;
}
else if (mouseX<pmouseX){
xSpeed = 10;
}

if (mouseY>pmouseY){
ySpeed = -10;
}
else if (mouseY<pmouseY){
ySpeed = 10;
}

}
}

void mousePressed() {
  noLoop();
  
//  for (int k = 0; k < maxDots; k++){
//    if (xPos[k] == mouseX && yPos[k] == mouseY){
//      fill(0);
//      ellipse(xPos[k], yPos[k], dotDiameter, dotDiameter);
//      if (colour[k].equals("red")){
//         fill(255,0,0,127); //red
//      }
//      else if (colour[k].equals("green")){
//        fill(0,255,0,127); //green
//      }
//      else if (colour[k].equals("blue")){
//         fill(0,0,255,127); //blue
//      } 
//      ellipse(xPos[k], yPos[k], dotEnlarge, dotEnlarge);
//      if (colour[k].equals("red")){
//   fill(255,0,0);
// }
// else if (colour[k].equals("green")){
//   fill(0,255,0);
// }
// if (colour[k].equals("blue")){
//   fill(0,0,255);
// }
//      ellipse(xPos[k], yPos[k], dotDiameter, dotDiameter);
//    }
//  }
}

void mouseReleased() {
 
   loop();
}

