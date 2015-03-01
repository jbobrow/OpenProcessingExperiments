
boolean inflag=false;
int firstX,firstY;
float angleXtoRotate=0,angleYtoRotate=0,oldXAngle=0,oldYAngle=0;



void setup(){
        size(600,600,OPENGL);
        background(0);
        frameRate(100);
        fill(0,255,0);
        //noFill();
        noStroke();
        stroke(0,0,0);
        strokeWeight(5);
        
}



void draw(){
  
    background(0);
    translate(width/2,height/2,0);
    rotateY(oldYAngle+angleYtoRotate);
    rotateX(oldXAngle+angleXtoRotate);
    
    

    beginShape();
      vertex(-50, -35, 100);
      vertex(50, -35, 100);
      vertex(50, 35, 100);
      vertex(-50, 35, 100);
    endShape(CLOSE);

    beginShape();
      vertex(-50, -35, -100);
      vertex(50, -35, -100);
      vertex(50, 35, -100);
      vertex(-50, 35, -100);
    endShape(CLOSE);

    beginShape();
      vertex(-50, -35, 100);
      vertex(-50, -35, -100);
      vertex(50, -35, -100);
      vertex(50, -35, 100);
    endShape(CLOSE);

    beginShape();
      vertex(-50, 35, 100);
      vertex(-50, 35, -100);
      vertex(50, 35, -100);
      vertex(50, 35, 100);
    endShape(CLOSE);

    beginShape();
      vertex(-50, -35, 100);
      vertex(-50, -35, -100);
      vertex(-50, 35, -100);
      vertex(-50, 35, 100);
    endShape(CLOSE);

    beginShape();
      vertex(50, -35, 100);
      vertex(50, -35, -100);
      vertex(50, 35, -100);
      vertex(50, 35, 100);
    endShape(CLOSE);

    //arrow head
    beginShape();
      vertex(-100, -35, -100);
      vertex(100, -35, -100);
      vertex(100, 35, -100);
      vertex(-100, 35, -100);
     endShape(CLOSE);

     beginShape();
      vertex(-100, -35, -100);
      vertex(100, -35, -100);
      vertex(0, -35, -180);
     endShape(CLOSE);

     beginShape(); 
         vertex(-100, 35, -100);
      vertex(100, 35, -100);
      vertex(0, 35, -180);
     endShape(CLOSE);

     beginShape();
      vertex(-100, -35, -100);
      vertex(0, -35, -180);
      vertex(0, 35, -180);
      vertex(-100, 35, -100);
     endShape(CLOSE);

     beginShape();
      vertex(+100, -35, -100);
      vertex(0, -35, -180);
      vertex(0, 35, -180);
      vertex(+100, 35, -100);
     endShape(CLOSE);
  
}



public void mouseDragged(){
        if(!inflag){ //just entered dragging mode
          inflag=true;
          firstX=mouseX; //save coordinates starting point
          firstY=mouseY;
        }
        //in any case, calculate distance from starting point, and scale it to a proportional angle rotation
        angleYtoRotate=(PI*(mouseX-firstX)/width);
        angleXtoRotate=-1*(PI*(mouseY-firstY)/height);

}

public void mouseReleased(){
      inflag=false;
      oldYAngle+=angleYtoRotate;
      oldXAngle+=angleXtoRotate;
      angleXtoRotate=0;
      angleYtoRotate=0;
    }
