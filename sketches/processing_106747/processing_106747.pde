
float x=50.0,y=30.0,dx=3.0,dy=6.0,count=1.0;

void setup() {
size (500,500);
println("Initialise");
}

void draw() {
background(255,255,255); //set background
fill (0,0,0);
rect (225,200,50,100);

fill (random(255),random(255),random(255));
ellipse(x,y,20.0,20.0);

x += dx;
y += dy;

if (x > 500.0 || x < 0.0) {
    dx=-dx;
}

if (y > 500.0 || y < 0.0) {
    dy=-dy; 
}

if (((x=215.0)&&(y>209.0&&y<291.0))) dx=-dx; //left wall rebound
if (((x=285.0)&&(y>209.0&&y<291.0))) dx=-dx; //right wall rebound
if (((x>224.0&&x<276.0)&&(y=210.0))) dy=-dy; //top wall rebound
if (((x>224.0&&x<276.0)&&(y=310.0))) dy=-dy; //bottom wall rebound

if (keyPressed) {
    fill(0,0,0);

    if (key=='d') dx += 1.0;
    else if (key=='w') dy+= 1.0;
    else if (key=='a') dx-= 1.0;
    else if (key=='s') dy-= 1.0;
    
    println("Velocity of ball in x- and y-plane is " + dx + " and " + dy + " respectively.");
}
/*
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
