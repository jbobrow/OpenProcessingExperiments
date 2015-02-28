
  float r = 0;
  float g = 0;
  float b = 0;
  boolean handup = false;

void setup() {
  size(400,400);
  smooth();
  frameRate(20);
}

void draw() {
  // Background
  background(r,g,b);
  
  // Set Center
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  // Zogg
  // Body
  noStroke();
  fill(#9900CC);
  rect(mouseX,mouseY,20,100);
  
  // Head
  noStroke();
  fill(255);
  ellipse(mouseX,mouseY-30,60,60);
  
  // Mouth
  noStroke();
  fill(0);
  rect(mouseX, mouseY-10,20,1);
  
  // Loop Glasses
  int posX = 16;
  while (posX > 1) {
    noStroke();
    
    if (posX == 16) {
      fill(0);
    }
    else {
      fill(mouseX,posX * 15,mouseY);
    }
    ellipse(mouseX-19,mouseY-30,posX*2,posX*2);
    ellipse(mouseX+19,mouseY-30,posX*2,posX*2);
    posX = posX - 1;
  }
  
  noStroke();
  fill(0);
  rect(mouseX,mouseY-30,6,1);
  
  // Legs
  stroke(255);
  line(mouseX-10,mouseY+50,pmouseX-10,pmouseY+60);
  line(mouseX+10,mouseY+50,pmouseX+10,pmouseY+60);
  
  // Shoes
  noStroke();
  fill(255);
  rect(pmouseX-10,pmouseY+60,8,8);
  rect(pmouseX+10,pmouseY+60,8,8);
  
  if (handup == true) {
    // Handup=true
    // Arms
    stroke(255);
    line(mouseX-10,mouseY+5,pmouseX-20,pmouseY+5);
    line(mouseX+10,mouseY+5,pmouseX+20,pmouseY+5);
    
    // Hands
    noStroke();
    fill(255);
    ellipse(pmouseX-20,pmouseY+5,8,8);
    ellipse(pmouseX+20,pmouseY+5,8,8);
  }
  else {
    // Handup=false
    // Arms
    stroke(255);
    line(mouseX-10,mouseY+5,pmouseX-10,pmouseY+20);
    line(mouseX+10,mouseY+5,pmouseX+10,pmouseY+20);
    
    // Hands
    noStroke();
    fill(255);
    ellipse(pmouseX-10,pmouseY+20,8,8);
    ellipse(pmouseX+10,pmouseY+20,8,8);
  }
}

  void mousePressed() {
    r = random(255);
    g = random(255);
    b = random(255);
    
    if (handup == true) {
      handup=false;
    }
    else {
      handup=true;
    }
    
     println("i can dance with headache!");     
}

