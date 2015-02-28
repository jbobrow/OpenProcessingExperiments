
//tiffany dittus
// Over Joyed 
    
 void setup() {
  size(500,500);
  noStroke();
  background(random(255));
}

void draw() {
  //background(random(255));

  noStroke();
  fill(random(255),random(255),random(255), 20);
  ellipse(250, 250, mouseX, mouseY);
  
  noStroke();
  fill(random(255),random(255),random(255),90);
  ellipse(mouseX,mouseY,70,70);



}



               
