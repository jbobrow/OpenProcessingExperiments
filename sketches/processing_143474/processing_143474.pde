
// SOS iDesign
// KU DYNAMIC MEDIA
// kim ye ean
// 201420071

void setup(){
  size(600,600);
  noLoop(); 
  background(#308A8D,50);
}
 
void draw(){
  
  fill(255);
  ellipse(0,0,width,height);
rectMode(CENTER);
 strokeWeight(2);

stroke(0);

 
  for (int i = 10; i < width-9; i = i + 20) {
      for (int j = 10; j < height; j = j + 30){
        strokeWeight(random(10));
        point(i,j);
      }
}
 

}

