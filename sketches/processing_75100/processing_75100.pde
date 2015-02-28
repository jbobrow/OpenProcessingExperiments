
PImage a; PImage b; PImage c; PImage d; 
PImage e; PImage f; PImage g; PImage h; 
PImage i; PImage j; PImage k; PImage x; 

int value = 0;

void setup() {
size(413, 413);
//background(46, 46, 46);
smooth();
frameRate (9);

a = loadImage("a.png"); b = loadImage("b.png"); 
c = loadImage("c.png"); d = loadImage("d.png"); 
e = loadImage("e.png"); f = loadImage("f.png"); 
g = loadImage("g.png"); h = loadImage("h.png"); 
i = loadImage("i.png"); j = loadImage("j.png"); 
k = loadImage("k.png"); x = loadImage("x.png");
}

void draw(){
imageMode(CENTER);
image(a, 206.5, 206.5, 413, 413);
//image(b, 206.5, 206.5, 413+ mouseX/15, 413+ mouseX/15);  
//image(c, 206.5, 206.5, 413+ mouseX/15.5, 413+ mouseX/20);
//image(d, 206.5, 206.5, 413+ mouseX/16, 413+ mouseY/20);
//image(e, 206.5, 206.5, 413+ mouseX/20, 413+ mouseY/20);
//image(f, 206.5, 206.5, 413+ mouseX/20, 413+ mouseY/20);
//image(g, 206.5, 206.5, 413+ mouseX/20, 413+ mouseY/20);
//image(h, 206.5, 206.5, 413+ mouseX/20, 413+ mouseY/20);
//image(i, 206.5, 206.5, 413+ mouseX/20, 413+ mouseY/20);
//image(j, 206.5, 206.5, 413+ mouseX/20, 413+ mouseY/20);
//image(k, 206.5, 206.5, 413+ mouseX/20, 413+ mouseY/20);

  image(b, 206.5+ mouseX/5, 206.5+ mouseY/5, 413, 413);  
  image(c, 206.5+ mouseX/7, 206.5+ mouseY/7, 413, 413);
  image(d, 206.5+ mouseX/8, 206.5+ mouseY/8, 413, 413);
  image(e, 206.5+ mouseX/9.5, 206.5+ mouseY/9.5, 413, 413);
  image(f, 206.5+ mouseX/10, 206.5+ mouseY/10, 413, 413);
  image(g, 206.5+ mouseX/12.5, 206.5+ mouseY/12.5, 413, 413);
  image(h, 206.5+ mouseX/14, 206.5+ mouseY/14, 413, 413);
  image(i, 206.5+ mouseX/18, 206.5+ mouseY/18, 413, 413);
  image(j, 206.5+ mouseX/25, 206.5+ mouseY/25, 423, 423);
  image(k, 206.5, 206.5, 416, 416);

image(x, 50, 380);
  }


void mouseClicked() {
//  //if (value == 0) {
  image(a, 206.5, 206.5);
  }
//void mouseClicked() {
//  image(b, 0, 0);
// // }

void mouseDragged() {
  frameRate (60);
  imageMode(CENTER);
  image(b, 206.5, 206.5, 413+ mouseX/20, 413+ mouseY/20);  
  image(c, 206.5+ mouseX/20, 206.5, 413+ mouseX/15, 413+ mouseY/15);
  image(d, 206.5+ mouseX/20, 206.5, 413+ mouseX/5, 413+ mouseY/5);
  image(e, 206.5, 206.5, 413+ mouseX/5.5, 413+ mouseY/5.5);
  image(f, 206.5, 206.5, 413+ mouseX/6, 413+ mouseY/6);
  image(g, 206.5, 206.5, 413+ mouseX/6.5, 413+ mouseY/6.5);
  image(h, 206.5, 206.5, 413+ mouseX/7, 413+ mouseY/7);
  image(i, 206.5, 206.5, 413+ mouseX/7.5, 413+ mouseY/7.5);
  image(j, 206.5, 206.5, 413+ mouseX/8, 413+ mouseY/8);
  image(k, 206.5, 206.5, 413+ mouseX/10, 413+ mouseY/10);
  
image(x, 50, 380);
}

