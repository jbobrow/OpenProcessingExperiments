
int x;
int y=99;
void setup(){
size(500,500);
frameRate(999);
b = loadImage("jp.jpg");
}
PImage b;

void draw(){
background(0);
fill(random(0,255),random(0,255),random(0,255));
x=(x+20)%400;
translate(width/2, height/2);
rotate(radians(x));
text("I love...",-180,-80);
image(b,40,-70);
rect(-26,-26,50,48);
b = loadImage("jp.jpg");
image(b,-80,30);
image(b,-80,-180);
image(b,-200,-70);
text("I love...",-70,-190);
text("I love...",69,-80);
text("I love...",-50,30);

}


