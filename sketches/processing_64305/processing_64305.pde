
public void setup() {
        size(400,400);
        smooth();
        frameRate(30);
        background(0);
    }
    
    public void draw() {
        fill(0,10);
        rect(0, 0, width, height);
        if(mousePressed){
            fill(255);
            rect (mouseX, mouseY, pmouseX-mouseX, pmouseY-mouseY);
        }
    }
