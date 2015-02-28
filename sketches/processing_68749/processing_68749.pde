
import processing.pdf.*;

boolean record;

float angle;

float[] xPos= new float[12];
float[] yPos= new float[12];

void setup() {



  size(800, 800, P3D);


  xPos[0] = 390;  
  yPos[0] = 190;

  xPos[1] = 390;  
  yPos[1] = 610;

  xPos[2] = 610;  
  yPos[2] = 390;

  xPos[3] = 190;  
  yPos[3] = 390;

  xPos[4] = 220;  
  yPos[4] = 290;  

  xPos[5] = 220;  
  yPos[5] = 510;

  xPos[6] = 490;  
  yPos[6] = 220; 

  xPos[7] = 290;  
  yPos[7] = 220;

  xPos[8] = 580;  
  yPos[8] = 290;  

  xPos[9] = 580;  
  yPos[9] = 510;

  xPos[10] = 290;  
  yPos[10] = 580;

  xPos[11] = 490;  
  yPos[11] = 580;
  
  
angle= 0;
}

void draw() {
  
   if (record) {
    beginRaw(PDF, "output.pdf");
  }
     
 background(100);
 
  stroke(0);
  strokeWeight(10);
  line(width/2+20, height/2-20, width/2-20, height/2+20);
  line(width/2-20, height/2-20, width/2+20, height/2+20);

 
  
  angle+=.06;
  for (int i=0; i<12; i++) {
    noStroke();
    smooth();
    fill(255, 100, 0, random(0,255));
    ellipse( xPos[i], yPos[i], 50, 50);
    

   
    //donen sey
    pushMatrix();
    translate(width/2, height/2);
    rotateZ(angle);
    noStroke();
    smooth();
    fill(100);
    ellipse(150, 150, 60, 60);


    popMatrix();

    

 if (record) {
    endRaw();
    record = false;
  }
  }
}

// Hit 'r' to record a single frame
void keyPressed() {
  if (key == 'r') {
    record = true;
  }
}

  

  

