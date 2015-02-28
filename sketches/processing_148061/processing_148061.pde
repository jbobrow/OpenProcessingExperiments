
final int groundLoc = 500;//the ground; original 500

int startStrWeight = 20;
int resetWeight = startStrWeight;

String isAntlerPlanted = "blah";

void setup() {  //setup function called initially, only once

    size(800,600);//original: size( 800, 600) 
    background(255);
    smooth();
    fill(0, 153,0);//green
    rect(0, groundLoc, 800, groundLoc);
    stroke(102,51,0);//brown
    
    strokeWeight(startStrWeight);
    
}

void draw() {

    /*if(keyPressed == true) {//only use this for antler tree
    
        if(key == 'a' ) {//must press a, then click on screen
      
          isAntlerPlanted = "antler";
          plantAntlerTree();
          
        }
    }*/
    
    
    
    if(mousePressed == true) {
       
        /*translate(mouseX, groundLoc );//goal move origin to startpoint
        growFractalTree(10, 100, startStrWeight);//these two lines must be called together!*/
        
        translate(mouseX, groundLoc);
        growFanTree(8,100,startStrWeight, 2);
       
        /*if( isAntlerPlanted.equals("antler") ) {//special case..used in conjunction w/ keypressed first
      
            growAntlerTree();
        }*/
    
    }

}

void growFractalTree(int brLv, float len, int strWeight) {//base other trees on this tree

    //brLv should be <= 10!
    if(brLv == 0 ) {
    
        return;
    }
    
    
    
    if( brLv <= 6 && brLv % 2 == 0 ) {
    
        stroke(51,102,0);//grow green branches
    
    }
    
    if( brLv <= 6 && brLv % 2 != 0 ) {
    
        stroke(153,0,51);//grow red branches
    
    }
    
    
    //point(0,0);
    
    line(0, 0, 0, -len);//draw from ground upwards; use neg val after translation
    translate(0,-len);//move origin to endpoint of line
    strokeWeight(strWeight * .6);
    
    pushMatrix();
    
    rotate(-QUARTER_PI);//rotate counter clockwise
    //line(0,0, 0, -len/2);//don't draw line!
    
    growFractalTree(brLv - 1, len * .75, strWeight * .6);
    
    popMatrix();
    
    pushMatrix();
    rotate(QUARTER_PI);//rotate clockwise
   
    growFractalTree(brLv - 1, len * .75, strWeight * .6);
    
    popMatrix();
    
    startStrWeight = resetWeight;//start reset sequence
    stroke(102,51,0);//brown
    strokeWeight(startStrWeight);
    
   

}

void growFanTree(int brLv, float len, int strWeight, int modRotate) {
    
    //brLv should be <= 8!
    if(brLv == 0 ) {
    
        return;
    }
    
    if(brLv <= 4) {
    
        stroke(204,0,0);//make red
    
    }
    
    //point(0,0);
    
    line(0, 0, 0, -len);//draw from ground upwards; use neg val after translation
    translate(0,-len);//move origin to endpoint of line
    strokeWeight(strWeight * .6);
    
    pushMatrix();
    
    rotate(-HALF_PI/modRotate);//rotate counter clockwise
    //line(0,0, 0, -len/2);//don't draw line!
    
    growFanTree(brLv - 1, len * .75, strWeight * .6, modRotate * 2);
    
    popMatrix();
    
    pushMatrix();
    rotate(HALF_PI/modRotate);//rotate clockwise
   
    growFanTree(brLv - 1, len * .75, strWeight * .6, modRotate * 2);
    
    popMatrix();
    
    pushMatrix();
    rotate(-QUARTER_PI/modRotate);
    growFanTree(brLv - 1, len * .75, strWeight * .6, modRotate * 2);
    
    popMatrix();
    
    pushMatrix();
    rotate(QUARTER_PI/modRotate);
    growFanTree(brLv - 1, len * .75, strWeight * .6, modRotate * 2);
    
    popMatrix();
    
    startStrWeight = resetWeight;//start reset sequence
    stroke(102,51,0);//brown
    strokeWeight(startStrWeight);


}

PVector endPt;//for antler tree
int distance = 100;//for antler tree
 
void plantAntlerTree() {
 
    
   strokeWeight(10);
   stroke(102, 51, 0);
   endPty = groundLoc - distance;
   line(mouseX, groundLoc , mouseX, endPty );//change back to mouseX's later
   endPt = new PVector(mouseX, endPty);
   
}
 
void growAntlerTree() {
 
    float endPtXForLeft = endPt.x;
    float endPtyForLeft = endPt.y;
    int distForLeft = distance;//temp variables
     
    line(endPt.x, endPt.y, endPt.x + distance/2 , endPt.y - distance/2 );//can this really work?![branch right]
    endPt.x = endPt.x + distance/2;
    endPt.y = endPt.y - distance/2;
     
    line(endPt.x, endPt.y, endPt.x + distance/2, endPt.y );
    line(endPt.x, endPt.y, endPt.x , endPt.y - distance/2);
     
     
    line(endPtXForLeft, endPtyForLeft, endPtXForLeft - distForLeft/2 , endPtyForLeft - distForLeft/2 );//can this really work?![branch left]
    endPtXForLeft = endPtXForLeft - distForLeft/2;
    endPtyForLeft = endPtyForLeft - distForLeft/2;
     
     
     
      
}


