
//making drawing program
void setup(){
size(600,600);
noStroke();
}

void drawFace(){
ellipse(3,56,10,14);
fill(250,224,212);
triangle(3,32,14,38,10,42);
fill(218,217,255);
quad(2,15,4,10,6,13,5,19);
}

void splatShape(){
drawFace();
}

void splatter(){
pushMatrix();
translate(random(-4,4),random(-4,4));
scale(random(0.1,3));
fill(255,random(1,200));
splatShape();
popMatrix();
}

void smallSplat(){
pushMatrix();
translate(random(-30,30), random(-30,30));
scale(random(0.1,0.5));
fill(255,random(1,400));
splatShape();
popMatrix();
}

void bigSplat(){pushMatrix();
translate(random(-30,30), random(-30,30));
scale(random(0.5,1));
rotate(radians(random(0,90)));
fill(255,random(1,30));
ellipse(0,0,20,20);
smallSplat();
smallSplat();
smallSplat();
smallSplat();
popMatrix();
}

void drawBrush(){
splatter();
splatter();
}

void draw(){
if(mousePressed){ 
translate(mouseX,mouseY);
drawBrush();
}else{
//mouse is not pressed
}
}
