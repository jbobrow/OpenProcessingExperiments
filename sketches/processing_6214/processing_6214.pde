
size(600,300);
background(65,48,86);
int x = 10;
int y = 30;
// met x en y worden coordinaten aangegeven

stroke(255);
// for-functie zorgt voor herhaling
for(int i = 20; i < 600; i += 10){
  line(i,0,i,width);
}

for(int j = 10; j < 600; j += 10){
  line(0,j,width,j);
}


stroke(255);
line(x,0,x,height);
x *= 2;
line(x,0,x,height);
x *= 2;
line(x,0,x,height);
x *= 2;
line(x,0,x,height);
x *= 2;
line(x,0,x,height);
x *= 2;
line(x,0,x,height);
smooth();
ellipse(x, y, 30,60);
noFill();
stroke(0);
ellipse(x,y,100,30);
fill(255,0,0);
ellipse(x,y,20,10);
int a = 40;
int b = 50;
fill(255);
ellipse(a, b, 30,60);
noFill();
stroke(0);
ellipse(a,b,100,30);
fill(255,0,0);
ellipse(a,b,20,10);
int t = 400;
int u = 200;
fill(255,0,0);
rect(t,u,50,50);
fill(188,150,247);
rect(t,u,40,40);
rectMode(CENTER);
fill(255);
rect(t,u,10,10);




