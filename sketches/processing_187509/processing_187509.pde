
PImage img;
boolean mode = true;
int scale = 64, x, y;
float mod;

void setup() {
  size(512, 404);
  img = createImage(512, 384, RGB);
  noSmooth();
  noFill();
  stroke(0xFFFF005C);
  frameRate(120);
}

void draw() {
  background(0);
  image(img, 0, 0);
  img.loadPixels();

  x = floor(mouseX/scale)*scale;
  y = floor(mouseY/scale)*scale;
  rect(x-1, y-1, scale+1, scale+1);
  text(str(scale), width-24, height-5);
  if (mode) text("mode 0", 5, height-5);
   else text("mode 1", 5, height-5);
}

void mouseWheel(MouseEvent event) {
  if (event.getAmount() > 0) scale = constrain(scale>>1, 4, 128);
   else scale = constrain(scale<<1, 4, 128);
}

void keyPressed() {
  if (key == 's') save();
  if (key == 'm' || key == 'M') mode = !mode;;
  if (key == 'b' || key == 'B') {
    scale = scale<<1;
    if (scale > 128) scale = 4;
  }
   if (key == 'v' || key == 'V') {
    scale = scale>>1;
    if (scale < 4) scale = 128;
  }
}

void mousePressed() {
  if (mouseY > img.height) return;
  mod=0;
  if (scale < 16 || !mode) doStuff_A();
   else doStuff();
}

void mouseDragged() {
  if (mouseY > img.height-7) return;
  mod=map(scale, 32, 128, 0.024, 0.052);
  if (scale < 8 || !mode) doStuff_A();
   else doStuff();
}

void doStuff() {

  float[] blk_cnt = new float[int(sq(scale/8))];
  
  int i = 0;
  for (int px = x; px < x+scale; px+=8) {
    for (int py = y; py < y+scale; py+=8) {
      for (int Px = px; Px < px+8; Px++) {
        for (int Py = py; Py < py+8; Py++) {
          if ((img.pixels[Py*img.width+Px]&0xFF) == 0) blk_cnt[i]++;
        }
      }
      i++;
    }
  }
  float butt = 0;
  if (mouseButton == LEFT) butt = -0.062+mod;
  if (mouseButton == RIGHT) butt = 0.062-mod;

  for (i = 0; i < blk_cnt.length; i++) {
    blk_cnt[i] = blk_cnt[i]/64+butt;
  }

  i = 0;
  for (int px = x; px < x+scale; px+=8) {
    for (int py = y; py < y+scale; py+=8) {
      for (int Px = px; Px < px+8; Px++) {
        for (int Py = py; Py < py+8; Py++) {
          if (random(0, 1) < blk_cnt[i]) img.pixels[constrain((Py*img.width+Px), 0, img.pixels.length-1)] = 0; 
           else img.pixels[constrain((Py*img.width+Px), 0, img.pixels.length-1)] = -1;
        }
      }
      i++;
    }
  }
  img.updatePixels();
}

void doStuff_A() {

  int Bk = 0;
  for (int px = x; px < x+scale; px++) {
    for (int py = y; py < y+scale; py++) {
      if ((img.pixels[py*img.width+px]&0xFF) == 0) Bk++;
    }
  }

  float rat = Bk/sq(scale);
  if (mouseButton == LEFT) rat = rat-0.062+mod;
  if (mouseButton == RIGHT) rat = rat+0.062-mod;

  for (int px = x; px < x+scale; px++) {
    for (int py = y; py < y+scale; py++) {
      if (random(0, 1) < rat) img.pixels[constrain((py*img.width+px), 0, img.pixels.length-1)] = 0; 
       else img.pixels[constrain((py*img.width+px), 0, img.pixels.length-1)] = -1;
    }
  }
  img.updatePixels();
}

