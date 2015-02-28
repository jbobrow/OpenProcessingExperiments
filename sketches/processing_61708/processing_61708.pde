
//import processing.pdf.*;

void setup() {
  size(500, 500);
  //noLoop();
  noStroke();
  smooth();
}

void draw() {
  background(0,0,255);

  //beginRecord(PDF, "rectSketch.pdf");
  

  for (int i=0; i < 27; i++) {
    pushMatrix();

    for (int j=0; j < 27; j++) { 
 // fill(random(255), random(255), random(255));

      pushMatrix();
      rotate(millis() * radians(20) / 1000);
      rect(0, 0, 20, 20);

      popMatrix(); 
      translate(0, 20);
    }

    popMatrix();
    if (i % 2 == 0 ){
      
      fill(255, 20, 147);
    }else{
     fill(255, 69, 0); 
    }
    
    translate(20, 0);
    rect(0, 0, 20, 20); 
    
  }
 // endRecord();
}


