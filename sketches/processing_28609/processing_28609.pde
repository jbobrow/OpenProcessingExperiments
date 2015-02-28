
int abstand = 20;

void setup(){
  size(500, 500);
}
 
void draw(){
  
  background(255);
    

      for(int y = 0; y <= height; y = y + 10){
    for(int x = 0; x <= width; x = x + 10){

      ellipse(x, y, mouseX, mouseY); 

}
}

  }


                
                
