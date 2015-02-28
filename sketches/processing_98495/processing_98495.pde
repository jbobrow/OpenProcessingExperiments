
PImage a;
int r,g,b;
int px;
float py=0;
float oy;
float ox;

void setup() {
size(400,400);
rectMode(CENTER);
a= loadImage("camaleon.png");


}

void draw() {
background(255);

fill(255,0,0);
rect(100,200,30,250);
fill(0,255,0);
rect(130,200,30,250);
fill(0,0,255);
rect(160,200,30,250);
fill(r,g,b);
stroke(r,g,b);
rect(295,180,145,75);
image(a,220,140); // ojos 237a248 y 162a173
fill(140,30,50);
stroke(140,30,50);
ox= map(mouseX,0,400,237,247);
oy= map(mouseY,0,400,162,172);
ellipse(ox,oy,5,5);


fill(r,0,0);
rect(50,350,30,30);
fill(0,g,0);
rect(80,350,30,30);
fill(0,0,b);
rect(110,350,30,30);
fill(255);
stroke(255);
rect(100,r+75,30,5);
rect(130,g+75,30,5);
rect(160,b+75,30,5);
fill(0);
text(r,90,70); //presente en pantalla el valor de r
text(g,120,70);
text(b,150,70);

}

void mousePressed() {
int px= constrain(mouseX, 85, 175);

if(mouseX>85 && mouseX<115) {  r=mouseY-75;}
if(mouseX>115 && mouseX<145) { g=mouseY-75;}
if(mouseX>145 && mouseX<175) { b=mouseY-75;}
if(r>250) {r=250;}
if(g>250) {g=250;}
if(b>250) {b=250;}
}




