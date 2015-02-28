
void setup() {
    size(500, 500);
    frameRate(20);
}

void draw() {
    background(204); 
    for(int i=0; i < 500; i+=50){
    ellipse(i+50,i+50,20,20);
    }
}

