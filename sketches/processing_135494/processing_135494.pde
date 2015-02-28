
/*
    Andor Salga
    March 2014
*/

void setup(){
  size(650, 400);
  strokeWeight(3);
}
 
void lines(){
  stroke(0,255,0);
  for(int i = 0; i < 30; i++){
    float y = pow(((i+frameCount/40.0f)%20), 2.5);
    line(0, y, width, y);
  }
  for(int i = 0; i < width; i+=20){
    line(i, 0, (i-width/2)*20, height);
  }
  noStroke();
  for(int i = 0; i < height; i+= 10){
    fill(0, 255-(i/(float)height * 255)*1.5);
    rect(0, i-2, width*2, 10);// use -2 instead of extra call to rectMode(CENTER)
  }
}
 
void draw(){
  translate(0, height/2);
  lines();
  scale(1, -1);
  lines();
}
