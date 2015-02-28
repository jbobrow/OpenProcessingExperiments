
class ghost {
  int x;
  int y;
  int size;
  PImage img;
  int speed = 1;
  boolean direc;
  
  ghost(String filename, int locx, int locy, boolean dir, int s) {
    img = loadImage(filename);
    x = locx;
    y = locy;
    direc = dir;
    size = s;
  }
  
  void show() {
    image(img, x, y, size,size);
  }
  
  void update(color c) {

    if (direc) {
      x = x + speed;
    }
    else {
      y = y + speed;
  }
  if (intersect(c)) {
    speed = speed * -1;
  }
}
  boolean intersect(color c){
     if(get(x,y+size+1) == c || get(x+size+1,y) == c) {
       return true;
     }
     return false;
  }

}



