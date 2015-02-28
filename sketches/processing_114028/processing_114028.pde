
void setup(){
  size(400,400);
}

void draw(){
  
  if (mousePressed){
  
      for(int i=0; i<30; i++)
      {
        point(mouseX+random(20), mouseY+random(20));
      }
  
  }
}


