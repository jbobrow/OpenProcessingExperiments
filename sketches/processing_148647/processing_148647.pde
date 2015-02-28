
int square = 0 ;
int counter = 50;
void setup(){
size (400, 400);
background (255);
} 
void draw(){
ellipse(mouseX,mouseY, counter,75);
}
if (mousePressed == true) {
counter =counter + 1;
rect (100, 100, square, square);
square = square+2
}

