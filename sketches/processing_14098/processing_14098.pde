

void setup(){
  size(360,200);
  colorMode(HSB,360,100,100);
}
void draw(){
  background(0);
  
  for(int x=0; x<360; x=x+5){
    float y= sin(radians(x+frameCount)*10)*50+80;
    fill(random(255),150,250);
    rect(x*2,y,10,mouseY);
  }
 
}
