
float centerX = 250;
float centerY = 250;
float speed = 1;
boolean button = false;
float jump =0;
 
void setup() {
  size (500,500);
  smooth();
}
void draw() {
 centerX = mouseX;
 centerY = mouseY-jump;
  background(0);
  noStroke();
  fill(250,250,0);
  float value = brightness(255);
  ellipse(centerX,centerY,110,90);
  ellipse(centerX,centerY-40,80,80);
  triangle(centerX-15,centerY-55,centerX-35,centerY-55,centerX-30,centerY-110);
  triangle(centerX+15,centerY-55,centerX+15,centerY-75,centerX+70,centerY-75);
  ellipse(centerX-25,centerY+35,30,30);
  ellipse(centerX+25,centerY+35,30,30);
 
 
  //body
 
  fill(0);
  ellipse(centerX-15,centerY-55,12,12);
  ellipse(centerX+15,centerY-55,12,12); //eyes
 
  if(mousePressed) {
    fill(255,255,0);
    ellipse(centerX+15,centerY-55,13,13);
    stroke(0);
    strokeWeight(3);
    arc(centerX+15,centerY-55, 9, 3, 0, PI); //making him wink
  }
  noStroke();
  fill(255,0,0);
  ellipse(centerX-20,centerY-40,15,15);
  ellipse(centerX+20,centerY-40,15,15); //cheeks
 
  stroke(0);
  strokeWeight(3);
  noFill();
  arc(centerX,centerY-47, 5, 2, 0, PI); //nose
 
  noFill();
  arc(centerX,centerY-35, 10, 5, 0, PI); //mouth
 
  if(mousePressed) {
    stroke(255,255,0);
    strokeWeight(4);
    arc(centerX,centerY-35, 10, 5, 0, PI);
    stroke(0);
    strokeWeight(3);
    arc(centerX,centerY-37, 13, 8, 0, PI); //making him smile
  }
if(keyPressed){
  button = true; //making him jump...
}
if(button ==true){
  
  jump = jump - speed;
}
  if(jump < -20 || jump > 0){
    speed = speed*-1;
    

  }
  if(jump > 0){
    button = false;
    //if(jump> -20){
      //speed = speed*-1;
    
  }
}



