
int counter;

void setup() { 
  size(400, 250);
  background(0,255,0); 
}

void draw() {  
if(mousePressed == true){
 snowman(mouseX, mouseY);
}
}

void snowman(int x, int y) {
ellipse(x,y,30,30);
ellipse(x,y+35,40,40);
ellipse(x,y+80,50,50);
ellipse(x-6,y,2,2);
ellipse(x+6,y,2,2);
triangle(x,y+2,x,y+6,x-8,y+5);
}
