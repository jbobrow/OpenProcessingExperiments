
void setup() {
size(500,500);
background(134,134,134);
rectMode(CENTER);
}

void draw() {
  background(mouseY,mouseY,mouseY);
  fill(255,255,255);
  
  
  pushMatrix();
  translate(height/2, width/2);
  for (int i=1; i < 30; i = i + 1) {
      
      
      rect(200,mouseX-100/2,50,50);
      rotate(radians(30));

  }
  
  popMatrix();
  
      
    pushMatrix();
    translate(height/2, width/2);
    for (int i=1; i < 30; i = i + 1) {
      
      fill(mouseY/2,mouseY/2,mouseY/2);
      //translate(30,200);
      rect(200,mouseY/2+100,i,50);
      rotate(radians(30));   
    }
  
  popMatrix();
  
  
  fill(mouseX,mouseX,mouseX);
  
  pushMatrix();
  translate(0,0);
  ellipse(mouseX,mouseY,30,30);
  popMatrix();

  println(mouseX);

}
