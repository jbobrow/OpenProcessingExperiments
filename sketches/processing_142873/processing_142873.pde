
// SOS iDesign
// KU DYNAMIC MEDIA
// David Mrugala
  
float angle;
  
void setup()
{
  size(800,600);
  background(#325A7D);
}
  
void draw()
{
  noStroke();
  fill(#325A7D,75);
  rect(0,0,width,height);
   
  // rotation angle
  angle += 0.002;
 
  // grid
  for (int j1=100; j1<width; j1+=200){
    for (int j2=100; j2<height; j2+=200){ 
      pushMatrix(); 
      translate(j1,j2);
      // number of points
      for (int i=0; i<50; i++){
        rotate(angle/2);
        scale(0.95);
        stroke(255);              // white 
        strokeWeight(5);
        fill(255,i,0);            // red
        ellipse(300,0,23,23);     // ellipse
      }
      popMatrix();
    }
  }
}

void mousePressed(){
  noLoop();
}
void mouseReleased(){
  loop();
}
