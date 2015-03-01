
int counter;
int red = 0;
int green = 255;
int white = 0;

void setup() {  //setup function called initially, only once
    size(500, 500);
    background(255);  //set background white
}

void draw() {  //draw function loops 
    fill(red, 0, 0)
    ellipse(100, 100, 100, 100)
    red += 1
    
    fill (0, green, 0)
    rect(200, 200, 100, 100)
    green -= 1
    
    fill (white, 255)
    triangle(400, 445, 428, 390, 456, 445);
    white += 1
}
