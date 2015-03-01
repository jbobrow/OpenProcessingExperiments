
/*
Author: Ulina
This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.

*/
void setup() {
    size(600, 440);
    smooth();
    background(0);
}

void draw() {
    for(int y=0; y <= height; y+=10){
        for(int x=0; x <= width; x+=10) {
            fill(126);
            ellipse(x,y,40,40);
        }
    }
    fill(123,8,240);
    ellipse(150,150,100,100);
}
