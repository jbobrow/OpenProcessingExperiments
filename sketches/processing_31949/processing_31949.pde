
int click = 1;
float paddle2 = 1;
  int puck;
   
void setup() {
  smooth();
  size(500,500);
}
void draw(){
  translate(width/2, height/2);
   for(puck=0; puck<=800; puck =puck+click){
    rotate(paddle2);
    noStroke();
  fill(200,puck,puck);  
  ellipse(puck,puck,puck,puck); 
   }
  }
  
void mouseReleased() {
  if(click == 1) {
    
    click = 5;
    background(150);
    
  } 
  else {
    click = 1;
    
    
  }

}





