
//original code from tfguy44 in Processing Forum 
PImage img;
PFont font;
int m = 200;
int p = 30;
color c;
int value = 0; 
int q;
int a;
int j; 

void setup() {
  size(480, 600);
  img=loadImage("http://24.media.tumblr.com/99fa43514721ef665b761321258c1d4e/tumblr_mswjt2wFmz1r208hyo1_500.jpg");
  image(img, 0, 0);
}

void draw() {

  loadPixels();
  for (int w=0; w<2000; w++) {
    q = int(random(pixels.length));
    a = int(random(a, pixels.length));
  }

}
void mouseReleased() {
  for (int w=0; w<2000; w++) {
    q = int(random(pixels.length));
    a = int(random(q, pixels.length));
    j = int(random(pixels.length));
    if ( a<pixels.length && j<pixels.length || pixels[m] < pixels[p] ) {
      c = pixels[q];
      pixels[q] = c;
      pixels[a] = c;
      pixels[j] = c;
    }
  }
  updatePixels();
  } 
