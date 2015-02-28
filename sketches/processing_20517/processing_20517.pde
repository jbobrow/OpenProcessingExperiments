
int num = 2;

PImage flower;

void setup(){
  size(300,300);
  flower = loadImage("DSC00042b.jpg");
  background(0);
  smooth();
  frameRate(100);
}
  

void draw(){ 
    int x = int (random(flower.width));
    int y = int (random(flower.height));    
    int Pixels = x + y*flower.width;
    loadPixels();
    float r= red(flower.pixels[Pixels]);
    float g= green(flower.pixels[Pixels]);
    float b= blue(flower.pixels[Pixels]);
    
    noStroke();
    fill(r,g,b);
    rect(x,y, num, num);
  }

    
   

