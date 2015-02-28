
void setup() {
 size(500, 500);
 smooth();
}
 
void draw() {
 if(mousePressed == true){
    blurredLine(pmouseX, pmouseY, mouseX, mouseY);
 }
}
 
void blurredLine(float x1, float y1, float x2, float y2) {
 for(int i = 0 ; i < 4 ; i++){
   stroke(0, random(255));
   strokeWeight(random(0, 1));
   line(x1+i*0.8, y1+i*0.8, x2+i*0.8, y2+i*0.8);
 }
}


