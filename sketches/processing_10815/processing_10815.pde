
float diameter;
float lastDiameter;
int numberOfCircles = 1;
int lastNumberOfCircles = 1;
int iterations = 6;

void setup(){
  
  size(400,400);

  stroke(255, 70);
  fill(0, 50);
  diameter = width;

  ellipseMode(CENTER);

  //println(diameter);

  ellipse(diameter/2, height/2, diameter, diameter);
  
  lastDiameter = width;
  lastNumberOfCircles = 1;
  fill(255, 10);
}

void draw(){
  
  diameter = lastDiameter/2;
  numberOfCircles = lastNumberOfCircles * 2;
  
  if (int(lastDiameter) <= 1 ){ 
    
    
    stop();
  }
  else {

    float thisPos = diameter/2;
   
    for (int i= 0; i < numberOfCircles; i++){
      
       noFill();
      
       ellipse(thisPos, height/2, diameter, diameter);
       //ellipse(width/2, thisPos, diameter, diameter);
       println("ellipse pos" + thisPos);
       
      thisPos = thisPos + diameter;
    }
    
    lastDiameter = diameter;
   lastNumberOfCircles = numberOfCircles;
  }
  
  

smooth();
  
}


