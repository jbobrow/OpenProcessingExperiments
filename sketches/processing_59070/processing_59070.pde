
PImage imgOrg;

// Lens properties
int lsize = 90, lsize2 = lsize * lsize;
float mag = 2.0f;
float k = -0.00016f;

int offX, offY;
int border, borderViaLens;

public void setup() {
  size(580, 404);
  cursor(CROSS);
  imgOrg = loadImage("london.jpg");
  // Calculate image offsets reqd to centre image
  offX = (width - imgOrg.width)/2;
  offY = (height - imgOrg.height)/2;
  // border colours
  border = color(200);
  borderViaLens = color(180);
}

public void draw() {
  background(200);
  image(imgOrg, offX, offY);
  showLens(mouseX, mouseY);
}

public void showLens(int x, int y) {
  int u, v, r2;
  float f;
  for (int vd = - lsize; vd < lsize; vd++) {
    for (int ud = - lsize; ud < lsize; ud++) {
      r2 = ud*ud + vd*vd;
      if (r2 <= lsize2) {
        f = mag + k * r2;
        u = floor(ud/f) + x - offX;
        v = floor(vd/f) + y - offY;
        if (u >= 0 && u < imgOrg.width && v >=0 && v < imgOrg.height)
          set(ud + x, vd + y, imgOrg.get(u, v));
        else 
          set(ud + x, vd + y, borderViaLens);
      }
    }
  }
}


