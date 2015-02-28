
int i = 000; 

void setup() {
    size(800, 450); 
    background(255);
    smooth();
    strokeWeight(15);
    frameRate(160);
} 
void draw() {
    stroke(random(50), random(255), random(255), 20);
    
    int imax = width *2 + height *2;
    
    if (i < width){ line(i, 0, random(0, width), height); }
    else if (i < width + height){ line(i, i-width, 0, random(0, height)); }
    else if (i < width*2 + height){ line(width*2+height - i, height, random(0, width), 0); }
    else if (i < imax){ line(0, imax - i, width, random(0, height)); }
    
    
    if (i < imax) {
        i++;
    } else {
        i = 0; 
    }
}
