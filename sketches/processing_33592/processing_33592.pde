
void setup(){
  size(400,200);
  background(236,227,43);

}

void draw(){
  
  background(236,227,43);

  //left eye
  fill(255);
  noStroke();
  ellipse(150,100,100,130);
  
  //right eye
  fill(255);
  noStroke();
  ellipse(220,100,100,130);
  
  //pupil left
  fill(0);
  float mapping = map(mouseX,0,width,120,200);
  ellipse(mapping,130,10,10);
  
  //pupil right
  fill(0);

  float mapper = map(mouseX,0,width,170,260);
  ellipse(mapper,130,10,10);
  
  
  //eyelids
  if(mousePressed == true){
  fill(255,153,0);
  ellipse(150,100,100,130);
  ellipse(220,100,100,130);
  
  //pupil left disappear
  fill(255,153,0);
  ellipse(170,130,10,10);
  
  //pupil right disappear
  fill(255,153,0);
  ellipse(190,130,10,10);
  
  }
  
    
  //mapping. say from 0 to 400, instead do the width of the eyes themselves.
  
  

  }
    
    



