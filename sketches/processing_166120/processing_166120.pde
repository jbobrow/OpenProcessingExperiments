
float angle=0.0;
void setup(){
  background(204,214,47);
  size(500,500);
  smooth();
  noStroke();
  frameRate(15);
}
void draw(){
  for(int i=0;i<255;i+=50){
  fill(50+i,i,i*2,100);
  //rect(0,0,width,height);
  //fill(i,i,i,12);
  angle=angle+0.2;
  translate(80,80);
  rotate(angle);
  rect(mouseX,mouseY,mouseX+70,mouseY+70);
}
}


