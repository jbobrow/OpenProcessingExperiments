
int x = 0; 
int y = 0; 


void setup() {  // this is run once.   
    size(800, 300); 
    smooth();
    frameRate(30);
    strokeWeight(12);
    noFill();
} 

void draw() {  // this is run repeatedly.  
    stroke(random(50), random(255), random(255), 100);
    ellipse(x, noise(y) * height, 30, 30);

    // move over a pixel
    y = (y <= height) ? y+=1.9 : y = .0;
    x = (x < width) ? x+=30 : x = 0;
}
