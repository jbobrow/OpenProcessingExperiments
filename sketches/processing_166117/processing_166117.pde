
float angle=0.0;
void setup(){
  background(204,214,47);
  size(500,500);
  smooth();
  noStroke();
}
void draw(){
  for(int i=0;i<255;i+=50){
  fill(120+i,i,i*0.2,12);
  //rect(0,0,width,height);
  //fill(i,i,i,12);
  angle=angle+0.02;
  translate(50,50);
  rotate(angle);
  rect(50,50,460,460);
}
}


