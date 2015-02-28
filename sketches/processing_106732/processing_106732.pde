
int x=50,y=30,dx=3,dy=6,count=1;

void setup() {
size (500,500);
}

void draw() {
background(255,255,255); //set background
fill (0,0,0);
rect (225,200,50,100);

fill (random(255),random(255),random(255));
ellipse(x,y,20,20);

x += dx;
y += dy;

if (x > 500 || x < 0) {
    dx=-dx;
}

if (y > 500 || y < 0) {
    dy=-dy; 
}

if (((x>225&&x<275)&&(y>200&&y<300))) 
dy=random(5);
dx=random(5);

/*
if (keyPressed) {
    fill(0,255,0);

    if (key=='d') dx=1;
    else if (key=='w') dy=-1;
    else if (key=='a') dx=-1;
    else if (key=='s') dy=1;
    
}
else {
    fill (255,0,0);
    dx=0;
    dy=0;
}

x += dx;
y += dy;
*/
}
