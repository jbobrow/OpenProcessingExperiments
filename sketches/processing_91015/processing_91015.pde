
/*Nafis Sabir
 Professor Calli Higgins
 HW 4.2.1*/
int arcWidth = 200; //flower width
int arcHeight = 200;//flower height
int ellipseWidth = 140;//pad width
int ellipseHeight = 10;//pad height
float sunX = random(100);//random sun float
float sunY = 100;//sun y float
float arcStart = 0;//flower start
float arcStopone = PI+QUARTER_PI;//flower open
float arcStoptwo = TWO_PI;//flower closed
boolean button = false;





void setup() {
  size(800, 800);//window size
  background(0, 150, 255);//background color

  strokeWeight(9);//weight for stems
  stroke(10, 200, 0);//stem color
  line(200, 303, 200, 700);//stem 1
  line(560, 503, 560, 700);//stem 2
  line(380, 403, 380, 700);//stem 3
  noStroke();//removed stroke from flowers
  fill(0, 0, 255);//blue color for left flower
  arc(200, 200, arcWidth, arcHeight, arcStart, arcStopone);//left flower
  fill(146, 0, 206);//purple color for middle flower
  arc(380, 300, arcWidth, arcHeight, arcStart, arcStopone);//middle flower
  fill(255, 100, 255);//pink color for left flower
  arc(560, 400, arcWidth, arcHeight, arcStart, arcStopone);//right flower
}
void draw() {
  smooth();//pixel smoothing
 
}




void keyPressed() { //color change to night on key press
  background(25, 25, 112);//background night color
  strokeWeight(9);//weight for pads
  stroke(0, 255, 0);//pad color
  ellipse(200, 300, ellipseWidth, ellipseHeight);//left pad
  ellipse(380, 400, ellipseWidth, ellipseHeight);//middle pad
  ellipse(560, 500, ellipseWidth, ellipseHeight);//right pad
  noStroke();//no stroke on flowers
  fill(255, 225, 0);//yellow color for left flower
  arc(200, 200, arcWidth, arcHeight, arcStart, arcStoptwo);//left flower
  fill(255, 69, 0);//orange color for middle flower
  arc(380, 300, arcWidth, arcHeight, arcStart, arcStoptwo);//middle flower
  fill(255, 0, 0);//red color for right flower
  arc(560, 400, arcWidth, arcHeight, arcStart, arcStoptwo);//right flower
} 
void mousePressed() { 
  button = !button;
  if (button) {
    //change colors to day on mouse press
  background(0, 150, 255);//background day color
  strokeWeight(9);//weight for stems
  stroke(10, 200, 0);//stem color
  line(200, 303, 200, 700);//stem 1
  line(560, 503, 560, 700);//stem 2
  line(380, 403, 380, 700);//stem 3
  noStroke();//removed stroke from flowers
  fill(0, 0, 255);//blue color for left flower
  arc(200, 200, arcWidth, arcHeight, arcStart, arcStopone);//left flower
  fill(146, 0, 206);//purple color for middle flower
  arc(380, 300, arcWidth, arcHeight, arcStart, arcStopone);//middle flower
  fill(255, 100, 255);//pink color for left flower
  arc(560, 400, arcWidth, arcHeight, arcStart, arcStopone);//right flower
  
   fill(250, 224, 25);//color of sun
  noStroke();//no stroke for sun
  ellipse(sunX + 200, sunY, 100, 100);//location of sun
 } else if(!button){
  background(0, 150, 255);//background day color
  strokeWeight(9);//weight for stems
  stroke(10, 200, 0);//stem color
  line(200, 303, 200, 700);//stem 1
  line(560, 503, 560, 700);//stem 2
  line(380, 403, 380, 700);//stem 3
  noStroke();//removed stroke from flowers
  fill(0, 0, 255);//blue color for left flower
  arc(200, 200, arcWidth, arcHeight, arcStart, arcStopone);//left flower
  fill(146, 0, 206);//purple color for middle flower
  arc(380, 300, arcWidth, arcHeight, arcStart, arcStopone);//middle flower
  fill(255, 100, 255);//pink color for left flower
  arc(560, 400, arcWidth, arcHeight, arcStart, arcStopone);//right flower

}
}
  void mouseMoved() {
    fill(mouseX, 0, mouseY);//color change for flowers on mouse move
    arc(200, 200, arcWidth, arcHeight, arcStart, arcStopone);//left flower
    arc(380, 300, arcWidth, arcHeight, arcStart, arcStopone);//middle flower
    arc(560, 400, arcWidth, arcHeight, arcStart, arcStopone);//right flower
  }

  


//Done by Nafis Sabir



