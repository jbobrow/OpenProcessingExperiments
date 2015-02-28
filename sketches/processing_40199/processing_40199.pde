
PImage img;

void setup() {
  size(300, 300);
  color(RGB);
  img = loadImage("Jamaica_sunrise.jpg");
  background(0);
  smooth();
}

void draw() {
}

void mousePressed() {
  for (int x=0; x<width; x+=random (20,20)) {
    
    int j = int(random(0, img.width));
    int b = int(random(0, img.height));
    int w = int(random(0, img.width));
    int c = int(random(0, img.height));
    int l = int(random(0, img.width));
    int s = int(random(0, img.height));
    int h = int(random(0, img.width));
    int n = int(random(0, img.height));
    
    color jfill = img.get(j, b);
    color bfill = img.get(w, c);
    color cfill = img.get(l, s);
    color kfill = img.get(h, n);
    
    fill(jfill);
    rect(10, 10, 140, 280);
    
    fill(bfill);
    rect(160, 10, 130, 80);
    
    fill(cfill);
    rect(160, 110, 130, 80);
    
    fill(kfill);
    rect(160, 210, 130, 80);
  }

  
}

