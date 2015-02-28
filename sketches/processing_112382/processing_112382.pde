
int randomOffset = 75;
int transparency = 10;
 
void setup(){
  size (800,800);
  background(0);
}
 
void draw(){
  stroke(255,transparency);
  for(int i=0; i < 1; i++){
    float startX = random( randomOffset * -1, randomOffset);
    float startY = random( randomOffset * -1, randomOffset);
    float endX = random( randomOffset * -1, randomOffset);
    float endY = random( randomOffset * -1, randomOffset);
    line( mouseX + startX, mouseY + startY, mouseX + endX, mouseY + endY);
     
  }
}
 
void mousePressed(){
  noStroke();
  fill(random(0,255),random(0,255),random(0,255),transparency);
  for(int i=0; i < 25; i++){
    float circlewidth = random( randomOffset * -1, randomOffset);
    float circleheight = random( randomOffset * -1, randomOffset);
    ellipse( mouseX,mouseY,circlewidth,circleheight);
  }
  transparency +=1;
}
 
void keyPressed(){
  if( key == ' '){
    stop();
  }
}
