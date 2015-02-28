
// SOS iDesign
// KU DYNAMIC MEDIA
// Eunjin Park
 
 
void setup(){
  size(600,600);
  background(255);
//  noLoop();
}
 
void draw(){
  noStroke();
  fill(255); 
  ellipse(600,600,width,height);
   
  for (int i = 0; i-20 < width-1; i = i + 40) {
    for (int j = 0; j-20 < height-1; j = j + 40) {
      stroke(0);
      strokeWeight(20);
      ellipse(i,j,20,20);
     }
  }
   

}

