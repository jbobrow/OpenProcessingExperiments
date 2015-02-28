
float a=0;
float b=0;
int x,y;
void setup(){
size(600,600);
background(0);
}
void draw(){
a=mouseX;b=mouseY;
fill(0,19);
rect(0,0,width,height);
smooth();
stroke(255);
fill(0,50);
stroke(255,226,0);
ellipse(300,300,random(23,233),random(23,233));
pushMatrix();
rotate((19*millis()/1000));
stroke(38,211,45);
strokeWeight(random(0.1,6));
ellipse(300,300,b-450,a-450);
popMatrix();
stroke (247,72,107);
ellipse(300,300,a-500,b-500);
}


