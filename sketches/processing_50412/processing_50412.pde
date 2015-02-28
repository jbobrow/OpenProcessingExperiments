
/*****************************************
 * Assignment    1
 * Name:         Jiayi Wang
 * E-mail:       jwang04@brynmawr.edu
 * Course:       CS 110 - Section 02
 * Submitted:    2012-1-26
 * 
 * A short paragraph describing your sketch.
 I have drawn a teddy bear holding a piece of paper which has the Chinese
 character for "good luck" on it. I got this idea because it's the lunar new
 year this weekend. When you click on it, it would smile.
 I had difficulting drawing semi-circles.But then I found that the arcEditor
 very useful.
 I also spend somethime thinking how I can make the bear smile by clicking.
 * See description below.
 ***********************************************/
 PImage img;

void setup(){
  size(500,500);
  img = loadImage("redbackground.jpg");
  image(img,0,0);
  
  smooth();
 
  //head
  ellipseMode(CORNER);
  
  //ears
  fill(146,108,58);
  ellipse(115,50,75,75);
  ellipse(310,50,75,75);

  //face
  fill(146,108,58);
  ellipse(145,80,210,135);
  noFill();
  
  //eyes
  fill(50);
  ellipse(175,110,30,60);
  ellipse(295,110,30,60);
  noFill();
  
  //mouth
  fill(228,224,192);
  ellipse(190,155,120,60);
  noFill();
  
  //nose
  fill(253,202,168);
  triangle(235,170,265,170,250,185);
  noFill();
  
  //body
  fill(146,108,58);
  ellipse(175,215,150,165);
  
  //legs
  ellipse(190,380,45,105);
  ellipse(265,380,45,105);
  
  //feet problem semi-circle
  /*beginShape();
  curveVertex(140,485);
  curveVertex(145,465);
  curveVertex(162.5,455);
  curveVertex(180,465);
  curveVertex(185,485);
  endShape(CLOSE);*/
  
  arc(190,455,44,68,3.131,6.264);//left foot
  arc(270,455,44,68,3.131,6.264);//right foot
  line(190,487,234,487);
  line(270,487,309,487);
  
  //sign
  
  fill(255,0,0);
  beginShape();
  vertex(250,215);
  vertex(130,335);
  vertex(250,455);
  vertex(370,335);
  endShape(CLOSE);//quad would be simpler
  
  fill(255,255,0);
  quad(250,220,135,335,250,450,365,335);
  fill(255,0,0);
  quad(250,223,138,335,250,447,362,335);
  
  noStroke();
  fill(255,255,0);
  rect(205,290,45,45);
  rect(212.5,342.5,30,30);
  rect(205,380,45,15);
  triangle(280,380,280,395,295,395);
  rect(265,365,45,15);
  triangle(265,320,265,335,280,350);
  triangle(265,365,280,365,280,350);
  rect(280,290,15,60);
  triangle(280,350,280,365,325,320);
  
  fill(255,0,0);
  rect(212.5,595/2,25/2,25/2);
  rect(325/2+50,630/2,25/2,25/2);
  rect(360/2+50,595/2,25/2,25/2);
  rect(360/2+50,630/2,25/2,25/2);
  rect(340/2+50,700/2,30/2,30/2);
  stroke(0);
  
  
  //hands
  
  fill(146,108,58);
  
  ellipse(160/2+50,550/2,90/2,90/2);//left
  line(220/2+50,580/2,250/2+50,610/2);//upper
  line(190/2+50,610/2,220/2+50,640/2);//lower
  line(201/2+50,595/2,236/2+50,626/2);//middle
  
  ellipse(550/2+50,550/2,90/2,90/2);
  line(580/2+50,580/2,550/2+50,610/2);
  line(610/2+50,610/2,580/2+50,640/2);
  line(595/2+50,595/2,566/2+50,626/2);
  
}

//click to smile
int value = 0;
int value1 = 0;
int value2 = 0;

void draw() {
  stroke(value+228,value1+224,value2+192);
  line(400/2+50,370/2,400/2+50,400/2);
  ellipseMode(CENTER);
  noFill();
  //arc(400/2+50,310/2,180/2,180/2,0.523,2.617); can also draw the same curve
  curve(192,-26,210,177,289,174,295,-11);

}

void mouseClicked() {
  if(value == 0) {
      value=-228;
      value1=-224;
      value2=-192;
  } else {
    value = 0;
    value1=0;
    value2=0;
  }
}

