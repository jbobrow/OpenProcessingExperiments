
int diameter = 5;

void setup() {
size(200, 200);
background(13,129,250);
frameRate(10);
noStroke();
fill(19,13,250);
}

int a = 0;
int b = 0;
int c= 0;
int d=0;
int e=0;
int f=0;
int g=0;
int h=0;
int i=0;
int j=0;

int diameter2 = 5;
void draw() {
  stroke(120,135,165);
  ellipse(200,200,diameter,diameter);
diameter = diameter + 2;
   ellipse(0,0,diameter2,diameter2);
diameter2 = diameter2 + 2;
  
stroke(136,135,165);
rect(a++,0, 20, 20);
rect(b++,180,20,20);
rect(0,c++,20,20);
rect(180,d++,20,20);

stroke(97,93,242);
rect(100,e++,10,10);
rect(120,f++,10,10);
rect(80,g++,10,10);
stroke(28,27,72);
rect(h++,100,10,10);
rect(i++,120,10,10);
rect(j++,80,10,10);
}


