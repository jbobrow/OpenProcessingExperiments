
void setup(){
  size(600,600);
  smooth();
  background(0);
  fill(255);
  noStroke();
  
}

void draw(){
  float ellSize=0;
  for(int x=0; x<width;x+=2){
  for(int y=0; y<height; y+=2){
    ellSize=sin(y+x)*20;
   rotate(x); //expect ellipses between 0-10 pixels
    ellipse(x,y,ellSize,ellSize);
    fill(random(255),random(255),random(255));   
  }
  }
}
    

