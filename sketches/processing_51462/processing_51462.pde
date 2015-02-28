
void setup(){
  size(600,600);
  smooth();
background(255,200,200);

  
  
}


void draw(){
  for(int i =0; i < width; i+=25){
    for(int j = 5; j < height; j+=25){
      if(mouseX > i && mouseX < i+25 && mouseY > j && mouseY < j+25){
    fill(245,40,23,227);
      }else{
        fill(0,0,200,40);
      }
     quad(i,j,i+15,j-30,i+30,j,i+15,j+30);
    }
  }
}
 


