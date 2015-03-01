
void setup() {
  size(700,700);
colorMode(HSB);

}

void draw(){

  for(float x=0; x<700;x=x+10){
    for(float y=0;y<700;y=y+10){
 
 fill(x/3,(y/3+random(255)),255);
  stroke(x/3,y/3,250);
  ellipse(x,y,10,10);

}
}
}
