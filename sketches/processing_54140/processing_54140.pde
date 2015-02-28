
color c1,c2,c3;
color s;
Float rs,ks,r,g,b,t,l,k,ps;
Float spacer;
PImage boots;
PImage body;
PImage astro;
PImage homer;

void setup()
{
  size(600, 500);
  background(250,0,0);
  smooth();
  spacer = width/10.0;
  frameRate(8);
  float a= random(0,255);
  float b= random(0,255);
  float c=random(0,255);
   background(255,0,0);
  astro=loadImage("astro.png"); 
  boots= loadImage("boots_stiefel.svg.med.png");
  body= loadImage("Vinci.png");
  
  homer= loadImage("homer-simpson.png");
  imageMode(CENTER);
   image(homer,505,250,700,700);
   image(astro,292,300,900,900);
 image(body,100,400,700,700);

  c1=color(255,0,0);
  c2=color (232,209,33);
  c3=color(66,191,203);
  s=color(a,b,c);
}
void draw()
{
 println(frameRate);
  for(int i=100; i<width; i=i+200){
rs= random(20,100);
ps=random(19,100);
ks=random(16,70);
r= random(0,255);
g=random(0,255);
b=random(0,255);
k= random(0,255);
l=random(0,255);
t=random(0,255);
  bot(i,100,rs,color(r,g,b));
   jot(i,390,rs,color(t,l,k));
  }
}

void bot(float x, float y, float s, color c)
{
  pushMatrix();
  fill(c);
  translate(x,y);

  //smiley
  noStroke();
   imageMode(CENTER);
 

   
  quad(-50,-50,50,-50,50,50,-50,50);
  fill(rs,r,g);
  ellipse(0, 0, rs, rs);
  fill(s);
 
  noFill();
 

  popMatrix();
  

}
void jot(float x, float y, float s, color c)
{
  pushMatrix();
  fill(c);
  translate(x,y);

  //smiley
  noStroke();
   imageMode(CENTER);
 

   
  quad(-40,-40,40,-40,40,40,-40,40);
  fill(rs,r,g);
  ellipse(0, 0, ks, ks);
  fill(s);
 
  noFill();
 

  popMatrix();
  

}

