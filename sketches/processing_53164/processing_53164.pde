
/*
Assignment 3
Name: Hoang Ha
Email: hha@brynmawr.edu
Course: CS110 - 02
2/14/2012
Since it is due on Valentine, I create an image of a girl riding the bicycle.
she is leaving a trail of heart for a boy to pick up.

*/

float x, y, w;

void setup() {
  background(255);
  size(600, 500);
  smooth();
  int i = 0;
  noStroke();
  
   for (i=0; i<300; i+=1) {
    fill(random(255), 0, 0, 20);
    x = random(width);
    y = random(height);
    w = random(5, 100);
    ellipse(x, y, w, w);
  }
   
  
}




void draw() {
  //draw heart
  drawHeart(230, 315);
  drawHeart(260, 310);
  drawHeart(285, 350);
  drawHeart(310, 370);
  drawHeart(340, 390);

  
  


  //draw bicycle
  //draw wheels for bicycle
  drawWheel(60, 440);
  drawWheel(220, 440);
  //bikeChain(circle)
  ellipse(140, 420, 20, 20);
  //bikeChain
  line(140, 410, 220, 435);
  line(140, 430, 220, 445);
  //line to handle bar
  line(60, 400, 72, 362); 
  //handle bar
  triangle(72, 362, 60, 353, 57, 370);
  //line from chain to handle bar
  line(130, 415, 60, 353);
  //line to seat
  line(140, 410, 140, 400); 
  //seat
  line(140, 400, 220, 400);
  //basket
  rect(210, 350, 50, 50);

  //now draw the girl
  //girl body
  strokeWeight(.5);
  triangle(150, 310, 130, 400, 180, 400);
  //girl hand
  line(150, 310, 72, 362);
  line(150, 310, 78, 365);
  //girlhead
  ellipse(150, 290, 50, 50);
  //girl smile
  arc(130,295,10,18,.275,1.683);
  //girl eye
  arc(135, 290,20, 15, 4.2, 5.3);
  
  

  //drawboy
  //boyhead
  ellipse(450, 370, 50, 50);
  //boybody
  line(475, 370, 560, 370);
  //boyleftleg
  line(560, 370, 520, 420);
  line(520, 420, 530, 470);
  line(530, 470, 520, 470);
  //boyrightleg
  line(560, 370, 540, 430);
  line(540, 430, 550, 475);
  line(550, 475, 540, 475);
  //boylefthand
  line(475, 370, 490, 390);
  line(490, 390, 470, 420);
  //boyrighthand
  line(475, 370, 500, 390);
  line(500, 390, 480, 420);
  //boy eye
  //boy mouth
  arc(438, 380, 24,24, .06, 1.5);
  fill(0);
  ellipse(440, 368, 5, 5);
  //heart on boy hand
  drawHeart(475, 420);
}


void drawHeart(int hx, int hy) {
  smooth();
  noStroke();
  fill(238, 32, 73);
  beginShape();
  vertex(hx, hy); 
  bezierVertex(hx, hy-14, hx+20, hy-5, hx, hy+13); 
  vertex(hx, hy); 
  bezierVertex(hx, hy-14, hx-20, hy-5, hx, hy+13); 
  endShape();
}


void drawWheel (int x, int y ) {
  fill(255);
  stroke(0);
  //big circle
  ellipse( x, y, 80, 80);
  //lines for wheels
  //do loops to make make and space 6 lines evenly
  float angle = 2*PI/6; 
  for (int i=0; i<6; i++) {
    line( x, y, x-sin(angle*i)*(40), y-cos(angle*i)*(40));
  }
  //small circle
  ellipse( x, y, 10, 10);
}


