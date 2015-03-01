
void setup(){
  size(400,400);
  smooth();
  noStroke();
  
}

void draw(){
  frameRate(5);
  for(int x=0;x<400;x=x+30){
    for(int y=0;y<400;y=y+20){
      float a=random(400);
     
      fill(255,x,0,30);ellipse(y,x,a,a);
    }
  }
}

save("joao.tif");
