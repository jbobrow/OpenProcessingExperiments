
void setup(){
  size(500,600);
}
void draw(){
  background(255);
float x=0;
while(x<900){
  strokeWeight(4);
  line(x,0,0,80000);
  x=x+4.5;
//4.5
}
float y=0;
while(y<500){
  stroke(0);
  strokeWeight(4);
  line(0,y,0,80000);
  y=y+5;
}

}



