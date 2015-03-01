
void setup() {
  size(700,700);
colorMode(HSB);

}

void draw(){

  for(float x=10; x<700;x=x+10){
    for(float y=10;y<700;y=y+10){
  //background(0,0,0);
 fill(x/3,y/3,250);
  ellipse(x,y,10,10);

}
}
}
