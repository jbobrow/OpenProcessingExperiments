
float y;
int speed =4;
void setup(){
  size(500,500);
  background((color) 255,255,255);
  
  
}
 
void draw(){    
  y=y+speed;
  background((color) 255,255,255);
  fill(random(255),random(255),random(255));
  ellipse(250,y,20,20);
  if(y>500){
  speed=-speed;
}
  if(y<1){
   speed=-speed;
 }
 
}
