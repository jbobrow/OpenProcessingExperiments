
void setup(){
  size(270,270);
  background(205);
}
void draw(){
  for(int x=0;x<9;x++){
    if(x%2<=0){
      fill(255,0,0);
      rect(3+30*x,123,24,24);
    }//x is even,red rect
     if(x%2>=1){
      fill(0,255,0);
      ellipse(15+30*x,135,24,24);
    }//x is odd,green ellipse
  }
}

