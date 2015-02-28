
//Info: http://processingjs.org/reference
void setup() {
    size(540, 100);
    background(255);
}
void draw() {
        
    noStroke();  
    colorMode(HSB);
    fill(second()/60.*255,millis()/1000. * 255,255);
    ellipse(mouseX, mouseY, 30, 30);
    //line(pmouseX,pmouseY,mouseX,mouseY);
  }
