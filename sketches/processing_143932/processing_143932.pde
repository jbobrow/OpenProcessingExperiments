
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name:Lee hyejin
// ID:hye-jin



float angle=4;
   
void setup(){
  size(600,600);
  background(95);
  colorMode(HSB, width);
}
   
void draw(){
  noStroke();
  fill(0,100);
  rect(0,0,width,height);
   
  
  angle += 0.01;
   
 
  translate(width/2,height/2);
  scale(0.9);
  
  for (int i=0; i<width; i+=40){
    for (int j=0; j<height; j+=40){
    rotate(-angle/100);
     
    pushMatrix();
    stroke(400,300);    
    strokeWeight(i/60);
    fill(200);            
    
    line(0,0,600,600); 
    noStroke();
    rect(0,0,20,20);
    rect(600,600,20,20);
      pushMatrix();
      for (int k=0; k<width; k+=40){
        noStroke();
        fill(i,200,600);
        translate(125,400);
        rotate(-angle/1);
        scale(0.95);
        rect(500,100,20,20);
      }
      popMatrix();    
    popMatrix();
    }
  }
}
 
