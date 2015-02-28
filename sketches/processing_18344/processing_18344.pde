
void setup(){ 
size(300,300);

}

void draw(){

background(0);
smooth();
stroke(255);
int x = 120;
fill(255,0,0);
ellipse(x,100,50,50);
fill(248,252,31);
rect(x+50,180,60,100);
fill(0,0,245);
triangle(x*2,200,30,20,100,150);
fill(0,255,0);
beginShape();
vertex(width-x,height-x);
vertex(100,200);
vertex(50,140);
vertex(170,50);
vertex(130,120);
vertex(230,80);
endShape();
fill(224,101,7);
ellipse(x/2,250,200,30);
fill(191,10,158);
rect(mouseX,mouseY,20,20);
rect(mouseX+0.25*mouseX,mouseY+0.25*mouseY,20,20);
}


