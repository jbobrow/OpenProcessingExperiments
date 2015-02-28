
// KU DYNAMIC MEDIA
// CHOI In Seo
//201420113
 

 
void setup(){
  size(600,600);
  background(0);
//  noLoop();
}
 
void draw(){
  noStroke();
  fill(599.25,220.9,0); 
  rect(0,0,width,height);
  rectMode(CENTER);
for (int i = 75; i < width-25; i = i + 50) {
    for (int j = 75; j < height-25; j = j + 50) {
      stroke(255);
      strokeWeight(20);
      noFill();
      rectMode(CENTER);
      rect(i,j,10,10);
      fill(0);
      rect(i,j,20,20);
      fill(0);
      ellipse(i,j,30,30);
     }
  }
   

  }
