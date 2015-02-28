
int counter;

void setup() {  //setup function called initially, only once
size(480, 120);
 }

void draw() {  //draw function loops 
smooth();
line(0, 0, width, height); // Line from (0,0) to (480, 120)
line(0, height, width, 0);
ellipse(width/2, height/2, 60, 60);
}

void onMousePress() {
ellipse( width/ pMouse, height/2, 60,60);
}
