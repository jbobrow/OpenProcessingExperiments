
void setup(){
  size(770,680);
}

void draw(){
  background(255);
  smooth(); 
  rectMode(CORNERS); 
  ellipseMode(CORNERS); 
  
  //draw arms
  strokeWeight(10); 
  stroke(0,178,233); 
  line((pmouseX+150)-275,(pmouseY+240)-290,(pmouseX+30)-275,(pmouseY+330)-290);
  line((pmouseX+30)-275,(pmouseY+330)-290,(pmouseX+90)-275,(pmouseY+390)-290);
  line((pmouseX+420)-275,(pmouseY+240)-290,(pmouseX+540)-275,(pmouseY+330)-290);
  line((pmouseX+540)-275,(pmouseY+330)-290,(pmouseX+480)-275,(pmouseY+390)-290);
  
  //draw eye holder stems
  strokeWeight(10);
  stroke(0,178,233);
  line((mouseX+210)-275,(mouseY+120)-290,(mouseX+270)-275,(mouseY+210)-290);
  line((mouseX+360)-275,(mouseY+120)-290,(mouseX+300)-275,(mouseY+210)-290);
  
  //draw frills
  strokeWeight(3);
  stroke(255,233,95);
  fill(255,233,95);
  ellipse((mouseX+90)-275,(mouseY+210)-290,(mouseX+240)-275,(mouseY+240)-290); 
  ellipse((mouseX+90)-275,(mouseY+270)-290,(mouseX+240)-275,(mouseY+300)-290);
  ellipse((mouseX+330)-275,(mouseY+210)-290,(mouseX+480)-275,(mouseY+240)-290);
  ellipse((mouseX+330)-275,(mouseY+270)-290,(mouseX+480)-275,(mouseY+300)-290);
  
  //draw eyes
  strokeWeight(10);
  stroke(0,178,233);
  fill(255,255,255);
  ellipse((mouseX+180)-275,(mouseY+60)-290,(mouseX+270)-275,(mouseY+150)-290); 
  ellipse((mouseX+300)-275,(mouseY+60)-290,(mouseX+390)-275,(mouseY+150)-290);
  
  //draw eyebrows
  strokeWeight(1);
  stroke(0,0,0); 
  fill(0,0,0);
  rect((mouseX+180)-275,(mouseY+30)-290,(mouseX+270)-275,(mouseY+60)-290);
  rect((mouseX+300)-275,(mouseY+30)-290,(mouseX+390)-275,(mouseY+60)-290);
  
  //draw body
  strokeWeight(1);
  stroke(0,178,233);
  fill(0,178,233);
  ellipse((mouseX+150)-275,(mouseY+180)-290,(mouseX+420)-275,(mouseY+360)-290);
  
  //draw pupils
  strokeWeight(7);
  stroke(mouseX,0,mouseY);
  fill(mouseX+50,0,mouseY+50);
  /*stroke(0,103,56);
  fill(127,195,87);
  */
  rect((mouseX+210)-275,(mouseY+90)-290,(mouseX+240)-275,(mouseY+120)-290);
  rect((mouseX+330)-275,(mouseY+90)-290,(mouseX+360)-275,(mouseY+120)-290);
  
  //draw tummy
  strokeWeight(1);
  stroke(255,233,95);
  fill (255,233,95);
  ellipse((mouseX+210)-275,(mouseY+240)-290,(mouseX+360)-275,(mouseY+360)-290); 
  
  //draw mouth
  strokeWeight(5);
  stroke(0,0,0);
  line((pmouseX+270)-275,(pmouseY+210)-290,(pmouseX+300)-275,(pmouseY+210)-290);
  
  //draw punching bags
  strokeWeight(1);
  stroke(200,35,34);
  fill(200,35,34);
  rect((pmouseX+90)-275,(pmouseY+360)-290,(pmouseX+150)-275,(pmouseY+420)-290);
  rect((pmouseX+420)-275,(pmouseY+360)-290,(pmouseX+480)-275,(pmouseY+420)-290);
  ellipse((pmouseX+120)-275,(pmouseY+300)-290,(pmouseX+270)-275,(pmouseY+450)-290);
  ellipse((pmouseX+300)-275,(pmouseY+300)-290,(pmouseX+450)-275,(pmouseY+450)-290); 
  
/*
stroke(128);
int i;
for(i=0;i<1000;i+=30) {
  line(i,0,i,1000);
  line(0,i,1000,i);
}
*/

}

void mousePressed(){
  println("go for the gold!");
}
