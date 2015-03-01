
void setup(){
    int w = 400;
    int h = 400;
    int units = 8;
    int unitW = w/units;
    int unitH = h/units;
    smooth();
    
    size(w,h);
    for (int i=0; i < units; i++) {
        for (int j=0; j < units; j++) {
            //random fills limited by 2nd argument
            fill(random(0,100), random(100,200), random(200,255));
            //nternal rectangles
            for (int k=0;k<4;k++) {
                stroke(55*k);
                strokeWeight(1+k);
                rect(unitW*i+k*5,unitH*j+k*5,unitW-(10*k),unitH-(10*k));
            }
            
        }
    }
    
}

void draw() {
    
}
