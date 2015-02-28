
int x = 80;
int y = 30;
int w = 800;
int h = 800;

void setup() {
 size(1600, 1600); 
}
void draw() {
   int randr = random(0, 255);
   int randg = random(0, 255);
   int randb = random(0, 255);
 background(randr, randg, randb); 
 if ((mouseX > x) && (mouseX < x+w) && 
 (mouseY > y) && (mouseY < y+h)) {
 
 fill(randr * .5, randg * .8, randb * .3); 
 } else {
 fill(0); 
 }
 rect(x, y, w, h);
}

