
//Homework 3.1.1

//setup
void setup(){
  size(300,300);
  smooth();
}

int x=5;

void draw(){
  
//background
    if(mouseX < width/2){
    background(0);
  }
  
//first composition  
  if(mouseX < width/2){
    noStroke();
    background(255);
    rectMode(CENTER);
    fill(0);
    ellipse(100,100,mouseY,mouseY);
   
//composition when mouse is pressed      
  if(mousePressed){
    background(0);
  if(mouseX < width/2){
    noStroke();
    rectMode(CENTER);
    fill(255);
    rect(100,100,mouseX,mouseX);
  }
}
 
//lines  
  strokeWeight(1);
  stroke(128);
  line(150,0,150,300);
  line(100,0,100,300);
  line(50,0,50,300);
  
  strokeWeight(4);
  stroke(160,102,116);
  line(200,0,200,300);
  }
}


