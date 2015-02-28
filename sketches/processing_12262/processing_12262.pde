
int endX = 10;
int endY = 10;

void setup(){
size(385,385);
background(255);
smooth();




}
void draw(){
 background(255);
  
  for(int x = 0; x < width; x+=10){
    for(int y = 0; y < height; y+=10){
  
  noStroke();
  fill(random(20),random(20),random(20),random(90));
  ellipse(x,y,endX,endY);
  
    }  

    endX +=random(10);
    endY +=1;
    
    if (endY >10){
      endY = endY *-1;
      if(endX >10){
        endX = endX *-1;
      
}
}
  }
}


