
void setup() {
   size(400,300);
   noStroke();
}

void draw() {
   if(mouseX>width/2) fill(255,0,0);
   else             fill(0,0,255);
   ellipse(mouseX,mouseY,10,30);
}
