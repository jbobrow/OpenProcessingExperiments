
float x,y;
float velx,vely;
float acel;

void setup() {
size(450,450);
x = width/2;
y = height/2;
    velx = random(-5,5);
    vely = random(-5,-5);
    
    acel = .5;
}

void keyPressed() {
x = width/2;
y = height/2;
    velx = random(-5,5);
    vely = random(-5,5);
}

void draw() {
x += velx;
y += vely;
if (mousePressed){
float acelx,acely;
float dirAcel = atan2(mouseY-y,mouseX-x);
velx += acel*cos(dirAcel);
vely += acel*sin(dirAcel);
}
ellipse(x,y,30,30);
}
