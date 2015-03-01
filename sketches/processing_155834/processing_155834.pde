

void setup() {
  size(1000, 1000);
  frameRate(5);
}

void draw() {

  //  float yyy = (mouseX+mouseY);
  //  randomSeed(2);
  //  float xxx = (mouseX-mouseY)/yyy;
  background(255);
  //fill(xxx*random(255), random(255), random(255));
  randomSeed(mouseX + mouseY);  

  float r = random(255);
  float g = random(255);
  float b = random(255);
fill(random(250));
  ellipse(width/1.9, height/3, 830, 830);
fill(random(200));
  ellipse(width/2, height/3.2, 670, 670);
fill(random(150));
  ellipse(width/2.4, height/3.4, 420, 420);
fill(random(100));
  ellipse(width/2.7, height/3.7, 230, 230);
fill(random(10));
  ellipse(width/3, height/4, 100, 100);
  
  fill(255);
  //rect(150, 120, 200, 350, 30);
  rect(mouseX, mouseY, 200, 350, 30);
  fill(random(255), random(255), random(255));
  ellipse(mouseX+100, mouseY+12, 7, 7);
  
  fill(r, g, b);
  rect(mouseX+10, mouseY+40, 180, 270, 5);
  fill(255);
  ellipse(mouseX+100, mouseY+330, 25, 25);
  rect(mouseX+95, mouseY+325, 10, 10, 2);
  fill(0);
  rect(mouseX+86, mouseY+23, 28, 3, 5);
}



