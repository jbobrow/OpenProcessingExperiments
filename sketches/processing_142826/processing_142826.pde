
// David Mrugala
  
float angle=4;
  
void setup(){
  size(600,600);
  background(255);
  colorMode(HSB, width);
}
  
void draw(){
  noStroke();
  fill(0,100);
  rect(0,0,width,height);
  
  // rotation angle
  angle += 0.01;
  
  // move coordinate origin to center of sketch window
  translate(width/2,height/2);
  scale(0.2);
  // number of scaled lines, and rect
  for (int i=0; i<width; i+=40){
    for (int j=0; j<height; j+=40){
    rotate(-angle/100);
    
    pushMatrix();
    stroke(600,300);    // white 
    strokeWeight(i/60); 
    fill(0);            // black
    translate(i,j);     // create 'origins' at grid coordinates
    rotate(angle*5);
    scale(0.95);
    line(0,0,600,600);  // lines-fan
    noStroke();
    rect(0,0,20,20);
    rect(600,600,20,20); 
      pushMatrix();
      for (int k=0; k<width; k+=40){
        noStroke();
        fill(i,600,600);
        translate(600,600);
        rotate(-angle/1);
        scale(0.95);
        rect(500,100,20,20);
      }
      popMatrix();     
    popMatrix();
    }
  }
}
