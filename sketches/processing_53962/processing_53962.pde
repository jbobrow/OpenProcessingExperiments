
int x = 0

void draw(){
  background(255);
  rect(x,25,50,50);
}

void mouseMoved(){
  x=x+5;
  if(x>105){
    x=0;
  }
}

                
                
