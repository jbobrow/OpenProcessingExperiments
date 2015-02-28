
void setup() {
background(248);
 size(500, 500);
 frameRate(2);
}
 
void draw() {
  
  noFill();
 strokeWeight(.1);
 stroke(0,30);
  for(int x = 20; x <= width - 20; x += 20) {
    for(int y = 20; y <= height - 20; y +=20) {
       noFill();
       strokeWeight(.1);
       stroke(0,20);
      line(x, y, mouseX, mouseY);
       strokeWeight(2);
       stroke(255,0,0,1);
       ellipse(mouseX,mouseY,5,5);
       
    }
  }
}
