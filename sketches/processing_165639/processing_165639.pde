

int x = 0;
int y = 0;
void setup(){
  size(500,500);
  frameRate(7);
}
void draw(){
  background(255);
  noStroke();
      
  for (x = 0; x < height; x=x+50){ 
    for(y = 0; y < width; y=y+50){
  fill(255,random(10,150),random(5,60),random(255));   
    rect(x,y,45,45);

    }
  
  }   
   
}




