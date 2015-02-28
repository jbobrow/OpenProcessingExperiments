
void setup (){
  size (800,800);
  background (175,21,21);
}

void draw (){
  lineasH();
  lineasV();
  
}
    
  void lineasH(){
  for (int x=10; x <=400; x=x+5){
    stroke(x,x,50);
    line (200,200,x,600);
  }
  }
  
   void lineasV(){
  for (int y=10; y<=400; y=y+5){
   
    stroke(y, y, 50);
    line (200,y,600,600);}
  }

