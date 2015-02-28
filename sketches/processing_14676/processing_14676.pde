
void setup(){
    size(200,200);
    background(255);
    noLoop();
    }

void draw() {
    for(int i=0; i<200; i=i+2){
    line(random(200),0,random(200),200)
    }
}
