
void setup(){
  size(600,400); //size of background
  background(255,0,255); //background colour
  colorMode(HSB,100);
}
void draw(){
  for(int i=0; i<1000; i++)
  {
    point(mouseX-random(25)+random(25), mouseY-random(25)+random(25));
    smooth();
    text("Group 8 Paint Thing", 130, 50);
  }
}


