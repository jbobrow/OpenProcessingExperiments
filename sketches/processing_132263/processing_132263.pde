
background(0,0,0)
size(600,600);
int i = 0;
while (i < 600) {
  line(1, i, 600, i);
  i = i + 5;}
int e = 0;  
while (e < 600) {
  line(e, 1, e, 600);
  e = e + 5;  }
  int x = 0;
int y = 0;
while (x<height)
while (y<width-100) { 
stroke(250,0,0);
  line(x,y,width/2,height/2); 
x=x+10;
y=y+5; }
int gato = 250;
fill(255,0,0);
ellipse(gato,gato,290,290);
fill(255,133,0);
ellipse(gato,gato,280,280);
fill(255,255,0);
ellipse(gato,gato,270,270);
fill(0,255,0);
ellipse(gato,gato,260,260);
fill(0,255,255);
ellipse(gato,gato,250,250);
fill(0,0,255);
ellipse(gato,gato,240,240);
fill(180,0,255);
ellipse(gato,gato,230,230);
fill(255,0,255);
ellipse(gato,gato,220,220);
no fill();
ellipse(gato,gato,210,210);
