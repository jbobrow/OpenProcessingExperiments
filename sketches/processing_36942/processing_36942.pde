
PImage img;
int[] drop_x = new int[10];
int[] drop_y = new int[10];
int[] drop_speed = new int[10];
color[] col = new color[307200];

void setup() {
  size(640, 480);
  img = loadImage("pic.jpg");
  image(img, 0, 0);
  filter(BLUR, 5);
  loadPixels();
  for (int i = 0; i < 307200; i++) {
    col[i]=pixels[i];
  }
  noStroke();
  ellipseMode(CENTER);
}

void draw() {
  for (int i = 0; i < 1000; i++) {
    int px=int(random(0, 640));
    int py=int(random(0, 480));
    set(px, py+int(random(0, 1)), col[640*py+px]);
  }
  for (int i = 0; i < 10; i++) {
    if (640*drop_y[i]+drop_x[i]<307200 && drop_speed[i]!=0) {
      fill(col[640*drop_y[i]+drop_x[i]]);
      ellipse(drop_x[i], drop_y[i], 15, 15); 
      int rx=int(random(0, 2)-random(0, 2));
      if ((drop_x[i]+rx>=0) || (drop_x[i]+rx<=640)) {
        drop_x[i]=drop_x[i]+rx;
      }
      drop_y[i]=drop_y[i]+drop_speed[i];
    }
    else
    {
      drop_x[i]=int(random(0, 640));
      drop_y[i]=int(random(0, 480));
      drop_speed[i]=int(random(1, 5));
    }
  }
}


