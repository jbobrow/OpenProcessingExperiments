
//week 2 assingment 6a
//exercise 5-8 from the book

boolean move = false;

int circleX = 0; 
int circleY = 100; 

void setup() { 
size(200,200); 
} 

void draw() { 
background(100); 
stroke(255); 
fill(0); 
ellipse(circleX,circleY,50,50); 

if (move) {             //if the circle should move, these lines make it do so.
circleX = circleX + 2
circleY = circleY + 1
}

} 

void mousePressed() { //if the mouse if pressed, it turns the move variable on or off.
move = !move
}
