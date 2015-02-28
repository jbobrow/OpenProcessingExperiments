
void setup(){
  size(500,500);
  background(0);
  smooth();
 // stroke(0,0,0,0);
}
void draw(){
  
   noStroke();
  fill(0,0,0,20);
  rect(0,0,width,height);
 //fill(random(0,255), random (0,255), random (0,255),50);
// fill(255);
  //noStroke();
 //stroke(random(0,255), random (0,255), random (0,255),50);
  
  for(int x=0; x < width+5; x += 25){
    for(int y=0;y < height+5; y += 25){
  // ellipse(x,y,10,10);
  for(int r = 5; r < 50; r += 20) {
    ellipse(x,y,r,r);
  }
    }
  }
  
  //if(mousePressed == true){
   noStroke();
  fill(152,240,237,150);
  ellipse(mouseX,mouseY,85,85);
  //stroke(random(0,255), random (0,255), random (0,255),100);
//  stroke(7,77,54,100);
  stroke(random(7,54), random (77,167), random (100,130),100);
  strokeWeight(5);
  noFill();
 for(int r = 5; r < 100; r += 20) {

   ellipse(mouseX,mouseY,r,r);
// }

if(mousePressed == true) {
  stroke(random(0,255), random (0,255), random (0,255),10);
  for(int l = 0; l < height; l += 20) {
     for(int e = 0; e < width; e += 20)

   line(e,l,mouseX,mouseY);
}
  }
  }
}
