
float xpos, ypos;

void setup() {
  size(500,500);
  xpos = width/2;
 ypos = height/2;
  smooth();
  rectMode(CENTER);
}
void draw() {
  background(255);
  
  for(int i =0; i <=width; i+=50){
    for(int j=0; j<=height; j+=50) {
  
  pushMatrix();
  float angle = atan2(mouseY-j, mouseX-i); // y first. x later.
 translate(i, j);
 rotate(angle);
 
 fill(50,50);
 strokeWeight(2);
 stroke(100,100);
 rect(0,0, 150,80);
popMatrix(); 
    }
  }
}

