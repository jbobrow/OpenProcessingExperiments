
void setup(){
  size(255,255);

}

void draw(){
  background(255);
 
for(int a=0;a<width;a+=10){
    
    for(int b=0; b<height; b+=10){
      
      noStroke();
      float distance = abs(mouseX-a);
      
      fill (distance, 200, 0);
      rect(a, b, 5, 5);
  }
}
    
for(int a=5;a<width;a+=10){
    
    for(int b=5; b<height; b+=10){
      
      noStroke();
      float distance = abs(mouseY-b);
      
      fill (175, 255-distance, 0);
      rect(a, b, 5, 5);

    }    
    
 }
 
  stroke(245,200,178);
  for (int i = 0; i<width; i+=5){
   line(i,0, i, height);
 }
 for (int j = 0; j<height; j+=5){
   line(0, j, width, j);
 }
 

}


