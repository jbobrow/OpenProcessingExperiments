
void setup(){
  size(700,600);
  smooth();
}

void draw(){
  
  for(int i = 0;i < width; i+=100){
    for(int j = 0;j < height; j+=100){
      if(mouseX >i && mouseX <j+10){
     
        { 
          
    
        fill(i,100,mouseX);}
        stroke(mouseX,mouseY,200);
     //
    }
     if( mouseX > i && mouseY > j) { 
       noFill();
     } else {
       ellipse(i,j,270,270);
     }

  
    }
  }
}

