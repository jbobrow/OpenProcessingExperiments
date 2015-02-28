

PFont police;

int x;
int y;
int couleur;
 
void setup() {
size (600,600);
background (0);
smooth();
noStroke();
frameRate(20);
colorMode (HSB,100);

police = loadFont ("ARCENA-48.vlw");
}
 
void draw() {
x = int(random(600));
y = int(random(600));
couleur = int(random(100));
fill (couleur,100,80,60); 
}
 
void keyPressed() {
textFont (police, 50);
text(key,x,y);
}


