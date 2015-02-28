
float posX =20;
float posY =20;
float xSpeed = 2;
float ySpeed = 5;
float x = 20;
float y = 20;
int arrayX = 30;
int arrayY = 30;
//PImage b;

void setup() {
size(600, 900);
//b = loadImage("background.jpg");
smooth();

}


float mx[] = new float[arrayX];
float my[] = new float[arrayY];

void draw() {
background(#00CEFF);

for (int i=1; i<mx.length; i++) {
mx[i-1] = mx[i];
my[i-1] = my[i];
}

mx[30-1] = x;
my[30-1] = y;

x = x + xSpeed;
y = y + ySpeed; 


if(y > height-(30/2) || y < (30/2)) {
ySpeed *= -1;



}

if(x > width-(30/2) || x < (30/2)) {

xSpeed *= -1;


}


for (int i=0;i< mx.length; i++) {
//draw rect
noStroke();

if(mousePressed) {
noStroke();
fill(i+200, i+20, 0, 1+5*i);
}

else {
noStroke();

fill(0, 2*i+160, 0, 1+5*i);
}
ellipse(mx[i], my[i], i*2, i*2);
strokeWeight(1);
stroke(random(180, 255), 25);
float mapa = map(i, 0, mx.length, 0, width);

}
}


void mouseDragged() {
mx[30-1] = mouseX;
my[30-1] = mouseY;

}

void mouseReleased() {

x = mouseX;
y = mouseY;

draw();

}


void keyPressed () {
if (key == 'z'){
xSpeed = xSpeed * 1.2;
ySpeed = ySpeed * 1.2;
}

if (key == 'x') {
xSpeed = xSpeed / 1.2;
ySpeed = ySpeed / 1.2;
}



}

