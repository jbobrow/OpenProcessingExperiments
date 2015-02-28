
int bsize = 30;
int xn;
int y;
color[][] colors;
int xnumb;
int ynumb;
int esize =20;

  
void setup() {
size(600, 600);
stroke(225,0,0);
strokeWeight(2);
xnumb = width/bsize;
ynumb= height/bsize;
colors = new color[xnumb][ynumb];
for (int i=0; i<xnumb; i++) {
for (int j=0; j<ynumb; j++) {
colors[i][j] = color(255);
}
}
}
  
void draw() {
background(255);
for (int i=0; i<xnumb; i++) {
for (int j=0; j<ynumb; j++) {
int x = i*bsize;
int y = j*bsize;
if (mouseX > x && mouseX < (x + bsize) && mouseY > y && mouseY < (y + bsize)) {
if (mousePressed) { 
           
colors[i][j] = color(random(250),0,random(250));
} else if (mousePressed) {
colors[i][j] = color(255);
}
}
fill(colors[i][j]);
rect(x, y, bsize, bsize);
ellipse(x,y,esize,esize);
}
}
}
