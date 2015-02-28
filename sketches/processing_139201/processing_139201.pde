


/* Elusive mandalas
I intented to create a metaphore of the meditation state:
the more you try to reach it, the less you approach to it.
Just clik on different spots of the canvas or clik and drag.
Refresh, save
I hope you enjoy it.
*/

// Global variables
int x;
int y;
int c;
int d;

// Setup
void setup() {
size(1000, 500);
colorMode(HSB, 360, 100, 100, 100);
float h = random(200, 300);
float s = random(20, 40);
 background(h, s, 100); 
}

// The elusive mandalas
void draw() {
  if (mousePressed) {
      pushMatrix();   
     if (mouseX < width/2) {
       c = width/4 + width/2;
     }
     if (mouseX > width/2) {
      c = width/4; 
     }
     if (mouseY < height/2) {
      d = height/2 + height/4; 
     }
     if (mouseY > height/2) {
      d = height/4; 
     }
    translate(c, d);
      int circ = (int)map(mouseY, 0, height, 5, 13);
      int rad1 = mouseX - width/2;
      int rad2 = mouseY - height/2 + rad1;
      float cent = TWO_PI/circ;
        for (int i=0; i<circ; i+=1) {
         float x = sin(cent*i) * rad1;
         float y = cos(cent*i) * rad1;
         fill(mouseY, mouseX+40, 100, 50);
         ellipse(x, y, rad2, rad2);
        }
 popMatrix();
   }
}

void keyReleased() {
   float h = random(200, 300);
   float s = random(20, 40);
  
 
  if (key ==DELETE || key== BACKSPACE) background(h, s, 100); 
  if (key == 's' || key == 'S') saveFrame("elusive_mandala-##.jpg"); 
}

