
//float backgroundR = 16;
//float backgroundG = 2;
//float backgroundB = 183;
float change = 0.3;
float mouth = 50;
float eye1 = 20;
float eye2 = 15;
float speed = 0.09;

void setup(){
  size(500,400); //set up size of window
  frameRate(50);
  smooth();//smooth
  background(16,2,183);
} 

void draw(){
    //draw hair
  fill(0);
  beginShape(); //left side
  curveVertex(250,90);
  curveVertex(250,90);
  curveVertex(200,85);
  curveVertex(165,175);
  curveVertex(150,250);
  curveVertex(250,300);
  curveVertex(250,300);
  endShape();
  beginShape(); //right side
  curveVertex(250,90);
  curveVertex(250,90);
  curveVertex(300,85);
  curveVertex(335,175);
  curveVertex(350,250);
  curveVertex(250,300);
  curveVertex(250,300);
  endShape();
  //draw head
  fill(162,116,72);
  ellipse(250,200,150,200);
  //draw bangs
  fill(0);
  beginShape(); //bangs
  curveVertex(200,100);
  curveVertex(200,100);
  curveVertex(225,130);
  curveVertex(325,140);
  curveVertex(325,140);
  endShape();
  ellipse(265,115,100,40);
  ellipse(300,133,10,10);
   //draw eyes
  fill(237,65,70);
  strokeWeight(3);
  ellipse(210,175,40,eye1);
  ellipse(290,175,40,eye1);
  fill(0);
  ellipse(215,175,15,eye2);
  ellipse(295,175,15,eye2);
  //draw nose
  stroke(0);
  strokeWeight(2);
  line(250,175,255,210);
  noFill();
  stroke(0);
  strokeWeight(2);
  arc(250,210,10,20,0,PI/2);
  stroke(170); //nose ring
  strokeWeight(3);
  arc(240,221,10,10,0,TWO_PI-PI/2);
  stroke(0); //completes the nose
  strokeWeight(2);
  line(250,221,240,221);
  //draw eyebrows
  stroke(0);
  strokeWeight(2);
  arc(215,160,50,20,PI,TWO_PI-PI/2);
  arc(285,160,50,20,TWO_PI-PI/2,TWO_PI);
  //animate stars when mouse is pressed
  if (mousePressed){
  beginShape();
  fill(255,247,0);
  stroke(255,247,0);
  strokeWeight(2);
  smooth();
  vertex(mouseX,mouseY);
  vertex(mouseX-5,mouseY+15);
  vertex(mouseX-20,mouseY+15);
  vertex(mouseX-7,mouseY+20);
  vertex(mouseX-10,mouseY+35);
  vertex(mouseX,mouseY+25);
  vertex(mouseX+10,mouseY+35);
  vertex(mouseX+7,mouseY+20);
  vertex(mouseX+20,mouseY+15);
  vertex(mouseX+5,mouseY+15);
  endShape(CLOSE);
}
  //animate mouth closing
  stroke(0);
  strokeWeight(2);
  fill(231,114,150);
  arc(250,265,60,mouth,PI,TWO_PI);
  line(220,265,280,265);
  mouth = mouth-change;
  if (mouth<0){
    change = change * -5;
  }
  if (mouth>50){
    change = 0;
  }
  //animate eyes closing
  eye1 = eye1-speed;
  if (eye1<0){
    speed = speed*-5;
  }
  if (eye1>20){
    speed = 0;
  }
  eye2 = eye2-speed;
  if (eye2<=0){
    speed = speed*-5;
  }   
  if (eye2>=15){
    speed = 0;
  }
   // background(backgroundR,backgroundG,backgroundB);
   //backgroundR = backgroundR-change;
   //backgroundG = backgroundG-change;
   //backgroundB = backgroundB-change;
   //animate stars when mouse is pressed
}

