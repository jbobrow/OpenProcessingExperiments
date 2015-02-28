
float randomDiameter = 0; 
 float strokeGray = random(255);    
 
 
void setup() {
  size(1200,600);
  background(250,200,33);
  frameRate(10);
}
void draw() {
  
  smooth();
  stroke(strokeGray,strokeGray,strokeGray);
  strokeWeight(3);
  fill(random(255),random(255),random(255));
  
  if (randomDiameter <100){
  randomDiameter++;
  }
  else{
    randomDiameter=0;
  }
  
  ellipse(mouseX, mouseY, randomDiameter, randomDiameter );

  fill(random(255), random(255), random(255), random(255));
  beginShape(TRIANGLE_STRIP);
  vertex(random(0, 1200), random(0, 600));
  vertex(random(0, 800), random(0, 600));
  vertex(random(0, 800), random(0, 200));
  vertex(random(0, 800), random(0, 400));
  vertex(random(0, 1200), random(0, 600));
  vertex(random(0, 800), random(0, 600));
  vertex(random(0, 800), random(0, 600));
  vertex(random(0, 1200), random(0, 100));
  ellipse (mouseX, mouseY, mouseX, mouseY);

strokeWeight(10);
stroke(26,189,216);
beginShape(POINTS);
vertex(mouseX, 20);
vertex(mouseX, mouseY);
vertex(200, 0);
vertex(0, mouseY);
endShape();

}

void mouseClicked() {
  
  if(strokeGray == 0){  
  strokeGray = 255;
  }
  else{          
  strokeGray = 0;
  } 
}

void keyPressed(){
  if(key =='s') {
    save("AlexaRoberts.png");
  }
}
