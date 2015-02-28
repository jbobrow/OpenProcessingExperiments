

PImage img, maze;
int[] styles = { MULTIPLY, BLEND, SOFT_LIGHT, OVERLAY, HARD_LIGHT, BURN, DARKEST, LIGHTEST };

boolean grow;
int  style, carving, flow;

void setup() {
  img = loadImage("Mona.jpg");
  size(img.width, img.height);
  maze = img.get();
}

void draw() {
  carve(maze, carving); 
  blur(maze);
  image(img,1,1);
  if (grow) blend(maze,1,1,width-1,height-1, flow(0), flow(1), width - 2*flow(2) ,height - 2*flow(3), styles[style]); 
  else      blend(maze,0,0,width,height, flow(0), flow(1), width - 2*flow(2) -1,height - 2*flow(3)-1, styles[style]); 
  noFill(); strokeWeight(4); rect(1,1,width-2,height-2);
  maze = get();
}

void mFilter(PImage img, int[][] m, int f) {
  int d = m.length/2;
  img.loadPixels(); int p[] = new int[img.pixels.length];
  for(int Y=d; Y<img.height-d; Y++) for(int X=d; X<img.width-d; X++) {
    float r=0, g=0, b=0;
    int i = Y * img.width + X;
    for(int y=-d; y<=d; y++) for(int x=-d; x<=d; x++) {
      int j = i + y * img.width + x;
      r += m[y+d][x+d] * red(img.pixels[j]);
      g += m[y+d][x+d] * red(img.pixels[j]);
      b += m[y+d][x+d] * red(img.pixels[j]);
    }
    p[i] = color(r/f,g/f,b/f); 
  }
  arrayCopy(p, img.pixels); img.updatePixels();
}

void blur(PImage img) { mFilter(img, new int[][] {{1,1,1}, {1,1,1}, {1,1,1}}, 9); }
void carve(PImage img, int n) { mFilter(img, new int[][] {{-1,-1,-1,-1,-1}, {-1,1,1,1,-1}, {-1,1,n+8,1,-1}, {-1,1,1,1,-1}, {-1,-1,-1,-1,-1}}, n);}
int flow(int bit) { return  (flow>>bit) & 1;}

void keyPressed() {
  if(key>='1' & key <= '9') carving = key - '1'; 
  if(key == 'a') {flow = grow ? 0 : 15;}
  if(key == 's') {maze = img.get(); style = ++style % styles.length;}
  if(key == 'd') {maze = img.get();}
  if(key == 'f') {grow = !grow; flow = 15-flow;}
  if(keyCode == LEFT) flow ^= 1;
  if(keyCode == UP) flow ^= 2;
  if(keyCode == RIGHT) flow ^= 4;
  if(keyCode == DOWN) flow ^= 8;
}


