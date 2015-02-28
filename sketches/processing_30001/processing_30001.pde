
//heart-A (rise up!) by lily.zhou

float bg;

float hg;
float rg;
float rs;

PImage h;
PImage r;
 
 
void setup () {
  size (640, 480);
  
}
 
void draw () {
  bg = map(mouseY, 200, 300, 255, 0);
  background (bg);
  smooth();

//normal
     h = loadImage ("hearta1.png");
     rs = map(mouseX, 320, 640, 320, 640);
     image (h, (640/2) - (rs/2), (480/2) - (rs/2), rs, rs);
    
//rise
     r = loadImage ("heartag1.png");
     rg = map (mouseY, 200, 300, 255, 0);
     tint (255, rg); //fade
     image (r, (640/2) - (rs/2), (480/2) - (rs/2), rs, rs);

}

