

int value = 0;


void setup(){

  size(900,500);
  background(175,0,0);
  
}





void draw(){
fill(0);
noStroke();
rect(200,55,500,300);


fill(255);
ellipse(300,150,50,90);
ellipse(600,150,50,90);

float leftEyePos = map(mouseX,0,width,275,325);

float rightEyePos = map(mouseX,0,width,575,625);




fill(0,185,100);
rect(275, 305, 350, 20);
 
 
fill(255,0,0);
ellipse(rightEyePos, 170,39,30);
ellipse(rightEyePos/2,170,39,30);

fill(0,0,0);

ellipse(leftEyePos, 170,20,20);
ellipse(rightEyePos,170,20,20);




fill(0);

float lidPos = map(mouseY, 0, height,0,250);
rect(0,0,width,lidPos);
}




void mousePressed() {
 
 
  fill(0);
  rect(200,55,500,300);
 
  
}



