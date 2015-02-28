
Assignment #2
Name: Siyang You
E-mail: syou@brynmawr.edu
Course: CS 110-Section #1
Submitted: 09/19/2012
This program depicts a windmill on a winter night, covering variables, if statements and loop iteration as required. 
The wings of the windmill is applied by the method of for-loop. 
The windows, snowflakes, and pebbles are of different shapes, colors and weights when clicked or pressed.

void setup(){
  size(600,600);
  background(0,130,255);
  smooth();
  
  //draw windmill
  quad(300,600,450,600,425,400,325,400);
  arc(375,400,100,108,3.142,6.283);  
  
  //draw wings
  strokeWeight(10);
  strokeCap(SQUARE);
  line(250,400,500,400);
  line(375,275,375,525);}
  
void draw(){  
  strokeWeight(2);
  for (int i=240; i<=475; i+=20) {
    line(i,385, i+i/10, 415);
  }
  for (int j=295; j<=535; j+=20) {
    line(360,j,390,j-j/10);
  }}
//draw windows when clicked on the winmill's body
void mouseClicked(){
  if(mouseX>=325 && mouseX<=425 && mouseY>=450 && mouseY<=600){
  rectMode(CORNER);
  rect(mouseX,mouseY,20,20);
  line(mouseX+10,mouseY,mouseX+10,mouseY+20);
  line(mouseX,mouseY+10,mouseX+20,mouseY+10);  }}
//draw pebbles on the ground when pressing key 'P'
void keyPressed(){
  switch(key){
    case'p':
    case'P':
      ellipseMode(CENTER);
      ellipse(random(0,300),random(500,600),random(10,20),random(10,20));
      ellipse(random(450,600),random(500,600),random(10,20),random(10,20));  
      break;}}
//draw snowflakes differ in colors when mouse clicked
 void mouseReleased() {
    strokeWeight(mouseY/100);
    strokeCap(ROUND);
    stroke(0,0,random(0,200));
    if(mouseX<=600 && mouseY<400){
    line(mouseX,mouseY,mouseX+20,mouseY+20);
    line(mouseX,mouseY+10,mouseX+20,mouseY+10);
    line(mouseX,mouseY+20,mouseX+20,mouseY);
    line(mouseX+10,mouseY+2,mouseX+10,mouseY+18); }}   
  


  }
}
