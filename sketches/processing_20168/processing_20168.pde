
  float centerX = 0;
  float centerY = 0;
  int dir = 1;
  float theta=0;
  float delta=100;
  float grayscale=150;

void setup () {
  size(500,500);
  smooth();
}

void draw(){
  background(0,0,50);
  
  translate(mouseX,mouseY);
  
  fill(255,50,50);
  ellipse(centerX, centerY, delta, delta);
    
  noStroke();
  fill(grayscale);
  rotate(theta);
  beginShape();
  vertex(centerX-10,centerY-40);
  bezierVertex(centerX-10,centerY-70, centerX+10,centerY-70, centerX+10,centerY-40);//north curve
  bezierVertex(centerX+10,centerY-20, centerX+20,centerY-10, centerX+40,centerY-10);//northwest curve
  bezierVertex(centerX+70,centerY-10, centerX+70,centerY+10, centerX+40,centerY+10);//west curve
  bezierVertex(centerX+20,centerY+10, centerX+10,centerY+20, centerX+10,centerY+40);//southwest curve
  bezierVertex(centerX+10,centerY+70, centerX-10,centerY+70, centerX-10,centerY+40);//south curve
  bezierVertex(centerX-10,centerY+20, centerX-20,centerY+10, centerX-40,centerY+10);//southeast curve
  bezierVertex(centerX-70,centerY+10, centerX-70,centerY-10, centerX-40,centerY-10);//east curve
  bezierVertex(centerX-20,centerY-10, centerX-10,centerY-20, centerX-10,centerY-40);//northeast curve
  endShape();

}

void keyPressed()
{
  if(keyCode==LEFT) theta -= 0.1;
  if(keyCode==RIGHT) theta += 0.1;
  if(keyCode==UP) delta += 2;
  if(keyCode==DOWN) delta -= 2;
  if(keyCode==',') grayscale -= 10;
  if(keyCode=='.') grayscale += 10;
   
}


/*
translate(mouseX,mouseY);
float theta = PI*mouseX / width;
rotate(theta);
rectMode(CENTER);
rect(0,0, 100,100);
*/

//movement
/*
centerX = centerX+4;
  if(centerX>width){
  dir=dir*-1;
  }
*/

//resting state: circle expands and contracts

//mouse clicked: rotate?




