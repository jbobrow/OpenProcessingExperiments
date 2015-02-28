
PGraphics small;
int[][] choices;
int[] pix;
int sz;
boolean doColor;

void setup() {
  size(640,400);
  background(0);
  frameRate(10);

  small = 
    createGraphics(
      round(width*(1/(width/320f))), 
      round(height*(1/(height/200f))), JAVA2D);
  small.beginDraw();
  small.background(0);
  small.endDraw();
  small.loadPixels();
  pix = new int[small.pixels.length];
  Arrays.fill(pix, 0);
  
  choices = new int[][]{
    new int[]{0,#ffffff,#ffffff,0}, 
    new int[]{#ffffff,0,0,#ffffff}};
  sz = 4;
}

void draw() {
  int rad = round(sqrt(sz));
  int[] row = new int[small.width*rad];  
  for(int a=0; a<small.width; a+=rad) {
    int[] choice = choices[(int)random(choices.length)];
    for(int b=0; b<sz; b++) {
      int xx = (b%rad)+a;
      int yy = floor(b/rad);
      int ind = yy*small.width+xx;
      int rr = 64+round(millis()*.5)%196;
      int gg = 64+round(millis()*.6)%196;
      int bb = 64+round(millis()*.7)%196;
      row[ind] = 
        choice[b]!=0?
          doColor?
            (int)random(1000)<100?
              color(rr,gg,bb)
              :choice[b]
            :#ffffff
        :0;
    }
  }
  pix = concat(pix, row);
  pix = subset(pix, small.width*rad);
  
  if((int)random(1000) < 20) {
    sz = (int)random(2, 7);
    sz = round(pow(2, sz));
    int start = (int)random(small.pixels.length-sz-1);
    choices = new int[0][0];
    choices = (int[][])append(choices, 
      subset(small.pixels, start, sz));
    start = (int)random(small.pixels.length-sz-1);
    choices = (int[][])append(choices, 
      subset(small.pixels, start, sz));
  }
  
  arrayCopy(pix, small.pixels);
  small.updatePixels();
  checkActivity();
  image(small.get(), 0,0, width,height);
}

void checkActivity() {
  for(int a=0; a<small.pixels.length; a++) {
    if(small.pixels[a] != 0) return;
  }
  setup();
}

void mouseClicked() {
  setup();
}

void keyTyped() {
  if(key == 'c' || key == 'C') {
    doColor = !doColor;
    return;
  }
  setup();
}

