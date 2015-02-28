
//in class demonstration on text filters.
//Alexander Werdmuller von Elgg



PImage myType;

void setup(){
  

  size(500,300);
  stroke(0,20);
  myType = loadImage("ten.gif");
  background(200);
  for(int i = 0; i < 2000; i++){
    int x = int(random(width));
    int y = int(random(height));
    color cp = myType.get(x,y);
    float b = brightness (cp); 
    
    if(b == 0){ 
   
      line(random(x),2(y),x,y);
      line(random(x),2(y),x,y);
      
    }
  }
}
