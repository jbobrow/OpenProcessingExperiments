
void setup(){
  size(600,500);
}

void draw(){
  background(255);
  smooth(); 
  rectMode(CORNERS); 
  ellipseMode(CORNERS); 
  
  //draw arms
  strokeWeight(10); 
  stroke(0,178,233); 
  line(150,240,30,330);
  line(30,330,90,390);
  line(420,240,540,330);
  line(540,330,480,390);
  
  //draw eye holder stems
  strokeWeight(10);
  stroke(0,178,233);
  line(210,120,270,210);
  line(360,120,300,210);
  
  //draw frills
  strokeWeight(3);
  stroke(255,233,95);
  fill(255,233,95);
  ellipse(90,210,240,240); 
  ellipse(90,270,240,300);
  ellipse(330,210,480,240);
  ellipse(330,270,480,300);
  
  //draw eyes
  strokeWeight(10);
  stroke(0,178,233);
  fill(255,255,255);
  ellipse(180,60,270,150); 
  ellipse(300,60,390,150);
  
  //draw eyebrows
  strokeWeight(1);
  stroke(0,0,0); 
  fill(0,0,0);
  rect(180,30,270,60);
  rect(300,30,390,60);
  
  //draw body
  strokeWeight(1);
  stroke(0,178,233);
  fill(0,178,233);
  ellipse(150,180,420,360);
  
  //draw pupils
  strokeWeight(7);
  stroke(0,103,56);
  fill(127,195,87);
  rect(210,90,240,120);
  rect(330,90,360,120);
  
  //draw tummy
  strokeWeight(1);
  stroke(255,233,95);
  fill (255,233,95);
  ellipse(210,240,360,360); 
  
  //draw mouth
  strokeWeight(5);
  stroke(0,0,0);
  line(270,210,300,210);
  
  //draw punching bags
  strokeWeight(1);
  stroke(200,35,34);
  fill(200,35,34);
  rect(90,360,150,420);
  rect(420,360,480,420);
  ellipse(120,300,270,450);
  ellipse(300,300,450,450); 
  
/*
stroke(128);
int i;
for(i=0;i<1000;i+=30) {
  line(i,0,i,1000);
  line(0,i,1000,i);
}
*/

}
