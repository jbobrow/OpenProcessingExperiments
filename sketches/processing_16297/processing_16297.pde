
void setup (){
  size (800,800);
  background (79,6,116);
}

void draw (){
  lineasH();
  lineasV();
  noFill();
  rect (450,450, 250,250);
}
    
  void lineasH(){
  for (int x=10; x <=400; x=x+5){
    stroke(x,x,50);
    line (x,200,x,600);
  }
  }
  
   void lineasV(){
  for (int y=10; y<=400; y=y+5){
   
    stroke(y, y, 50);
    line (200,y,600,y);}
  }

