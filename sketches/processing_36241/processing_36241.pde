
int maxDots = 5000;
float [] xPos = new float [maxDots];
float [] yPos = new float [maxDots];
float t;


float [] dotDiameter = new float[maxDots];

float ySpeed =0.1;
float xSpeed = 0.1;
float gravity = -0.1;

 float type = 50;

void setup(){
  size(700,400);
  background(230,219,176);
  noStroke();
smooth();


 for (int i = 0; i < maxDots; i++){
    xPos[i] = random(0, width);
yPos[i] = random (0,height);
 }

}

void draw(){


 background(230,219,176);
      if(type>75){
    type = 75;
}
else if (type<10){
 type = 10; 
} 
   
    ellipse(pmouseX,pmouseY,type,type);
stroke(255,100);

        if (xSpeed>50){
        type = type*0.98;
        }
        else{
          type ++;
        }
   


   

line(mouseX,mouseY,pmouseX,pmouseY);
line(mouseX,mouseY,pmouseX-type/2,pmouseY);
line(mouseX,mouseY,pmouseX+type/2,pmouseY);
line(mouseX,mouseY,pmouseX,pmouseY-type/2);
line(mouseX,mouseY,pmouseX,pmouseY+type/2);
noStroke();



    


  for (int j = 0; j < maxDots; j++){
 


t = random (-1,1); 

float d = dist(mouseX, mouseY, xPos[j], yPos[j]);



 yPos[j] = yPos[j] + ySpeed * t /d;
ySpeed = ySpeed + gravity;
    
     xPos[j] = xPos[j] +xSpeed * t /d;

 
 
if((t)< -0.5){
  fill(142,158,99,150);
}
else if ((t)> -0.5 && (t)< 0){
fill(245,238,215,150);
}
else if ((t)> 0 && (t)< 0.5){
 fill(196,188,160,150); 
}
else {
 fill(23,101,115,150); 
}

dotDiameter[j] = (dist(mouseX, mouseY, xPos[j], yPos[j]))/25;


ellipse(xPos[j],yPos[j], dotDiameter[j], dotDiameter[j]);

if (yPos[j] < 0-100){
  ySpeed = ySpeed * -0.95;
  yPos[j] = random (0,height); 
  }   
if(xPos[j]>width+100 || xPos[j] < 0-100){
xSpeed = xSpeed * -1;
 xPos[j] = random(0, width);
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


}

}





void mousePressed() {
  noLoop();
  
  }

void mouseReleased() {
 for (int j = 0; j < maxDots; j++){
fill(0);
ellipse(xPos[j],yPos[j], dotDiameter[j], dotDiameter[j]);
   loop();
   
 }
}


