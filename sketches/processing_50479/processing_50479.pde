
//Homework 4 for Jim Roberts' CFA 757
//Zoe Lu copyright Spring 2012, Pittsburgh PA 15213

//keyboard input:
//  1. press up arrow key to enlarge 
//  size of the center circle
//  2. press 's' to save the frame
//  (this is commented out on openProcessing)

//mouse input:
//  1. squares with random size 
//  are drawn around current mouse position
//  2. white lines are drawn 
//  around previous mouse position
//  3. press(click) the mouse to change the
//  background color and refresh the canvas


float diam;
float xPos, yPos;
int count=0;
int frameNum=0;
int maximum=80;
float r,g,b;

void setup(){
  size(400,400);
//  background(0);
  smooth();
}

void mousePressed(){
  maximum=80;
  background(random(100),random(100),random(80),200);
}//end mousePressed

void keyPressed(){
  if(keyCode==UP){
    maximum+=20;
  }
  /*
  if(keyCode=='S'){
    frameNum++;
    save("sketch-"+frameNum+".jpg");    
  }
  */

}//end keyPressed

void draw(){
  r=random(255);
  g=random(255);
  b=random(255);
  count+=5;
  xPos=random(40);
  yPos=random(40);
  diam=random(20);
  
  if(count>maximum){
    count=5;
  }

  noStroke();  
  fill(r+34,g+28,b-30);
  ellipse(width/2,height/2,count*2,count*2);
  stroke(227,227,227,190);
  strokeWeight(0.3);
  line(10,10,pmouseX,pmouseY);
  line(10,height-10,pmouseX,pmouseY);
  line(width-10,10,pmouseX,pmouseY);
  line(width-10,height-10,pmouseX,pmouseY);
  noStroke();
  fill(r,g,b);  
  rect(mouseX-xPos,mouseY+yPos,diam,diam);

}
                                
