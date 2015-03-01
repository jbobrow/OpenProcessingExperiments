
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
       
  for (x = 0; x < height+50; x=x+20){
    for(y = 0; y < width+50; y=y+20){
  fill(random(190,220),220,200, 130);  
    ellipse(x,y,40,40);
 
    }
   
  }  
    
}


