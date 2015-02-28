
PImage img;

void setup(){
 //String url = "http://www.fundamentals.comuf.com/wp-content/uploads/2012/08/mickey.jpg";
  img = loadImage( "mickey.jpg");
    size(344,359);
    

}

void draw(){
int x = int (random(width));
int y = int (random(height));
     int loc = x +y* width;
     
     float r = red(img.pixels[loc]);
     float g = green(img.pixels[loc]);
     float b = blue(img.pixels[loc]);
     
    // pixels [loc] = color (r,g,b);
    int o = int(random(30));
    noStroke();
    fill(r,g,b,100);
    ellipse(x,y,o,o);
 
 }

