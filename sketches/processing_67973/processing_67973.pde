
class Ammo extends WorldObject {
  Ammo(int ix, int iy, int iw, int ih, float ixvel, float iyvel) {
    super(ix, iy, iw, ih, ixvel, iyvel);
  }
  
  void draw() {
    fill(200, 0, 50);
    imageMode(CENTER);
    image(ammo1, x, y, 20, 20);
  }
}

