
//try abs vs random
//lin wenyu

void setup() {
  size(500, 500);
  background(0, 0, 0);
  smooth();
}

void draw() {
//background(0, 0, 0);

  strokeWeight(2); 
  
    if (mousePressed){
    stroke(mouseX/2,mouseY/2,(mouseX+400)/2,50);
  } else {
    //stroke(mouseX/2,mouseY/2,(mouseX+400)/2,0);
    stroke(mouseX-abs(random(100)),mouseY-abs(random(100)),abs(random(255)));
  }
  
  //if (mousePressed) {
    //stroke(mouseX-random(50),mouseY-random(50), 120,50);//fill(150,250,120,50);
  //} 
 // else {
    //stroke(mouseX+random(50), mouseY+random(50), 0,50);//fill(255,210,0,50);
 // }
    
  float centerX = mouseX/3;
  float centerY = mouseY/2;
  
 //ellipse(mouseX,mouseY,50,50);

  line(mouseX, mouseY, centerX+70, centerY+70);
  line(centerX+70,centerY+70,mouseX, mouseY);

  //fill(255);
  //ellipse(centerX, centerY, 50, 50);
  
  }

void keyPressed() {
  saveFrame (" screen-####.jpg");
}


