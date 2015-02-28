
void setup() {
    size(500,500); 
} 

int diameter = 0; 
int x = 0;
int y = 0;
int speed = 5;
void draw() { 
 background(255, 0, 0);
 ellipse(mouseX, y, 10, 10);  
     x = x + speed;
     y = y + speed;
 if ( y > height || y < 0) {
    speed = speed * -1;
 }
 }
