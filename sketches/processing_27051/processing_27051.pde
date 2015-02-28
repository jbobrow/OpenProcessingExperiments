
import java.util.Iterator;
import java.util.LinkedList;

import processing.core.*;

public class Bokeh extends PApplet{

    int canvasWidth = 800;
    int canvasHeight = (int)(canvasWidth*9/16);
    
    float centerX = 0, centerY = 0;

    float radius = 45, rotAngle = -90;
    float accelX, accelY;
    float springing = (float) .001, damping = (float) .98;

    //corner nodes
    int nodes = 5;
    float nodeStartX[] = new float[nodes];
    float nodeStartY[] = new float[nodes];
    float[]nodeX = new float[nodes];
    float[]nodeY = new float[nodes];
    float[]angle = new float[nodes];
    float[]frequency = new float[nodes];

    // soft-body dynamics
    float organicConstant = (float) .1;
    
    public void setup(){
        size(canvasWidth,canvasHeight);

          // iniitalize frequencies for corner nodes
          for (int i=0; i<nodes; i++){
            frequency[i] = 5;
          }
    }
    
    LinkedList<Sphere> spList = new LinkedList<Sphere>();
    
    Sphere sp;
    public void draw(){
        background(0);
        smooth();
        frameRate(60);
        if (mousePressed){
            sp = new Sphere(20, mouseX, mouseY);
            spList.addLast(sp);
        }
        if(!spList.isEmpty()){
            for(Iterator<Sphere> i = spList.iterator(); i.hasNext();){
                Sphere tmpSp = (Sphere)i.next();
                tmpSp.move();
                tmpSp.display();
            }
            
        }
            drawShape();
            moveShape();
    }
    
    class Sphere{
        
        float size;
        int X, Y;
        
        Sphere(float tmpSize, int tmpX, int tmpY){
            
            size = tmpSize;
            X = tmpX;
            Y = tmpY;
        }
        
        void display(){
            fill(128);
            noStroke();
            ellipse(X,Y,size,size);
        }
        
        void move(){
            if((int)(canvasWidth/2)>X){
                X = X+1;
            } 
            else {
                X = X-1;
            }

            if((int)(canvasHeight/2)>Y){
                Y = Y+1;
            } 
            else {
                Y = Y-1;
            }
        }
    }
    
    
    void drawShape() {
          //  calculate node  starting locations
          for (int i=0; i<nodes; i++){
            nodeStartX[i] = centerX+cos(radians(rotAngle))*radius;
            nodeStartY[i] = centerY+sin(radians(rotAngle))*radius;
            rotAngle += 360.0/nodes;
          }

          // draw polygon
          curveTightness(organicConstant);
          fill(255);
          beginShape();
          for (int i=0; i<nodes; i++){
            curveVertex(nodeX[i], nodeY[i]);
          }
          for (int i=0; i<nodes-1; i++){
            curveVertex(nodeX[i], nodeY[i]);
          }
          endShape(CLOSE);
        }

        void moveShape() {
          //move center point
          float deltaX = mouseX-centerX;
          float deltaY = mouseY-centerY;

          // create springing effect
          deltaX *= springing;
          deltaY *= springing;
          accelX += deltaX;
          accelY += deltaY;

          // move predator's center
          centerX += accelX;
          centerY += accelY;

          // slow down springing
          accelX *= damping;
          accelY *= damping;

          // change curve tightness
          //organicConstant = 1-((abs(accelX)+abs(accelY))*.1);

          //move nodes
          for (int i=0; i<nodes; i++){
            nodeX[i] = nodeStartX[i]+sin(radians(angle[i]))*(accelX*2);
            nodeY[i] = nodeStartY[i]+sin(radians(angle[i]))*(accelY*2);
            angle[i]+=frequency[i];
          }
        }
}

