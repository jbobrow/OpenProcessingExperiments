
int x = 0;
int y = 0;
void setup(){
  size(500,500);
  frameRate(5);
  colorMode(HSB);
}
void draw(){
  background(255);
  noStroke();
       
  for (x = 0; x < height+1; x=x+20){
    for(y = 0; y < width+1; y=y+20){
  fill(150,360,random(150,260),random(20,255));  
    ellipse(x,y,40,40);
 
    }
   
  }  
    
}


