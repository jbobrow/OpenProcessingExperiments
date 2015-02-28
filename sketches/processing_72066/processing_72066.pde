
//Assignment 01b - The Hand
//Quresh Tyebji 
//9.12.12
//Section B

boolean boolGrowing = true;

void setup() {

  size(1200, 600);
  background (0, 100, 0);
}

void draw () {

  

stroke(200,200,0);
strokeWeight(3);
int randomBlue = 50;
randomBlue = int(random (200));
fill(0,50,randomBlue);
beginShape();
vertex(3000, 2000);
bezierVertex(200, 0, 80, 75, 30, 750);
bezierVertex(20, 80, 600, 80, 70, 20);
endShape();

noStroke();

  fill(150,20);
  rect (300,200,500,200); 

fill(0,20);
float randomDiameter = 20;
int growingDiameter = 50;
rect(mouseX,mouseY,growingDiameter, growingDiameter);


stroke(0,200,0);
strokeWeight(1);
int randomPurple = 0;
randomPurple = int(random (200));
fill(randomPurple,0,randomPurple);

triangle (1140, mouseY, mouseX, 300, 1100, mouseY);

//light blue mult
  for (int i=0; i<250; i++) {
    strokeWeight(1);
    stroke(0, i*5, i*20);
    line(i*20, i*10, i*5, i*13);

  }
  
  

}

void mouseClicked() {
  float a = random(255);
  float b = random(200);
  float c = random(255);
  background (a,b,c);


}


void keyPressed() {
  if (key == 's') {
    save("QureshTyebji.png");
  }
}
