
//Nicolette Hashey
//1/16/2014
//Inital Smiley Face
//Assignment 1
void setup(){
//Draw static smiley face parts
  int value=0;
 size(500,500);
 background(0);
 noStroke();
    fill(#FFcccc);
  ellipse(250,200,185,150);
  ellipse(250,250,175,175);
  ellipse(160,225,25,50);
  ellipse(340,225,25,50);
    fill(255);
  ellipse(210,210,30,30);
  ellipse(290,210,30,30);
    fill(#6699FF);
  ellipse(210,210,25,25);
  ellipse(290,210,25,25);
    fill(0);
  ellipse(210,210,15,15);
  ellipse(290,210,15,15);
    fill(255);
  ellipse(215,205,5,5);
  ellipse(295,205,5,5);
}

void draw(){
//Draw Nose
  line(250,225,235,260);
  line(235,260,250,260);
  //smile
  if(keyPressed){
      if(key=='g' || key=='G'){
  fill(0);
  stroke(0);
  arc(250,275,100,75,0,PI);
}
  }
  //neutral
  if(keyPressed){
    if(key=='b' || key=='B'){
    stroke(5);
    fill(0);
    line(200,275,300,275);
    }
  }
}



