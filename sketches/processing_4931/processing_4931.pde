
//
// interaction affected data
float armPadding = 2.0; // distance between arm segments
float segmentWid = 20;
float startDist = 10; // distance arms start from body
float mouseDist;


//
// fixed values
int armNum = 5;
int segmentCount = 12;

//
// code-affected values
float armsAxis = .6;
float armsFlux = 0;
boolean armsDrawn = false;

//
// data holders
float[] armRads = new float[armNum*segmentCount];



void setup() {
  
    size(480, 320);  
    background(255); 
    smooth();
    
    stroke(0);
    fill(255, 0);
    
}


void draw() {
    //
    background(255);
    
    
    translate(width/2, height/2);
    //
    mouseDist = (abs(mouseX-(width/2))+abs(mouseY-(height/2)))/2;
    
    armPadding += (5-(mouseDist/15)-armPadding)*.1;
    startDist = 3-mouseDist/15;
    segmentWid = 20-mouseDist/22;
    println(armPadding);
    
    
    noStroke();
    fill(0);
    drawArm();
   
    stroke(0);
    fill(255-mouseDist*2);
    drawBody();
    
    
    

}

void drawArm() {

    float armWid; 
    
    int k, i;
   
    // radian value increases for SIN modulation on arm segments   
    armsFlux += .1;
    
    for (k=0; k<armNum; k++) {
        pushMatrix();
        
        // rotate all arms
        armsAxis += .002;
        
        // rotate to each
        rotate((2*PI)/armNum*k+armsAxis);
        
        float startRad = 0;
        float radThreshhold = PI/2;
        float radChange = PI/(6+(random(-100, 100)/100));
        float currentRad = 0;
        int radDirection = 1;
        
        // chance for arm curvature to flip
        if (!armsDrawn) {
           if (random(2) > 1) {
               radDirection *= -1;
           } 
        }
        
        
        translate(startDist, 0);
         
        for (i=0; i<segmentCount; i++) {
          
             float thisRad;
             int radIndex = k*segmentCount+i;
             
             if (armsDrawn) {
               thisRad = armRads[radIndex]*(1+sin(armsFlux+(PI/2*k+armsAxis))/50);
             } else {
               thisRad = (radChange*(i+6)/segmentCount)*radDirection;
             }

             armRads[radIndex] = thisRad;
             currentRad += thisRad;
             armWid = segmentWid - (i*1.5);
             
             translate(armWid+armPadding, 0);
             rotate(thisRad);
             
             if (currentRad > radThreshhold) {
                  radDirection *= -1; 
             }
            
             ellipse(0, 0, armWid, armWid);
             
        }
        popMatrix();
    }
    
    if (!armsDrawn) {
       armsDrawn = true; 
    }
    
    
}


void drawBody() {
    //
    strokeWeight(3);
    //
    
    pushMatrix();
    
    rotate(armsFlux/10);
   
    float eye1x = 3;
    float eye1y = -16;
   
    float eye2x = 12;
    float eye2y = 9;
   
    float eye3x = -18;
    float eye3y = 7;
   
    float rad1 = 28;
    float rad2 = 25;
    float rad3 = 34;
   
    float eyeCenterX = (eye1x + eye2x + eye3x)/3;
    float eyeCenterY = (eye1y + eye2y + eye3y)/3;
   
    ellipse(eye1x, eye1y, rad1, rad1); 
    ellipse(eye2x, eye2y, rad2, rad2); 
    ellipse(eye3x, eye3y, rad3, rad3);
    
    ellipse(eye1x, eye1y, 3, 3);
    ellipse(eye2x, eye2y, 3, 3);
    ellipse(eye3x, eye3y, 3, 3);
    
    ellipse(eyeCenterX, eyeCenterY, 3, 3); 
    
    popMatrix();
}



