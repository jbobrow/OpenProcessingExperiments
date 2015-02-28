
int maxDots = 1000;
float [] xPos = new float [maxDots];
float [] yPos = new float [maxDots];
String [] colour = new String [maxDots];
float t;



int dotDiameter = 2;

float ySpeed =0.1;
float xSpeed = .1;
float gravity = -0.1;

void setup(){
  size(700,400);
  background (0);
  noStroke();
//frameRate(1);  
ellipseMode(CORNER);
//smooth();
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

t = random (-1,1); 
//float dx1 = (mouseX - xPos[j]);
//float dy1 = (mouseY - yPos[j]);
//
//float dx2 = sq(dx1);
//float dy2 = sq(dy1);
//float trueD = dx2+dy2;
//trueD = sqrt(trueD);

float d = dist(mouseX, mouseY, xPos[j], yPos[j]);

 yPos[j] = yPos[j] + ySpeed * t /d;
ySpeed = ySpeed + gravity;
    
     xPos[j] = xPos[j] +xSpeed * t /d;
//xSpeed = xSpeed + gravity;
 


fill(0,d*255,d*255);



// if (colour[j].equals("red")){
//   fill(255,0,0);
// }
// else if (colour[j].equals("green")){
//   fill(0,255,0);
// }
// if (colour[j].equals("blue")){
//   fill(0,0,255);
// }
ellipse(xPos[j],yPos[j], dotDiameter, dotDiameter);

if (yPos[j] < 0){
  ySpeed = ySpeed * -0.95;
  }   
if(xPos[j]>width || xPos[j] < 0){
xSpeed = xSpeed * -1;
}

if (mouseX>pmouseX){
xSpeed += .4;
}
if (mouseX<pmouseX){
xSpeed -= .4;
}

if (mouseY>pmouseY){
ySpeed += .4;
}
if (mouseY<pmouseY){
ySpeed -= .4;
}
//if (((pmouseX - mouseX) >500) || ((mouseX - pmouseX) > 500)){
//frameRate(frameRate/4);
//}
//if (((pmouseX - mouseX)< 100 )||((mouseX - pmouseX)<100)){
//frameRate(frameRate*2);
//}
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
//void mouseDragged(){
// filter(INVERT); 
//}

