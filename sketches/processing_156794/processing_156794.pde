
void setup() {
    size(500, 500);
} 
void draw() {
    background(0);

       for(int y = 0; y < height; y = y + 50){        
       for(int x = 0; x < width; x = x + 70){            
            fill(x/2, y*10, 200);
            strokeWeight(0);
            ellipse(x, y, mouseX, mouseY);
            
            
        }
    }
}


