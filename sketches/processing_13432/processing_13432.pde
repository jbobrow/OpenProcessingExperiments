
//PROJECT OWL EYES

//reference: http://www.openprocessing.org/visuals/?visualID=7187
//reference author: Heather Penn
float easing = 0.35;

void setup() {
  smooth();
  size(640,480);
  background(#937661);
  noCursor();
}

void draw() {

  background(#937661);

  //WHITE FEATHERS
  //L
  noStroke();
  fill(255);
  beginShape();
  vertex(248.05,166.89);
  bezierVertex(249.60,177.062, 246.533,216.898, 195.24,237.85);
  bezierVertex(143.95,258.811, 94.05,219, 105.1,170.26);
  bezierVertex(116.783,118.711, 189.711,119.5, 205.38,122.26);
  bezierVertex(242.106,128.741, 246.533,156.727, 248.05,166.89);
  endShape();
  //R
  beginShape();
  vertex(391.27,166.89);
  bezierVertex(392.783,156.727, 397.211,128.741, 433.94, 122.26);
  bezierVertex(449.605,119.5, 522.533, 118.711, 534.22, 170.26);
  bezierVertex(545.262,219, 495.367,258.811, 444.07,237.85);
  bezierVertex(392.783,216.898, 389.719,177.062, 391.27,166.89);
  endShape();
  
  //FEATHER CUTOUTS
  fill(#937661);
  //L
  quad(122.79,215.38, 126.46,219.69, 101.14,247, 92.05,236.34);
  quad(130.91,223.9, 135.43,227.31, 116.63,259.46, 105.45,251.04);
  quad(140.94,229.63, 146.23,231.67, 137,267.76, 123.93,262.73);
  //R
  quad(513.9,217.7, 517.58,213.38, 548.33,234.35, 539.24,245);
  quad(504.94,225.32, 509.47,221.91, 534.93,249.05, 523.75,257.47);
  quad(494.15,229.67,499.44,227.64, 516.45,260.74, 503.38,265.76);
  
  //BLACK OUTLINES
  //R
  fill(0);
  beginShape();
  vertex(391.01,168.37);
  bezierVertex(390.33,179, 398,214, 445.25,228.35);
  bezierVertex(494,243, 535.33,202.33, 521.4,159);
  bezierVertex(506.33,112.67, 440.67,120.33, 425.95,124.04);
  bezierVertex(393.5,134, 391.5,159, 391.01,168.37);
  endShape();
  //L
  beginShape();
  vertex(247.21, 168.2);
  bezierVertex(248,177.75, 241.5,214, 192.97,228.18);
  bezierVertex(144.66,243, 102.75,202.25, 116.82,158.81);
  bezierVertex(132,113.25, 198.25,120.25, 212.26,123.87);
  bezierVertex(245.25,133, 246.67,158.92, 247.21,168.2);
  endShape();

  //YELLOW IRIS
  //R
  fill(#FFD01F);
  beginShape();
  vertex(397.67, 167.29);
  bezierVertex(397.224,175.37, 402.612,206.348, 444.36,218.92);
  bezierVertex(486.11,231.486, 522.207,196.561, 509.9,159.21);
  bezierVertex(496.883,119.207, 439.817, 125.794, 427.75, 129.13);
  bezierVertex(399.468, 136.96, 398.122,159.167, 397.67,167.29);
  endShape();
  //L
  beginShape();
  vertex(241,166.5);
  bezierVertex(241.44,174.5, 236.05,205.524, 194.3,218.1);
  bezierVertex(152.55,230.66, 116.45,195.74, 128.76, 158.4);
  bezierVertex(141.776,118.88, 198.84,124.97, 210.9,128.3);
  bezierVertex(239.19, 136.14, 240.54,158.4, 241,166.5);
  endShape();

  //PUPIL
  //Does two things: Follow the cursor
  //Dilate (Expand) when mouse movement speed is high


  float trackPRx=map(mouseX, 0,800, 432,482);
  float trackPLx=map(mouseX, 0,800, 160,210);
  float trackPRy=map(mouseY, 0,400, 149,179);
  float trackPLy=map(mouseY, 0,400, 149,179);

  float mouseSpeed = dist(mouseX,mouseY,pmouseX,pmouseY);
  float dilateRatio = map(mouseSpeed, 0,640, -0.4, 1.3);

  //Confused Mode
  if (keyPressed) {
    fill(#FF881F);
    strokeWeight(20);
    stroke(#FF881F);
    ellipse(trackPRx,trackPRy,16,16);        
    ellipse(trackPLx,trackPLy,16,16);
    
    fill(0);
    strokeWeight(6);
    stroke(#1f140b);
    ellipse(trackPRx,trackPRy, 13,13);        
    ellipse(trackPLx,trackPLy,13,13);
    dilateRatio += (dilateRatio * easing);
  }
  else {


    fill(#FF881F);
    strokeWeight(20);
    stroke(#FF881F);
    ellipse(trackPRx,trackPRy,100*dilateRatio,100*dilateRatio);        
    ellipse(trackPLx,trackPLy,100*dilateRatio,100*dilateRatio);


    fill(0);
    strokeWeight(6);
    stroke(#1f140b);
    ellipse(trackPRx,trackPRy,100*dilateRatio,100*dilateRatio);        
    ellipse(trackPLx,trackPLy,100*dilateRatio,100*dilateRatio);
    dilateRatio += (dilateRatio * easing);
  }
  
  

  //EYELIDS
  //mousePressed to become angry eyes
  
    noStroke();
    fill(255, 190);
    ellipse(trackPRx+20,trackPRy+15, 15,15);        
    ellipse(trackPLx+20,trackPLy+15, 15,15);
    

  if (mousePressed || mouseY<140) {

    noStroke();
    float my =constrain(mouseY,150,200);
    fill(#937661);
    quad(50,0,320,0,320,my,50,140);
    quad(590,0,320,0,320,my,590,140);
    
    
  }
  
  fill(0);
  noStroke();
  ellipse(mouseX, mouseY, 2.5,2.5);
  ellipse(mouseX, mouseY+2.5, 2.5, 2.5);
  ellipse(mouseX, mouseY-2.5, 2.5, 2.5);
  ellipse(mouseX+2.5, mouseY, 2.5, 2.5);
  ellipse(mouseX-2.5, mouseY, 2.5, 2.5);
  
  
}


