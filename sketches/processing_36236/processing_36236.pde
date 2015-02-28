
int maxDots = 5000;
float [] xPos = new float [maxDots];
float [] yPos = new float [maxDots];
String [] colour = new String [maxDots];
float t;

float [] circle = new float[5];

float [] dotDiameter = new float[maxDots];

float ySpeed =0.1;
float xSpeed = 0.1;
float gravity = -0.1;

 float type = 50;

void setup(){
  size(700,400);
  //background (255,255,5);
  background(0);
  noStroke();
//frameRate(1);  
//ellipseMode(CORNER);
smooth();
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


fill(255,10);
      if(type>75){
    type = 75;
}
else if (type<10){
 type = 10; 
} 
   
    ellipse(pmouseX,pmouseY,type,type);
stroke(0);

        if (xSpeed>50){
        type = type*0.98;
        }
        else{
          type ++;
        }
   


   

line(mouseX,mouseY,pmouseX,pmouseY);
noStroke();



    


  for (int j = 0; j < maxDots; j++){
 


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
//xSpeed = xSpeed + gravity;
 
 
 
if((t)< -500){
  fill(238,74,131,50);
}
else if ((t)> -500 && (t)< 0){
fill(248,155,35,50);
}
else if ((t)> 0 && (t)< -500){
 fill(24,224,72,50); 
}
else {
 fill(98,239,229,50); 
}

dotDiameter[j] = (dist(mouseX, mouseY, xPos[j], yPos[j]))/50;

// if (colour[j].equals("red")){
//   fill(random(255),0,0,50);
// }
// else if (colour[j].equals("green")){
//   fill(0,random(255),0,50);
// }
// if (colour[j].equals("blue")){
//   fill(0,0,random(255),50);
// }
//rect(xPos[j],yPos[j], dotDiameter[j], dotDiameter[j]);
ellipse(xPos[j],yPos[j], dotDiameter[j], dotDiameter[j]);
//if (pmouseX ==mouseX){
// if(xPos[j] != xPos[maxDots-1]){
//  strokeWeight(0.001);
//  stroke(255); 
//line(xPos[j],yPos[j],xPos[j+1],yPos[j+1]);
//noStroke();
// }
//}

//if (yPos[j] < 0){
//  ySpeed = ySpeed * -0.95;
//  }   
//if(xPos[j]>width || xPos[j] < 0){
//xSpeed = xSpeed * -1;
//}

while(mouseY>600){
// for (int i = 0; i<maxDots; i++){
//  yPos[i]--; 
//  background(0);
//  ellipse(xPos[i],yPos[i], dotDiameter[i], dotDiameter[i]);
// }
ySpeed = ySpeed*-0.95; 
}
if (mouseX>pmouseX){
xSpeed += .4;
}
if (mouseX<pmouseX){
xSpeed -= .4;
}

if (mouseY>pmouseY){
ySpeed -= .4;
}
if (mouseY<pmouseY){
ySpeed += .4;
}
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
for (int k = 0; k<maxDots; k++){
if (xPos[k] > -50 || xPos [k] < width+50 ||yPos[k] > -50 || xPos [k] < height+50){
   xPos[k] = random(0, width);
yPos[k] = random (0,height); 
}
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

