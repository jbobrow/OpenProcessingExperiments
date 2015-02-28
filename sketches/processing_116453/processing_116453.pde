
void setup(){
  
  size(500,400);
  smooth();
  background(random(0,255));
  frameRate(5);
  
}


void draw(){
    background(255);
    stroke(random(255));
  
for(int i=0; i <= width; i=i+10){  
  for(int j=0; j <= height; j=j+10){
  fill(random(255),random(255),random(255),random(191));
  rect(i,j,random(30,80),random(60,150)); 

}

  
}

}//draw





