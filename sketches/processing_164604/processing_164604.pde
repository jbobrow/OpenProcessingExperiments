
PImage img;
PFont myFont;
int x=30;
int y=30;

void setup()  {
  size(467,700);
  loadPixels();
}

void draw()  {
  img = loadImage("processingImage.jpg");
  image(img, 0, 0);
  
  rect(mouseX - 50, mouseY - 50,100,100);
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++ ) {
      int loc = x + y*img.width;
      float r,g,b;
      r = red (img.pixels[loc]);
      float maxdist = 50;//dist(0,0,width,height);
      float d = dist(x, y, mouseX, mouseY);
      float adjustbrightness = 200*(maxdist-d)/maxdist;
      r += adjustbrightness;
      r = constrain(r, 0, 200);
      color c = color(r);
      pixels[y*width + x] = c;
       
    }
}
      
updatePixels();
fill(0);
  textSize(32);
  text("Storm", 120, 75);
  text("Piper", 240, 180);
  textSize(60);
  text("Sisters", 160, 600);
  fill(255);
  //rect(0, 0, 467, 700);
  fill(0);
    if (x>467) {
    x=30;
    y=30;
  }
}




