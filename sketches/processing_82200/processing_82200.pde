
int n = 16;
int[] palette = new color[16]; 

void setup() {
  palette[0] = color(#000000);
  palette[1] = color(#0000AA);
  palette[2] = color(#00AA00);
  palette[3] = color(#00AAAA);
  palette[4] = color(#AA0000);
  palette[5] = color(#AA00AA);
  palette[6] = color(#AA5500);
  palette[7] = color(#AAAAAA);
  palette[8] = color(#555555);
  palette[9] = color(#5555FF);
  palette[10] = color(#55FF55);
  palette[11] = color(#55FFFF);
  palette[12] = color(#FF5555);
  palette[13] = color(#FF55FF);
  palette[14] = color(#FFFF55);
  palette[15] = color(#FFFFFF);
  size (400,400);
  frameRate(1);
  noStroke();
  rectMode(CENTER);
}
void draw() {
  float rc_x = (width/n)/2;
  float rc_y = (height/n)/2;
  for (int i=0; i<n; i++) {
    fill(palette[int(random(0,15))]);
    rect (width/2, height-(i*(height/n)+rc_y), width/(n+2), height/(n+2));
  }
  
  int m = int(n/2);
  for (int i=2; i<n; i=i+2) {
    for (int j=1; j<(m-1); j++) {
      fill(palette[int(random(0,15))]);
      rect (j*(width/n)+width/2, height-(i*(height/n)+rc_y), width/(n+2), height/(n+2));
    }
    m--;
  }
  
m = int(n/2);
for (int i=3; i<n; i=i+2) {
  for (int j=1; j<(m-1); j++) {
    fill(palette[int(random(0,15))]);
    rect (width/2-j*(width/n), height-(i*(height/n)+rc_y), width/(n+2), height/(n+2));
  }
  m--;
}
}



