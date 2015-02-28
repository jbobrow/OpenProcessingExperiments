
void setup(){
  size(500,500);
  smooth();
}
void draw(){
  background(95,128,129);
  translate(250,250);
   for(int i=0; i<50; i++){
    pushMatrix();
    strokeWeight(0.5);
   line(0,0,500,0);
   line(10,10,500,0);
   strokeWeight(1.5);
   line(0,500,0,0);
   line(0,500,10,10);
   strokeWeight(2);
   line(0,0,250,500);
   line(250,500,20,20);
    rotate(radians(36*i));
    strokeWeight(0.5);
    line(0,0,500,0);
    line(10,10,500,0);
    strokeWeight(1.5);
    line(0,500,0,0);
    line(0,500,10,10);
    strokeWeight(2);
   line(0,0,250,500);
   line(250,500,20,20);
    popMatrix();
   }
    noFill();
  stroke(51,64,64);
  strokeWeight(2);
  for(int i=0; i<500; i++){
    rotate(radians(36));
    pushMatrix();
    triangle(0,0,250,250,0,50);
    fill(121,82,107);
    triangle(0,0,245,245,0,45);
    fill(157,8,103);
    triangle(0,0,230,230,0,30); 
    popMatrix();
  }
}
  

