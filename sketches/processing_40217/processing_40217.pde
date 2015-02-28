
PImage img;
int pointillize = 20;
int cell = 15;
void setup() {
  size(300,300);
  img = loadImage("picture.jpg");
  image(img,0,0);
  noStroke();
  smooth();
}

void draw() {
  // Pick a point
  int x = int(random(img.width));
  int y = int(random(img.height));
  int place = x + y*img.width;
  
  // set the color
  loadPixels();
  float r = red(img.pixels[place]);
  float g = green(img.pixels[place]);
  float b = blue(img.pixels[place]);
  noStroke();
  
  // Draw an ellipse at that location with that color
  fill(r,g,b,100);
  ellipse(x,y,pointillize,pointillize);
  
  if(mousePressed){//add the dot with randomly color from the picture
   set(0,0,img);
   for(int i=cell; i <= 299; i+=cell){    
    for(int h=cell; h <= 299; h+=cell){
    color myFill = color(img.pixels[h + (i * 300)]);
    fill(myFill,150);
    float radius = cell * (brightness(img.pixels[h + (i * 300)]) / 255);
    ellipse(random(width),random(height),radius,radius);
  }
}
  }
}




