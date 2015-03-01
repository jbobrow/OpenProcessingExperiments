
//Sebastian Moya-Martinez

/* The 1 key fills the circles with black, 2 eliminates the fill
while maintaing the stroke. Clicking and dragging will render a
black ellipse in the center which rerenders behind the black and 
white stripes. This ellipse's size is dependant on mouseX and
mouseY positions.*/

color fillColor = color(#000000);
boolean pause = false;
int k = 100;
int ballX = -400;
int ballY = -200;
int lineY = 5;

void setup() {
  background(#FFFFFF);
  size(1280,800);
  smooth();
}

void draw() {
  background(#ffffff); //Comment this out for a hole-punch effect
  fill(fillColor);
  for (int i = 0; i<20; i++){
    ellipse(ballX-200-200*i, ballY-200*i, 100, 100); //Left
    ellipse(ballX+300-200*i, ballY+100-200*i, 100, 100); //First ball
    ellipse(ballX+600-200*i, ballY-200*i, 100, 100);
    ellipse(ballX+1100-200*i, ballY+100-200*i, 100, 100); //Top
  }
   
  strokeWeight(5);
  fill(#000000);
  for (int j = 0; j<800; j++){
    line(0,lineY+10*j,1280,lineY+10*j);
    fill(#ffffff);
    line(0, lineY+20*j,1280,lineY+20*j);
    
  }

  ballX++;
  ballY++;
  k++;
  if(mousePressed){  //Black ellipse
    pushMatrix();
    strokeWeight(5);
    noFill();
    stroke(#000000);
    ellipse(width/2, height/2, mouseX, mouseY);
    popMatrix();
   }
}

void keyReleased(){
  switch(key){
  case '1':
   fillColor = color(#000000);
   break; 
   case '2':
   fillColor = color(#FFFFFF);
  }
}


