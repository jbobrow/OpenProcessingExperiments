
int counter;
int i;

void setup() {  //setup function called initially, only once
  size(500, 500);
  background(204, 102, 0);  //set background "fall-y" color
  
  counter = 0;
}

void draw() {  

  line(mouseX, 20, mouseX, 80);
  
  line(20, mouseY, 80, mouseY);

  
 for (int i=5; i < height; i+=5) {

  stroke(255);  

  if(i < 470) {  

    stroke(0);  
    strokeWeight(2);

  }

  line(30, i, 80, i);
  fill(0);
  ellipse(270,275,450,320);
  
  fill(random(255),50,random(50),175);
  triangle(165, 225, 190, 175, 215, 225);
  
  fill(random(255),100,random(50),204);
  triangle(300, 225, 325, 175, 350, 225);
  
  fill(random(255),100,random(100),204);
  quad(232, 280, 258, 260, 283, 273, 300, 296);
  
  fill(random(255),100,random(100),204);
  rect(210, 335, 130, 20);

}
  }
