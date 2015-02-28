
import processing.pdf.*;float x=100;
float y=0;


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;


void setup(){
  size(500,1000);
   
  background(0);
  noStroke();
  smooth();
  
  //the white box simply shows you the space your pattern gets drawn in
  fill(2,161,165);
  noStroke();
  rect(0,0,patternSeperationX,patternSeperationY);
  stroke(0);
  
  for(int i = 0; i < width/patternSeperationX; i++){
      for(int j = 0; j < height/patternSeperationY; j++){
        pushMatrix();
        translate(i*patternSeperationX, j*patternSeperationY);
        yourFunction();
        popMatrix();
      }
  }
  
}

void draw()
{
strokeWeight(4);
   
   //circle one left
   fill(0);
   ellipse(0,350,350,350);
    fill(255);
   ellipse(0,350,300,300);
ellipse(0,350,200,200);
 fill(0);
 ellipse(0,350,100,100);
 fill(255);
 ellipse(0,350,50,50);
  fill(0);
  ellipse(250,350,100,100);
  ellipse(360,350,75,75);
  ellipse(445,350,50,50);
  ellipse(500,350,25,25);
 
  fill(255);
  ellipse(350,100,150,150);
  fill(0);
  ellipse(350,100,140,140);
 
 
  fill(0);
  ellipse(500,1000,300,300);
  fill(255);
  ellipse(500,1000,270,270);
  
  fill(255);
ellipse(250,650,200,200);
  
  fill(0);
ellipse(200,700,210,210);
 fill(255);
 ellipse(200,700,200,200); 

  
  











}


void yourFunction(){
  float x=200;
float y=0;
  
  while(x>50){
  strokeWeight(10);
  stroke(2,161,165,5);
 
  fill(random(0,255),10);
  rect(random(0,100),random(0,100),random(y,x),random(y,x));
  
  
  
 y = y+.1;
 x = x-.1;

  



  }
  }

