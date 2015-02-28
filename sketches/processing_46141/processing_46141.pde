
void setup(){
  size(600,600);
  smooth();
  background(0);
  fill(255);
  noStroke();
  
}

void draw(){
  float ellSize=0;
  for(int x=0; x<width;x+=50){
  for(int y=0; y<height; y+=70){
    ellSize=sin(y+x)*cos(x++)*100;
   rotate(x+10); //expect ellipses between 0-10 pixels
    ellipse(x,y,ellSize,ellSize);
    fill(random(255),random(255),random(255));   
  }
  }
}

