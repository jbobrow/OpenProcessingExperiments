
int x = 0;
int y = 0;


void setup() {
size(500,500);
background(0,70,150);
noStroke();

smooth();
}
//rain

void draw (){
background(0,70,150);
fill(0,120,200);
ellipse(20,y,20,20);
x++;
y+=1;

ellipse(60,y,20,20);
x++;
y-=1;

ellipse(80,y,20,20);
x++;
y+=1;

ellipse(100,y,20,20);
x++;
y-=1;

ellipse(120,y,20,20);
x++;
y+=1;

ellipse(180,y,20,20);
x++;
y-=1;

ellipse(200,y,20,20);
x++;
y+=1;
}

