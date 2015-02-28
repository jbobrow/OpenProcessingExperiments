
void setup(){
  size(600, 600);
  background(300);
  noStroke();
}

void splatter(){
  pushMatrix();
  translate(random(-20,20), random(-20, 20));
 scale(random(0.1,2));
  
 
beginShape();
 fill(30,255,255,80);
triangle(10,5,15,10,5,10);
translate(width/2, height/2);
rotate(PI/3.0);
 fill(255,0,0,80);
triangle(6, 8, 10, 20, 15, 8);
 fill(140,250,95,80);
 ellipse(0,0,10,10);

endShape();
popMatrix();
}


void smallSplot(){
    pushMatrix();
  popMatrix();
}

void bigSplot(){
  
  pushMatrix();
  translate(random(-10, 10), random(-10, 10));
  scale(random(0.2,3));
  smallSplot();
smallSplot();
smallSplot();
smallSplot();
smallSplot();
}
void drawBrush(){
splatter();
splatter();
splatter();
splatter();
splatter();
splatter(); 
splatter();
}

void draw() {

  
  if  (mousePressed){
    translate(mouseX, mouseY);
    translate(random(-3, 3), random(-3,3));
    rotate(radians(random(-45,45)));
drawBrush();
} else{

}
}
