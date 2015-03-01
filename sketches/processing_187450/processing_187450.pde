
void setup() {
  size(1000,800);

  frameRate(10);
}
void draw() {
  background(122, 219, 237);
  for ( int x = 0;x < width; x = x+20) {
    //for (int z= 20; z<width; z+=20) {
     for(int y= 20; y<height; y+=20){
      
     stroke(255, 100, 253);
      strokeWeight(2);
    line(x, 0, x, height);
      stroke(255, 255, 93);
      //line(z, 0, z+z/2, height/2);
     // line(z+z/2, height/2, z*1.2, height);
       line(0, y, mouseX, y+y/2);
      line(mouseX, y+y/2, width, y*1.2);
    }
  }
}



