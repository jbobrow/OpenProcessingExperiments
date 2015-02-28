
void setup() {
size(600, 400);
 frameRate(1);
 
}
 
void draw() {
PImage df;
df = loadImage("c111.jpg");
background(df);
PFont font; 
font = loadFont("Andalus-48.vlw"); 
textFont(font); 
fill(255);
textSize(30);
textAlign(CENTER);
text("Visualisation gender issues in  ", 300,125); 
textSize(50);
text("Diego Velazquez", 292,180);
text("paintings", 315,220);
textSize(30);
text("by Radoslaw Bomba", 310,260);
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




