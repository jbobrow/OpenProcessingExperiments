
public void setup() {
        size(600, 600);
        smooth();
        background(0);
    }

    public void draw() {
        
        if(mousePressed){
        fill(170);
        }else{
        fill(255);
        }
        quad(mouseX,mouseY, 40,40, 70,70, 100,100);
    }
