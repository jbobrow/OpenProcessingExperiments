
void setup () {
  background(255);
  size(500,500);
  
}
void draw(){
  for(int i = 1; i < 16; i++) {
      functionX(i);
  }
    
    }
  
  
 void functionX(int i){
    rect(30*i,100,20,20);
  }



