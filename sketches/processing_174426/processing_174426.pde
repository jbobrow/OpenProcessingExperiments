
int counter;

void setup() {  //setup function called initially, only once
  size(500, 300);
  background(255,0,0);  //set background white
 
}

void draw() {
if(mousePressed == true) {
snowNerd(mouseX, mouseY);
}
 
}

void snowNerd(int x, int y) {
fill(255);
ellipse(x,y,50,50);
ellipse(x,y+62,75,75);
ellipse(x,y+144,90,90);
fill(0,0,0);
ellipse(x-7,y-3,5,5);
fill(0,0,0);
ellipse(x+7,y-3,5,5);
fill(255,145,0);
triangle(x+3,y,x-3,y,x,y+10);
}
