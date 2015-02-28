
float y=1;
float e=1;

void setup(){frameRate(30);
size(1000,1000);

background(240);}

void draw() {

beginShape();
noStroke();
curveVertex(sin(e)*1000+mouseX,mouseY);
curveVertex(cos(e)*300+mouseX,500);
curveVertex(tan(e)*30+mouseX,mouseY);
curveVertex(tan(e)*30+mouseX,mouseY);

endShape();
e=e+random(20);

if(mouseY<500) {fill(0,0,0,random(100));
}
if(mouseY>500) {fill(random(200)+100,1,1,random(100)+100);

}}
