
int rabbit = 250;
int goat = 250;

void setup(){
  size(500,500);
  noFill();


}

void draw(){
  background(0);
  
  stroke(0,0,255);
  strokeWeight(5);
  ellipse(250, 250, rabbit, rabbit);
  rabbit = rabbit + 2;
  
  if(rabbit>500){
      background(0);
      stroke(255);
      rabbit = 0;

  }/* else{
    rabbit = rabbit -4;
  }
*/  
}
                                
