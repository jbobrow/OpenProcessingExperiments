
int a = 150;
int b = 210;
int c =380;
int e=257;
int radius=110;

void setup() {
  size( 600, 440);
  smooth();
}

void draw(){
  background(245);

noStroke();


// RECTANGLE
  if ((mouseX >= a) && (mouseX <= a+100) &&
      (mouseY >= b) && (mouseY <= b+120)) {
    fill (51,219,159);
  } else {
    fill(150);
  rect(a,b,120,100);
    }
  if ((mouseX >= a) && (mouseX <= a+100) &&
      (mouseY >= b) && (mouseY <= b+120)) {
  fill(200);
  rect(a,b,120,100);

}
//ELLIPSE

  float d = dist(mouseX,mouseY,c,e);
  if (d<=radius){
    fill(88,182,242);
  } else {
    fill(255);
  }
  if (keyPressed){
  noFill();
    strokeWeight(2);
    stroke(88,182,242);
  } 
  ellipse(c,e,radius,radius);
} 
   

   



