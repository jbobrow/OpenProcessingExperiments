
int one ;
int two ;


void setup(){
  size(500,500);
  background(247,188,115);
  smooth();
  fill(255);
  stroke(255);
  
  one=0;
  two=0;
 
  
  
  
}
 
void draw(){
  background(247,188,115);
 for (int y=20; y<=height-20; y+=50) {
  for (int x=20; x<=width-20; x+=50) {
    ellipse(x,y,2,2);
    strokeWeight(3);
    stroke(250,237,169);
    line(x,y,one,two);
    
    
    
  }
  }
  
  delay (35);
  one=one+3;
  two=two+3;
 
   if (one>350){
      one=20;}
      
      if (two>500){
        two=20;}
      
  
}
 
