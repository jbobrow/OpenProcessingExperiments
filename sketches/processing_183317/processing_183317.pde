
float ojos=0;
void setup(){
    stroke(250,124,96);
    size (600,600);
}
void draw() {
    ojos=ojos+1,2;
    background(ojos);
    ellipse(ojos,300,280,130);
}
