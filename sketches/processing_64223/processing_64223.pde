
import processing.opengl.*;

   public void setup(){
        size(400, 400, OPENGL);
        smooth();
        frameRate(30);
    }
 
    public void draw(){
        background(0);
        translate(200, 200);
        rotateX(frameCount * 0.01f);
        rotateY(frameCount * 0.01f);
        rotateZ(frameCount * 0.01f);
        fill(255, 0, 0);
        box(150);
    }
