
int x = 0; 
int y = 50; 
void setup() {
size(200, 280); 
}
void draw() {
background(255, 255, 255);
fill(0, 126, 255);
ellipse(x-10, y, x+60, y+70); 
fill(84, 0, 255);
ellipse(x-30, y +30, x+60, y+70); 
fill(216, 0, 255);
ellipse(x-50, y, x+60, y+70); 

fill(255, 0, 0);
ellipse(x-10, y+5, x-60, y+40); 
fill(255, 114, 0);
ellipse(x-40, y+90, x-60, y+40); 
fill(255, 192 , 0);
ellipse(x-40, y+180, x-60, y+40); 


x = x + 1; // 
if (x > 400) { 
x = -40; // 
}
}

