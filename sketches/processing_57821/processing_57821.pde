
void setup() {
  size(600, 600); //width, height
  background(15, 30, 60);
  stroke(mouseX/3, mouseY/3, mouseX - mouseY/3);
  noStroke();
  frameRate(800);
  noCursor();
}



void draw() {

  {
  if(mousePressed == true) {
  
  fill(190, 100, 200);
  rect(random(-25,650), random(-25,650),
  random(25,70), random(30,90));
  
  fill(110, 100, 200);
  rect(random(-25,650), random(-25,650),
  random(25,70), random(30,90));
  
  fill(60, 0, 100);
  rect(random(-25,650), random(-25,650),
  random(25,70), random(30,90));
  
  fill(70, 0, 100);
  rect(random(-25,650), random(-25,650),
  random(25,70), random(30,90));
  
  fill(15, 30, 60);
  rect(random(-25,650), random(-25,650),
  random(25,70), random(30,90));
  
  fill(15, 30, 60);
  rect(random(-25,650), random(-25,650),
  random(25,70), random(30,90));
  
  fill(15+mouseX, 30, 60+mouseY/40);
  rect(random(-25,650), random(-25,650),
  random(25,70), random(30,90));
  
  
  fill(0, 0, 0);
  rect(random(-25,650), random(-25,650),
  random(25,70), random(30,90));
  

} else {
 fill(90, 0, 100);
  rect(random(-25,650), random(-25,650),
  random(25,70), random(30,90));
  
  fill(80, 0, 100);
  rect(random(-25,650), random(-25,650),
  random(25,70), random(30,90));
  
  fill(60, 0, 100);
  rect(random(-25,650), random(-25,650),
  random(25,70), random(30,90));
  
  fill(70, 0, 100);
  rect(random(-25,650), random(-25,650),
  random(25,70), random(30,90));
  
  fill(15, 30, 60);
  rect(random(-25,650), random(-25,650),
  random(25,70), random(30,90));
  
  fill(15, 30, 60);
  rect(random(-25,650), random(-25,650),
  random(25,70), random(30,90));
  
  fill(15+mouseX, 30, 60+mouseY/40);
  rect(random(-25,650), random(-25,650),
  random(25,70), random(30,90));
  
  
  fill(0, 0, 0);
  rect(random(-25,650), random(-25,650),
  random(25,70), random(30,90));
  }
}

  beginShape();
  curveVertex(4*mouseX, -40*mouseY); 
  curveVertex(300, 40); 
  curveVertex(8*mouseX, -60);
  curveVertex(300, 100);
  curveVertex(6*mouseX, -120);
  curveVertex(300, 150); 
  curveVertex(5*mouseX, -150); 
  endShape();

  beginShape();
  curveVertex(-4*mouseX, -40*mouseY-40); 
  curveVertex(300, 40); 
  curveVertex(-8*mouseX, -20);
  curveVertex(300, 100);
  curveVertex(-6*mouseX, -80);
  curveVertex(300, 150); 
  curveVertex(-5*mouseX, -110); 
  endShape();

  beginShape();
  curveVertex(4*mouseX, -40*mouseY); 
  curveVertex(300, 40); 
  curveVertex(8*mouseX, -60);
  curveVertex(300, 100);
  curveVertex(6*mouseX, -120);
  curveVertex(300, 150); 
  curveVertex(5*mouseX, -150); 
  endShape();

  beginShape();
  curveVertex(-4*mouseX, -40*mouseY-40); 
  curveVertex(300, 40); 
  curveVertex(-8*mouseX, -20);
  curveVertex(300, 100);
  curveVertex(-6*mouseX, -80);
  curveVertex(300, 150); 
  curveVertex(-5*mouseX, -110); 
  endShape();

}

