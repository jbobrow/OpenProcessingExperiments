
float x,y,vx, vy;
void setup(){
size(600,600, P2D);
background(50,10,10);
}
void draw(){
 
stroke(20,30,40,50);
vx = (mouseX - x)/10;
vy = (mouseY - y)/200;
x = x + vx;
y = y + vy;
fill(x,50,200);
ellipse(y,x,150,150);
fill(100,x,00);  
ellipse (x,y,150,150);
fill(250,200,x);
rect(x,x,50,50);
}

void keyPressed() {
  save("1.jpg");
}

