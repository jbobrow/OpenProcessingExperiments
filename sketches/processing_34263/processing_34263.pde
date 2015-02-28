
void setup() {
size(600, 400);
 frameRate(1);
 }

float z=random (200);

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
image(img, random (width),random (height),z,z);

 PImage g;
g = loadImage("a1.jpg");
image(g, random (width),random (height),z,z);

 PImage z1;
z1 = loadImage("a3.jpg");
image(z1, random (width),random (height),z,z);

 PImage dfg;
dfg = loadImage("a5.jpg");
image(dfg, random (width),random (height),z,z);

 PImage gbn;
gbn = loadImage("a6.jpg");
image(gbn, random (width),random (height),z,z);



 PImage n1;
n1 = loadImage("a9.jpg");
image(n1, random (width),random (height),z,z);


 PImage na;
na = loadImage("a10.jpg");
image(na, random (width),random (height),z,z);


 PImage n3;
n3 = loadImage("a11.jpg");
image(n3, random (width),random (height),z,z);
}
}




