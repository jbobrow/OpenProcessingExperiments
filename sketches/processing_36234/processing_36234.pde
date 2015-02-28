
int maxDots = 5000;
float [] xPos = new float [maxDots];
float [] yPos = new float [maxDots];
String [] colour = new String [maxDots];
float t;



float [] dotDiameter = new float[maxDots];

float ySpeed =0.1;
float xSpeed = .1;
float gravity = -0.1;

void setup(){
  size(700,400);
  //background (255,255,5);
  background(0);
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

background(0);

  for (int j = 0; j < maxDots; j++){
 // constrain(xPos[j], 0, width);
 // constrain(xPos[j], 0, height);

    
    //fill(255,255,5);
//    fill(0);
//if (dotDiameter[j]!= dotDiameter[0]){
//ellipse(xPos[j],yPos[j], dotDiameter[j-1], dotDiameter[j-1]);
//}

t = random (-1,1); 
float dx1 = (mouseX - xPos[j]);
float dy1 = (mouseY - yPos[j]);

//float dx2 = sq(dx1);
//float dy2 = sq(dy1);
//float trueD = dx2+dy2;
//trueD = sqrt(trueD);

float d = dist(mouseX, mouseY, xPos[j], yPos[j]);



 yPos[j] = yPos[j] + ySpeed * t /d;
ySpeed = ySpeed + gravity;
    
     xPos[j] = xPos[j] +xSpeed * t /d;
xSpeed = xSpeed + gravity;
 
if((xSpeed+ySpeed)< -500){
  fill(238,74,131,50);
}
else if ((xSpeed+ySpeed)> -500 && (xSpeed+ySpeed)< 0){
fill(248,155,35,50);
}
else if ((xSpeed+ySpeed)> 0 && (xSpeed+ySpeed)< -500){
 fill(24,224,72,50); 
}
else {
 fill(98,239,229,50); 
}

dotDiameter[j] = (dist(mouseX, mouseY, xPos[j], yPos[j]))/10;
// if (colour[j].equals("red")){
//   fill(random(255),0,0,50);
// }
// else if (colour[j].equals("green")){
//   fill(0,random(255),0,50);
// }
// if (colour[j].equals("blue")){
//   fill(0,0,random(255),50);
// }
rect(xPos[j],yPos[j], dotDiameter[j], dotDiameter[j]);

if (yPos[j] < 0){
  ySpeed = ySpeed * -0.95;
  }   
if(xPos[j]>width || xPos[j] < 0){
xSpeed = xSpeed * -1;
}

//if (mouseX>pmouseX){
//xSpeed += .1;
//}
//if (mouseX<pmouseX){
//xSpeed -= .1;
//}
//
//if (mouseY>pmouseY){
//ySpeed -= .1;
//}
//if (mouseY<pmouseY){
//ySpeed += .1;
//}
if (mouseX-pmouseX<100||mouseX-pmouseX<100||mouseY-pmouseY<100||mouseY-pmouseY<100){
t *= .4;

}
if (mouseX-pmouseX<500||mouseX-pmouseX<500||mouseY-pmouseY<500||mouseY-pmouseY<500){
t /= .4;

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
// for (int j = 0; j < maxDots; j++){
//fill(0);
//ellipse(xPos[j],yPos[j], dotDiameter[j], dotDiameter[j]);
   loop();
   
//}
}
//void mouseDragged(){
// filter(INVERT); 
//}

