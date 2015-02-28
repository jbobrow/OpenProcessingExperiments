
PImage a;
PImage b;
PImage c;
PImage d;
PImage marilyn;
PImage teeth;

 
void setup() {
 size(450,450);
smooth();
 
marilyn = loadImage("marilyn.jpg");
teeth = loadImage("teeth.gif");
a = loadImage("a.gif");
b = loadImage("b.gif");
c = loadImage("c.gif");
d = loadImage("d.gif");
 
}

void draw(){
// image(marilyn, 0, 0, 450, 450); 
tint(mouseX, mouseY, 204);
 image(a, 0, 0, 450, 450); 
 
 tint(0, mouseX, mouseY);
 image(b, 0, 0, 450, 450); 
 
 tint(mouseX, 153, mouseY);
 image(c, 0, 0, 450, 450); 
 
 tint(mouseY, 0, mouseX);
 image(d, 0, 0, 450, 450); 
 
 noTint();
 image(teeth, 0, 0, 450, 450); 
 
 
 if(mousePressed){
 noTint();
 image(a, 0, 0, 450, 450); 
 image(b, 0, 0, 450, 450); 
 image(c, 0, 0, 450, 450); 
 image(d, 0, 0, 450, 450); 
 image(teeth, 0, 0, 450, 450); 
 }
 
}


