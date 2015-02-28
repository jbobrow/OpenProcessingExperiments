


void setup(){
size(1024, 768);
smooth();
noStroke();
background(200, 200, 200);
int dropy = 0;
}


void draw(){
  noStroke();
smooth();
for (int x = 0; x <  17; x++) {
  int xspace = 55+ (70 * x);
  int colorchange = 9 * x;
  for (int y = 0; y < 17; y++) {
    smooth();
    int yspace = 50*y;
    fill(214 - colorchange, 2 + colorchange, 2 + colorchange);
    arc(xspace, yspace, 60, 60, PI, 2*PI);
    fill(255 - colorchange, 135, 5+ colorchange);
    arc(xspace, yspace, 55, 55, PI, 2*PI);
    fill(255 - colorchange, 235 - colorchange, 5 + colorchange);
    arc(xspace, yspace, 50, 50, PI, 2*PI);
    fill(10 + colorchange, 229 - colorchange, 0 + colorchange);
    arc(xspace, yspace, 45, 45, PI, 2*PI);
    fill(3 + colorchange, 131, 255 - colorchange);
    arc(xspace, yspace, 40, 40, PI, 2*PI);
    fill(140, 0 + colorchange, 216 - colorchange);
    arc(xspace, yspace, 30, 30, PI, 2*PI);
    fill(200, 200, 200);
    arc(xspace, yspace, 20, 20, PI, 2*PI);
  }
}

for (int h = 0; h < 17; h++) {
  for (int w = 1; w < 20; w++) {
    if (((w + h)%2) != 0) {
      float diff = 12.5 - w;
      int wid = 500 + (w * 40);
      fill(51 + (100 - (w*8)), 153 + (100 - w*7), 240);
      int hei = h * 50; 
      smooth();
      triangle(wid, hei-3 + diff, wid - 2 - (w/2), hei + 10 + diff, wid + 2 + (w/2), hei + 10 + diff);
      ellipse(wid, hei + 17, 7 + w, 7 + w);
    }
  }
}

for (int h = 0; h < 17; h++) {
  for (int w = 1; w < 20; w++) {
    if (((w + h)%2) != 0) {
      float diff = 12.5 - w;
      int wid = 520 + (w * 40);
      fill(51 + (100 - (w*8)), 153 + (100 - w*7), 240);
      int hei = h * 50 - 30; 
      smooth();
      triangle(wid, hei-3 + diff, wid - 2 - (w/2), hei + 10 + diff, wid + 2 + (w/2), hei + 10 + diff);
      ellipse(wid, hei + 17, 7 + w, 7 + w);
    }
  }
}
for (int h = 0; h < 17; h++) {
  for (int w = 1; w < 20; w++) {
    if (((w + h)%2) != 0) {
      float diff = 12.5 - w;
      int wid = 480 + (w * 40);
      fill(51 + (100 - (w*8)), 153 + (100 - w*7), 240);
      int hei = h * 50 - 30; 
      smooth();
      triangle(wid, hei-3 + diff, wid - 2 - (w/2), hei + 10 + diff, wid + 2 + (w/2), hei + 10 + diff);
      ellipse(wid, hei + 17, 7 + w, 7 + w);
    }
  }
}

for (int h = 0; h < 15; h++) {
  for (int w = 1; w < 20; w++) {
    if (((w + h)%2) != 0) {
      float diff = 12.5 - w;
      int wid = 520 + (w * 40);
      fill(51 + (100 - (w*8)), 153 + (100 - w*7), 240);
      int hei = h * 50 - 30; 
      smooth();
      triangle(wid, hei-3 + diff, wid - 2 - (w/2), hei + 10 + diff, wid + 2 + (w/2), hei + 10 + diff);
      ellipse(wid, hei + 17, 7 + w, 7 + w);
    }
  }
}

for (int i = 0; i < 18; i++){
  float x = random(0, 500);
  float y = random(0, 760);
  fill(random(255), random(255), random(255));
  ellipse(x, y, 20, 20);
  ellipse(x, y + 30, 20, 20);
  ellipse(x - 15, y + 15, 20, 20);
  ellipse(x + 15, y + 15, 20, 20);
  ellipse(x-10, y+5, 15, 15);
  ellipse(x-10, y+25, 15, 15);
  ellipse(x+10, y+5, 15, 15);
  ellipse(x+10, y+25, 15, 15);
  ellipse(x, y+15, 20, 20);
  fill(random(150), random(150), random(150));
  ellipse(x, y+15, 20, 20);
}
}

