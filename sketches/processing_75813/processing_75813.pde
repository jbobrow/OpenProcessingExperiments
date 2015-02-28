
void setup(){
  background(118,199,234);
  size (400, 400);
}


void draw(){
  for(int y = 0; y<=height; y=y+70){
    for(int x= 0; x<= width; x=x+70){
      noStroke();
      fill(66,142,216);
      ellipse(x,y,30,30);
    }      
     
    }
    
    for(int y = 0; y<=height; y=y+35){
    for(int x= 0; x<= width; x=x+35){
      noStroke();
      fill(255);
      ellipse(x,y,10,10);
  }
    }

  }
