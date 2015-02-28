
//Brian Bollens
//Introduction to Digital Media Fall 2012
//Section A
//9.11.12


float randomDiameter = 0; //global variable - float
float strokeGray = 0; //Global Variable - float

void setup(){
  size(1200,600);
  background(148,148,148);

}

void draw() {
  
 stroke(strokeGray);
 strokeWeight(5);
 smooth(); //anti-alliasing
 fill(144,252,135); //color selector
 
 //randomDiameter = random(20,100);
 if(randomDiameter<200){
   randomDiameter++;
 }
 else{
   randomDiameter=0;
   
 }
 
 ellipse(mouseX,mouseY,randomDiameter,randomDiameter);
 rect(mouseX,mouseY,100,randomDiameter);
 

}

void mouseClicked() {
  
  if (strokeGray==0){
    strokeGray = 255;
  }
  else{strokeGray = 0;
  }
  
  

}
