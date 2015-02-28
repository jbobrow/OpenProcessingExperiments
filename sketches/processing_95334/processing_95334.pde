
void setup(){
    size(500, 500);
}
int frame = 0;

void draw() {
    background(200);
    frame = frame + 1;
    
    for( int i = 0; i < 500; i ++) {
    
        stroke( i / 2);
        float angle = (frame + i) * PI * 0.01;
        
        line (i, i, width * cos(angle), height * sin(angle));
        
    }
        
}
