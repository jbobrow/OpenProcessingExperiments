
/*
A simple sketch emulating the simple wallpaper: Opacity http://simpledesktops.com/browse/desktops/2013/mar/20/opacity/
Made by @ramayac
*/
int rad = 90;

void setup(){
  size(860, 300);
  noStroke();
  smooth();
}

void draw(){
  background(#BAC94A);
  
  for(int i = 0; i < 6; i++){
    fill(255, 255, 255-i*15, 255-i*22);
    ellipse(rad+135*i, height/2, rad, rad);
  }
  
  noLoop();  
}
