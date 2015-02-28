
//Assignment#2  Super Lollip

int x=80;  
int y=80;
int radius=50;
int rectwidth=10;

size(400,400);
smooth();
noStroke();
background(255);

//stamen
fill(#F75C2F);
ellipse(100,100,80,80);
ellipse(width-100,100,80,80);

//neck
fill (100,134,200);
rect (95,140,rectwidth,rectwidth+300);
rect (295,140,rectwidth,rectwidth+300);
