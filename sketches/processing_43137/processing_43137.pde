
void setup(){
  size(600,600);
  smooth();
  background(222,67,67);  
}

void draw(){
  for(int i = 0; i < 1000; i+=10){
    noFill();
    stroke(49,242,118);
    ellipse(width/2,height/2,i,i);
  }
   
}

