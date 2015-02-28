
int x = 0;
void setup() {
  size(400,400);
  }

  void draw(){
    background(0);
    if(x == 1){
      fill(255, 0, 0);
    }else fill(0, 255, 0);
    rect(50, 50, mouseY, mouseX);
    
  }
  void keyPressed(){
    if(key == 'a'){
      x = 1;
      
      
    }
    if(key == 'b'){
      x = 0;
    }
  }
   
    
  
  
  
  

