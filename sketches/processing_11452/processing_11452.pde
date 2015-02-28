
void setup()
{
  size(300,600);
background(0);
int a = 0;
int b = 50;
int c = 100;
int d = 150;
int e = 200;
int f = 250;
int g = 300;
int h = 350;
int i = 400;
int j = 450;
int k = 500;
int l = 550;
noStroke(); //rect
fill(e,a,b); //rr
rect(e,a,c,b);
fill(b,e, a); //rv
rect(c,b,c,b);
fill(a,b,e); //ra
rect(a,c,c,b);
fill(e,a,b); //rr
rect(c,d,c,b);
fill(b,e, a); //rv
rect(e,e,c,b);
fill(a,b,e); //ra
rect(c,f,c,b);
fill(e,a,b); //rr
rect(a,g,c,b);
fill(b,e,a); //rv
rect(c,h,c,b);
fill(a,b,e); //ra
rect(e,i,c,b);
fill(e,a,b); //rr
rect(c,j,c,b);
fill(b,e, a); //rv
rect(a,k,c,b);
fill(a,b,e); //ra
rect(c,l,c,b);
  frameRate(300);
  fill(250,0,200);
  stroke(255,20,100);
  strokeWeight(15);
}

void draw()
{
  line(pmouseX, pmouseY, mouseX, mouseY);
  int y = 20;
  ellipse(mouseX, mouseY,y,y);
}

void mouseClicked(){
//al clickear dibuja un cuadrado
rectMode(CENTER);
fill(100,10,200);
noStroke();
rect(mouseX, mouseY, 30, 30);
}

void keyPressed(){
//al apretar una tecla, se borra lo dibujado y cambia el color

background(0);
int a = 0;
int b = 50;
int c = 100;
int d = 150;
int e = 200;
int f = 250;
int g = 300;
int h = 350;
int i = 400;
int j = 450;
int k = 500;
int l = 550;
noStroke(); //rect
fill(e,a,b); //rr
rect(e,a,c,b);
fill(b,e, a); //rv
rect(c,b,c,b);
fill(a,b,e); //ra
rect(a,c,c,b);
fill(e,a,b); //rr
rect(c,d,c,b);
fill(b,e, a); //rv
rect(e,e,c,b);
fill(a,b,e); //ra
rect(c,f,c,b);
fill(e,a,b); //rr
rect(a,g,c,b);
fill(b,e,a); //rv
rect(c,h,c,b);
fill(a,b,e); //ra
rect(e,i,c,b);
fill(e,a,b); //rr
rect(c,j,c,b);
fill(b,e, a); //rv
rect(a,k,c,b);
fill(a,b,e); //ra
rect(c,l,c,b);

  frameRate(300);
  fill(250,0,200);
  stroke(150,20,100);
  strokeWeight(15);
}

