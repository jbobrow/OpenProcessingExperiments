
int x = 0;
int y = 0;
void setup(){
  size(500,500);
  frameRate(7);
  colorMode(HSB);
}
void draw(){
  background(255);
  noStroke();
        
  for (x = 0; x < height+1; x=x+10){
    for(y = 0; y < width+1; y=y+20){
  fill(200,130,random(50,250),random(10,200)); 
rect(x,y,30,60);
  
    }
    
  } 
     
}



