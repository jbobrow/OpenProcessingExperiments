
void setup() {size(300,300);
background(255,255,240);}
void draw() {for(int i=0; i<300; i=i+70)
{frameRate(15);
float s =random(125);
float t =random(125);
float v=random(250);
noStroke();
fill(v,t,i,s);
ellipse(i,v,s,t);
}}
