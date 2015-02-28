
void setup(){
    size(960, 400);
    colorMode(RGB, 1);
    smooth();
}
 
void draw(){
    background(100);
    float x = 0;
    for (int i = 0; i<width; i+=9){
        stroke(1,.3);
        line(i, 0, i, noise(i*0.04f, frameCount*0.003f)*height);
        fill(1,.6);
        ellipse(i, noise(i*0.01f, frameCount*0.003f)*height, 8, 8);
    }
}
