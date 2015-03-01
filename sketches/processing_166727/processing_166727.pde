
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
       
  for (x = 0; x < height+50; x=x+30){
    for(y = 0; y < width+50; y=y+30){
  fill(150,random(200,360),100,random(180,255));  
    ellipse(x,y,40,40);
 
    }
   
  }  
    
}


