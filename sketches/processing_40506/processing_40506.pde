
size(500,500);

PFont eames = loadFont("EamesCenturyModern-Bold-48.vlw");
  
PImage music;
music = loadImage("french.music.jpg");
int g = music.width/4;
int h = music.height/4;
image(music,-70,-10,g*2,h*2);  

PImage french;
french = loadImage("french.music.jpg");
int c = french.width/4;
int d = french.height/4;
image(french,random(350),random(350),c/1,d/1);

PImage lady;
lady = loadImage("victorian.lady.jpg");
tint(100,100,100,240);
image(lady,10,30,100,160);
noTint();

PImage spices;
spices = loadImage("spices.jpg");
int a = spices.width/4;
int b = spices.height/4;
image(spices,random(300),random(300),a/1,b/1);

PImage pc3;
pc3 = loadImage("post.card.3.jpg");
int s = pc3.width/4;
int t = pc3.height/4;
image(pc3,300,60,100,400);

PImage pcc;
pcc = loadImage("p.c.c.jpg");
image(pcc,110,105,300,40);


PImage pc2;
pc2 = loadImage("post.card.clip.jpg");
int q = pc2.width/4;
int r = pc2.height/4;
image(pc2,200,200,q/1,r/1);

PImage pc4;
pc4 = loadImage("post.card.4.jpg");
int u = pc4.width/4;
int v = pc4.height/4;
image(pc4,120,130,250,320);

PImage pc;
pc = loadImage("post.card.clip.jpg");
int m = pc.width/4;
int n = pc.height/4;
image(pc,45,300,m/1,n/1);


PImage bird;
bird = loadImage("birdcage.png");
image(bird,70,85,300,400);

textFont(eames);
textSize(40);
fill(20);
text("dadadadadada", 350, 470);



