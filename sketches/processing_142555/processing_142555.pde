

void setup(){
  size (800,600);
  background(255);
}


void draw(){
  
  
pushMatrix(); 
  translate(500, 400);
  rotate(millis()/250.0);
  noFill();
  stroke(255, 75, 100,15);
  rectMode(CENTER);
  rect(mouseX, mouseY, 150, 300, 10);
   
   translate(80, 80);
  noFill();
  rotate(millis()/100.0);
  stroke(60, 255, 10, 30);
  triangle(100, 0, 160, 130, 200, 15);
popMatrix();
resetMatrix();

pushMatrix(); 
   translate(80, 15);
  noFill();
  rotate(millis()/400.0);
  stroke(60, 220, 140, 30);
  triangle(0, 0, 0, 20, 100, 15); 
popMatrix();
resetMatrix();

pushMatrix();  
  translate(300,200);
  stroke(10,200,100,10);
  rotate(millis()/350.0);
  noFill();
  rect(20, 0, 35, 135,5); 
translate ( 50,180);
stroke(10,20,240,30);
rotate(millis()/800.0);
  triangle(50, 20, 50, 100, 150, 80);
popMatrix();
resetMatrix();


}
