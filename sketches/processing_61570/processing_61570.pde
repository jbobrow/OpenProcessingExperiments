
void setup() {
  size(500,500);
  smooth();
  background(46,38,37);
}
 
void draw(){
  
fill(103,52,47);
  for(float c=.7;c<8;c++){
    for (float r=.2;r<9;r++){
      noStroke();
      ellipse(r*60,c*60,30,100); 
     }
  } 

  
  fill(129,45,29);
  for(float c=.7;c<8;c++){
    for (float r=.7;r<8;r++){
      noStroke();
      ellipse(r*60,c*60,50,50); 
     }
  }
  
  fill(46,38,37);
  for(float c=.7;c<8;c++){
    for (float r=.7;r<8;r++){
      noStroke();
      ellipse(r*60,c*60,30,50); 
     }
  }
  
}
