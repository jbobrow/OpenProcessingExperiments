
Int xMove = 0;
void setup(){
size(500,500)
}
void draw() {
background(0);
stroke(1);
fill(150);
rect(xMove,250,165,253,134,145,145,145);
rect(xMove,100,120,200,120,100,150,200,100);
ellipse(xMove,50,200,50,200,100,100);
xMove = xMove + 5;
xMove = (xMove + 1)%500; }


