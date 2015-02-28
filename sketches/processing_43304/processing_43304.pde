
PImage anna;
PImage anna2;
int [] col;

void setup() {
  size(1104, 730);
  anna = loadImage("anna.jpg");
  anna2 = createImage(anna.width, anna.height, RGB);
}

void draw() {
  image(anna2, 0, 0); 
  anna.loadPixels();
  for (int x = 0; x < anna.width; x++) {
    //   if(x < 1) {
    //    x= 1; 
    //   }
    println(x);
    for (int y = 0; y < anna.height; y++) {
      int loc = y*anna.width+x;
      if(x < mouseX+1) {
         anna2.pixels[loc] = anna.pixels[loc];
      }  else {
        anna2.pixels[loc] = anna.pixels[y*anna.width+mouseX];
    }
  }
  anna2.updatePixels();
}
}







