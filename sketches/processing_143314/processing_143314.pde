
// hye ri lee
//201420101

float angle;

   
void setup()
{
  size(800,600);
  background(#325A7D);
}
   
void draw()
{
  noStroke();
  fill(14,38,124);
  rect(0,0,width,height);
    
  // rotation angle
  angle += 0.002;
  
  // grid
  for (int j1=100; j1<width; j1+=200){
    for (int j2=100; j2<height; j2+=300){
      pushMatrix();
      translate(j1,j2);
      // number of points
      for (int i=0; i<50; i++){
        rotate(angle/1);
        scale(0.95);
        stroke(255);              // white
        strokeWeight(3);
        fill(111,9,131);            // red
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

