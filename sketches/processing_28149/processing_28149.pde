
String bits = "01010000011100100110111101100011011001010111001101110011011010010110111001100111"; //Processing
PImage img;  
int mod;

void setup() {  
  size(512, 256);
  background(255);
  img = loadImage("len_std.jpg");
  image(img, 0, 0);
}  
  
void draw() {
  int i = 0;
  if (mousePressed == true) {
    if (mod<=255) {
      mod += 2;
    }
  } else {
    if (mod>=0) {
      mod -= 2;
    }
  } 
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++ ) {
      i++;
      color c = get(x,y);
      float r,g,b;
      r = red(c); g = green(c); b = blue(c);
      int gain = mod*(bits.charAt(i%bits.length())-48);
      r = constrain((r+gain),0,255);
      g = constrain((g+gain),0,255);
      b = constrain((b+gain),0,255);
      stroke(r,g,b);
      point(256+x,y);
    }
  }
}

