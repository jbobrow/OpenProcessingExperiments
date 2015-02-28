
void setup(){
  size(1000,400);
  background(5,33,93);}
  
void draw()
{background(5,33,93);
noCursor();
noStroke();
fill(174,180,171);
ellipse(mouseX,mouseY,120,20);// Base da nave
ellipse(mouseX,mouseY-10,60,30); // Cupula da Nave
fill(255);
ellipse(mouseX,mouseY-10,8,8);
ellipse(mouseX-10,mouseY-10,8,8);
ellipse(mouseX+10,mouseY-10,8,8);
ellipse(mouseX-20,mouseY-10,8,8);
ellipse(mouseX+20,mouseY-10,8,8);

if (mousePressed){
fill(70,245,2,200);
quad(mouseX-10,mouseY,mouseX+10,mouseY,mouseX+50,400,mouseX-50,400);
}

noStroke();
fill(129,83,52);
quad(600,320,600,50,800,50,800,320); // predio

fill(241,252,115);

int x;
int y;
for (y=70; y<570; y=y+15)
for (x=611; x<790; x=x+15)
rect (x,y,10,10);


stroke(0);
fill(50);
quad(-10,320,1000,320,1000,410,-10,410); // ASFALTO
fill(211,4,18);


}
