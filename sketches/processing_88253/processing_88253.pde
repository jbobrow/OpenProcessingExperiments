
int s=150;
//palette "Bubbleberry" by DennisBrady68
Void setup(){
color[] palette = {#E82222, #917F83, #B82DFF, #D5E887, #879AE0};


size(800,300);
rectMode(CENTER);
frameRate(50);
background(255);}


Void draw(){

noStroke();
for (int i=0; i<100; i++;) {
fill(palette[int(random(5))],200);
s=random(50)+10;
rect(random(700)+50,random(200)+50,s,s,s*.3);
}
