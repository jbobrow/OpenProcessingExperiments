

void setup(){
  size(500,500);
  smooth();
  background(255);
  stroke(0.5);
}

void draw(){
  for(int i=0;i<width;i+=40){
    for(int j=0;j<height; j+=60){
      if(mouseX>i&& mouseX <i +100 && mouseY >j && mouseY <j+10){
        fill(i,mouseX,mouseY,100); 
      }else{
      
        }
      ellipse(i,j,60,60);
  } 
 }
}



