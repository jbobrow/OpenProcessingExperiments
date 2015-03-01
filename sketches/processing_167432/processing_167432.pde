
float x;
float y;
float a;
float c;
float r;
float b;
float g;
float q;
float w;
float t;
float u;

void 
setup()
{
size(600,600);
smooth();
background(0);
stroke(255);
line(width/2,0,width/2,height);
line(0,width/2,height,height/2);
frameRate(6);
println("cuadro del demonio, se mete donde no le corresponde.. pero sólo lo hace 1 o 2 veces, creo que es problema de los cuadros pero no sé por qué :("  );

}

void
draw()
{
  
  /* 1-. cìrculos */
  fill(r,g,b);
  stroke(255);
  strokeWeight(width/250);
  ellipse(x,y,a,c);
  x=random(0,width/2-height/40);
  y=random(0,height/2-height/40);
   a=random(0,width/10);
  c=random(0,width/10);
  r=random(100);
  g=random(100);
  b=random(100);
  
  /* 3.- cìrculos */
  stroke(r,g,b);
    r=random(255);
  g=random(10);
  b=random(5);
  strokeWeight(width/200);
  fill(r,g,b);
  r=random(255);
  g=random(100);
  b=random(255);
  ellipse(x,y,a,c);
  x=random(width/2+width/20,width);
  y=random(height/2+width/20,height);
  a=random(0,width/8);
  c=random(0,width/8);

  /* 4.- rectángulo */
  stroke(r,g,b);
  r=random(10);
  g=random(10);
  b=random(255);
  strokeWeight(1);
  fill(r,g,b);
  rect(q,w,a,c);
  q=random(width/2,width);
  w=random(0,height/3+10);
  a=random(0,width/6);
  c=random(0,width/6);
  r=random(100);
  g=random(100);
  b=random(100);
  
    /* 2.- rectángulo */
  stroke(r,g,b);
    r=random(5);
  g=random(200);
  b=random(4);
  strokeWeight(1);
  fill(r,g,b);
  r=random(255);
  g=random(100);
  b=random(255);
  rect(t,u,a,c);
  t=random(0,width/3);
  u=random(width/2,height);
  a=random(0,width/10);
  c=random(0,width/10);
}

void
mousePressed()
{
fill(#B904CE);
rect(0,0,width/2,height/2);
rect(width/2,height/2,width/2,height/2);
}
void
keyPressed()
{
fill(255);
rect(0,height/2,width/2,height/2);
rect(width/2,0,width/2,height/2);
}
