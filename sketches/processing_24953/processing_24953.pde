

float x=100;
float y=0;


//what happens if you change these both to 50? what are they doing to the pattern?
int patternSeperationX = 100;
int patternSeperationY = 100;


void setup(){
  size(500,1000);

  background(0);
  noStroke();
  
  
  //the white box simply shows you the space your pattern gets drawn in
  fill(0);
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
 
  //cirlce one right 
   fill(0);
   ellipse(500,350,350,350);
    fill(255);
   ellipse(500,350,300,300);
ellipse(500,350,200,200);
 fill(0);
 ellipse(500,350,100,100);
 fill(255);
 ellipse(500,350,50,50);
   //
 fill(0); 
 ellipse(100,100,100,100);
  fill(255);
  ellipse(100,100,75,75);
  fill(0);
  ellipse(100,100,50,50);
  fill(255);
  ellipse(100,100,25,25);
 fill(0);
 ellipse(200,100,50,50);
 fill(0);
 ellipse(275,100,25,25);
 ellipse(325,100,10,10);
 
 fill(255);
 ellipse(0,600,200,200);
 ellipse(0,600,220,220);
 
 ellipse(300,750,100,100);
 fill(0);
 ellipse(300,750,50,50);
 

 










}


void yourFunction(){
  float x=100;
float y=0;
  
  while(x>50){
  strokeWeight(10);
  stroke(2,128,131,5);
 
  fill(random(0,255),10);
  rect(random(0,100),random(0,100),random(y,x),random(y,x));
  
  
  
 y = y+.1;
 x = x-.1;

  



  }
  }

