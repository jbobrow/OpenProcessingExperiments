
int gs = 20;
color [][] grid = new color[32][32];

void setup () {
  size(640,640);
  scheme = new ArrayList();
  scheme.add(new colorIndex( 0, #010109));
  scheme.add(new colorIndex( 0.02, #02022A));
  scheme.add(new colorIndex(.8, #40EFFF));
  scheme.add(new colorIndex( .94, #FFF940));
  scheme.add(new colorIndex( .98, #FFFEEE));
  scheme.add(new colorIndex( 1, #FFFFFF));
  make();
  //gradient(1, scheme); exit();
}

void draw () {
  loadPixels();
  if (mousePressed) {
    for (int x=0; x<grid.length; x++) {
      for (int y=0; y<grid[x].length; y++) {
        px(x,y, grid[x][y]);
      }
    }
  }else {
    for (int x=0; x<width; x++) {
      for (int y=0; y<height; y++) {
        pixels[x+y*width] = gradient(noise((y)/20.0,x/20.0,millis()/500.0), scheme);
      }
    }
  }
  updatePixels();
}
void px (int x, int y, color c) {
  x*=gs; y*=gs;
  for (int dx=0; dx<gs; dx++) {
    for (int dy=0; dy<gs; dy++) {
      pixels[(x+dx)+(y+dy)*width] = c;
    }
  }
}
void make () {
  for (int x=0; x<grid.length; x++) {
    for (int y=0; y<grid[x].length; y++) {
      grid[x][y] = gradient(random(0,1), scheme);
    }
  }
}
//gradient 0 = #FFFF
//gradient 0.123 = #asdasd
//gradient 1 = #asdasd
ArrayList scheme;
color gradient (float t, ArrayList colors){
  t = constrain(t, 0, 1);
  color c1=#000000, c2=#000000; float lv=1, hv=0;
  for (int i=0; i<colors.size(); i++) {
    colorIndex value = (colorIndex) colors.get(i);
    if (value.index < lv) {
      c1 = value.c;
      lv = value.index;
    }
    if (value.index > hv) {
      c2 = value.c;
      hv = value.index;
    }
  }
  lv=0; hv=1;
  for (int i=0; i<colors.size(); i++) {
    colorIndex value = (colorIndex) colors.get(i);
    if (value.index >= lv && value.index < t) {
      c1 = value.c;
      lv = value.index;
    }
    if (value.index <= hv && value.index > t) {
      c2 = value.c;
      hv = value.index;
    }
  }
  float dv = hv-lv;
  t = (t-lv)/dv;
  //println(t + ", " + lv + ", " + hv );
  return lerpColor(c1,c2,t);
}
class colorIndex {
  float index; color c;
  colorIndex (float index, color c) {
    this.c=c;this.index=index;
  }
}

