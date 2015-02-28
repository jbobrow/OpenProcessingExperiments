
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: KIM Hyun Gi
// ID: hyungi216

float angle=4;
   
void setup(){
  size(600,600);
  background(255);
  colorMode(RGB);
}
   
void draw(){
  noStroke();
  fill(255,100);
  rect(0,0,width/1,height/2);
   
  // rotation angle
  angle += 0.008;
   
  // move coordinate origin to center of sketch window
  translate(width/2,height/2);
  scale(0.1);
  // number of scaled lines, and rect
  for (int i=0; i<width; i+=40){
    for (int j=0; j<height; j+=40){
    rotate(+angle/400);
     
    pushMatrix();
    stroke(255,100,255);   
    strokeWeight(i/90);
    fill(0, 190, 255);            // black
    translate(i,j);     // create 'origins' at grid coordinates
    rotate(angle*3);
    scale(1.65);
    stroke(0, 220, 255);
    line(100,0,200,100);  // lines-fan
    noStroke();
    rect(0,0,20,20);
    fill(0, 226, 255);
    rect(600,600,100,200);
      pushMatrix();
      for (int k=0; k<width; k+=40){
        noStroke();
        fill(i,600,600);
        translate(600,600);
        rotate(-angle/1);
        scale(0.95);
        rect(600,100,20,20);
      }
      popMatrix();    
    popMatrix();
    }
  }
}
