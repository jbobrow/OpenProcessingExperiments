
import java.awt.*;
    
    Point [] p = new Point[100];
    int count = 0;
    int currSize = 0;
    
    void setup() {
        size(500,500);
    }
    
    void draw() {
        background(255,255,255);        
        fill(255,255,255);        
        for (int i=0; i<currSize; i++) {
            rect(p[i].x, p[i].y, 10, 10);
        }
        rect(mouseX, mouseY, 10,10);     
        
        if (count != 0) {
            if (mouseX == p[count-1].x && mouseY == p[count-1].y) { return; }  
        }             
        p[count] = new Point(mouseX, mouseY);
        count++;
        if (currSize < 100) {
            currSize++;
        }
        if (count >= 100) { 
            count=0;
            currSize=100;
        }             
    }
        
    void mousePressed() {
        Circle c = new Circle(mouseX, mouseY);
    }
    
class Circle {
    int sizew, sizeh;
    int x, y;
    int count = 0;
    
    Circle(int clickx, int clicky) {
       noSmooth();
       strokeWeight(1);
       registerDraw(this);
       sizew = 10;
       sizeh = 10;
       x = clickx;
       y = clicky;
    }
    
    void draw() {
        noFill();
        ellipse(x,y,sizew,sizeh);
        sizew ++;
        sizeh ++;
        if (sizew > 100) sizew = 0;
        if (sizeh > 100) sizeh = 0;
    }
}
