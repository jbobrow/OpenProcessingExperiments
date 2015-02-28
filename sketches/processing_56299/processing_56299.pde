
void setup(){
  int i;
int u;
i=10;
u=10;
size(500,400);
smooth();
}
void draw(){
background(0);
//cara;
fill(250,0,0);
ellipse(mouseX,mouseY,100,150);
//labios;
fill(250,0,50);
rect(mouseX-30,mouseY+20,60,10);
fill(250,0,50);
rect(mouseX-20,mouseY+30,40,10);
fill(250,0,50);
//nariz;
ellipse(mouseX,mouseY,20,20);
//ojos;
fill(250,0,50);
ellipse(mouseX+30,mouseY-20,40,50);
fill(250);
ellipse(mouseX+30,mouseY-20,40,40);
fill(0);
ellipse(mouseX+30,mouseY-20,20,20);
fill(250,0,50);
ellipse(mouseX-30,mouseY-20,40,50);
fill(250);
ellipse(mouseX-30,mouseY-20,40,40);
fill(0);
ellipse(mouseX-30,mouseY-20,20,20);
if (mousePressed == true) {
  int i;
int u;
i=10;
u=10;
while (u<width){
fill (random(250),random(0),random(100));
while(i<height){
ellipse(u,i,10,10);
i=i+10;
}
i=10;
u=u+10;
}
//cara;
fill(250,0,0);
ellipse(mouseX,mouseY,100,150);
  fill(250,0,50);
ellipse(mouseX+30,mouseY-20,40,50);
fill(250,0,50);
ellipse(mouseX-30,mouseY-20,40,50);
fill(250,0,50);
rect(mouseX-30,mouseY+20,60,10);
fill(0);
rect(mouseX-20,mouseY+30,40,20);
fill(250,0,50);
rect(mouseX-20,mouseY+50,40,10);
ellipse(mouseX,mouseY,20,20);
  } 
}
