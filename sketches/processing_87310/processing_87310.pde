
void setup() {
size (400,400);

}



void draw() {
translate (width/2,height/2);
background (255);
scale(mouseX/width*5+1);
ellipse(0,0,25,50);
ellipse(0,0,50,50);
ellipse(0,0,50,25);
ellipse(0,0,25,25);
}
