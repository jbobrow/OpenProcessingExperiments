
color[] palette = new color[5];
color c1;
color c2;
color c3;
color c4;
color c5;

int[] sizes = {20, 40, 80};
void setup(){
  c1 = #D3402E;
  c2 = #EDD53F;
  c3 = #194F99;
  c4 = #282826;
  c5 = #E4F1F7;
  setPalette();
  size(800,600);
  smooth();
  frameRate(1);
}

void draw(){
  background(palette[4]);
  noStroke();
  
  for(int i = 0; i < 3; i++) {
    drawGrid(sizes[i]);
  }
  
//  saveFrame("triangles-####.png");
}

void mouseClicked(){
  redraw(); 
}

void drawGrid(int size){
  for(int r = 0; r < height/size; r++) { 
    for(int i = 0; i < width/size; i++) {
      int mod = int(random(1,8));
      if(((i * r) % mod) == 1){
        int col = int(random(4));
        fill(palette[col]);
        triangle(i * size, r * size, i*size, (r+1)*size, (i+1)*size, r * size);
      }
    }
  }
}

void setPalette(){
  palette[0] = c1;
  palette[1] = c2;
  palette[2] = c3;
  palette[3] = c4;
  palette[4] = c5;
}
