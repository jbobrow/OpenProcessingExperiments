
void setup() {
    size(800, 800); 
    colorMode(HSB);
    frameRate(1);
} 
void draw() {
    background(0);
    ellipseMode(CORNER);
    int patternSize = 20;
    
    for(int j = 0; j < height; j++){
        for(int i = 0; i < width; i++){
            fill(j*23, j*10, 255 + i*14);
            ellipse(i*10,j*patternSize, patternSize, 6);
                        
        }
    }
}



