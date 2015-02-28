
//homework 5
// Copyright Paul Bracchitta September 2011 Pittsburgh, PA 15289

int x = 0;
int y = 0;

void setup () {
  size(400,400);
  background(0);
  smooth();
}

void draw () {

  while(x<= 400) {
    
   y=0;
    
    while(y <= 400){
       
      //while(y > 0) {
          
       // if(mousePressed) {
         //  fill (0,x,y);
        // }else{
           fill(x,y,0);
        // }
       y = y+20;
       
       rect(x,y,15,15);
    }
    x = x+20;
  }
}    
