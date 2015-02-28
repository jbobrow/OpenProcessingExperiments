
int diameter = 10;
int positionX = 50;

void setup(){
  size(350,400);
  rectMode(CENTER);
}

void draw(){
  background(0,139,191);
  
  if(positionX <= width-diameter/2){
    positionX++; //positionX = positionX +1;
  
  }else if(positionX < 50){
    
  }
  
  noStroke();  
  ellipse(positionX,height/2,diameter,diameter);
  
  
  }  



