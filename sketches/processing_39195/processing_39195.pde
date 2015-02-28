
void setup(){
  size(400,400);
  background(255);
}
void draw(){
  for(int x=1; x<width; x+=100){
    for(int y=1; y<width; y+=100){
      bulls(x,y);
      
    }
  }
  noLoop();
}

void bulls(float a, float b){
  pushMatrix();
  translate(a,b);
  smooth();
  
  fill(0);
  ellipse(30,30,20,20);
  fill(255,0,0);
  ellipse(30,30,10,10);
  noFill();
  ellipse(30,30,30,30);
  ellipse(30,30,40,40);
  ellipse(30,30,50,50);
  
}

