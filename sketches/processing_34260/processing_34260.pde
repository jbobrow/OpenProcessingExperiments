
void setup() {
size(400, 300);
 frameRate(1);
 
}
 
void draw() {
PImage df;
df = loadImage("c11.jpg");
background(df);
PFont font; 
font = loadFont("Andalus-48.vlw"); 
textFont(font); 
fill(255);
textSize(20);
textAlign(CENTER);
text("Visualisation gender issues in  ", 205,100); 
textSize(30);
text("Diego Velazquez", 203,130);
text("paintings", 215,150);
textSize(20);
text("by Radoslaw Bomba", 210,175);
if (mouseButton == LEFT){ 
 PImage img;
img = loadImage("a2.jpg");
image(img, random (width),random (height),random (200),random (200));

 PImage g;
g = loadImage("a1.jpg");
image(g, random (width),random (height),random (200),random (200));

 PImage z;
z = loadImage("a3.jpg");
image(z, random (width),random (height),random (200),random (200));

 PImage dfg;
dfg = loadImage("a5.jpg");
image(dfg, random (width),random (height),random (200),random (200));

 PImage gbn;
gbn = loadImage("a6.jpg");
image(gbn, random (width),random (height),random (200),random (200));



 PImage n1;
n1 = loadImage("a9.jpg");
image(n1, random (width),random (height),random (200),random (200));


 PImage na;
na = loadImage("a10.jpg");
image(na, random (width),random (height),random (200),random (200));


 PImage n3;
n3 = loadImage("a11.jpg");
image(n3, random (width),random (height),random (200),random (200));
}
}




