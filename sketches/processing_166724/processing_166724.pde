
int x = 0;
int y = 0;
void setup(){
  size(500,500);
  frameRate(5);
}
void draw(){
  background(255);
  noStroke();
       
  for (x = 0; x < height+1; x=x+20){
    for(y = 0; y < width+1; y=y+20){
  fill(255,random(10,200),random(5,260),random(255));  
    ellipse(x,y,40,40);
 
    }
   
  }  
    
}


