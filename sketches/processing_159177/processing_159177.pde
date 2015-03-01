
void setup(){
  size(600,600);
}
void draw(){
  background(255);
  for(int x =0; x <600; x=x+10) {
    for (int y =0;y<600;y=y+10){
     if (mousePressed){
      fill(0,random(0,(mouseX)),255);
      ellipse(x,y,50,50);
    }}
  }
}
