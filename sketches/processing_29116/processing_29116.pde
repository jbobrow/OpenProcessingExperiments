
void setup(){
  size (400,400);
}

void draw (){
  background(255);
  for(int i=0; i<400; i = i+20){
    for(int j=0; j<400; j = j+20){
      
      textSize (35);
      fill(i, 100, 100);
      text ("iO*", i, j);
    }
  }
}

                
                
