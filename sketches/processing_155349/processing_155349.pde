
void setup() {
    size(800,800);
}

void draw(){
    background(0);
    stroke(255,10);
    strokeWeight(2);
    color(random(0,255));
    noFill();
    
    translate(width/2, height/2); 
    
    for (int r = 0; r < 360; r = r += 2){
    rotate(radians(15));
    quad(30,30-50,100,125,150,150,mouseX-400,mouseY-400);
    }
}
