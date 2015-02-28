
import processing.opengl.*;


    public void setup(){
        size(400, 400, OPENGL);
        smooth();
        frameRate(30);
    }
 
    public void draw(){
        background(0);
        translate(200, 200, -500);
        fill(255,0,0);

        rotateX(frameCount * 0.01f);
        rotateY(frameCount * 0.02f);
        rotateZ(frameCount * 0.03f);

        for(int i=0; i<5; i++){
            for(int j=0; j<5; j++){
                for(int k=0; k<5; k++){
                    box(25);
                    translate(30, 0, 0);
                }
                translate(-150, 30, 0);
            }
            translate(0, -150, 30);
        }
    }
