
//season's greeting
//fall,2013,ncku
//HorusWang

float rad; 

void setup() {
  size(600, 700);
}

void draw() {
  background(mouseY, mouseX, (mouseY+mouseX)/2, random(255));
  frameRate(10);
  stroke(255);
  if (mousePressed) {

    textSize(50);
    fill(mouseX, mouseY, (mouseY+mouseX)/3, random(255));
    text("happy new year", 180, 2*height/3);
  }
  else {
    textSize(32);
    fill(mouseX, mouseY, (mouseY+mouseX)/3, 150);
    text("h", mouseX+random(30), mouseY/3+random(30));
    text("a", mouseX+random(30), mouseY/3+random(30));
    text("p", mouseX+random(30), mouseY/3+random(30));
    text("p", mouseX+random(30), mouseY/3+random(30));
    text("y", mouseX+random(30), mouseY/3+random(30));
    text("n", mouseY/2+random(50), height/2);
    text("e", mouseY/2+random(50), height/2);
    text("w", mouseY/2+random(50), height/2);
    text("y", mouseY/2+random(50), height/2);
    text("e", (mouseY+mouseX)/3+random(100), mouseY+random(10));
    text("a", (mouseY+mouseX)/3+random(100), mouseY+random(10));
    text("r", (mouseY+mouseX)/3+random(100), mouseY+random(10));
  }

  float a = (mouseX / (float) width) * 50f;
  rad = radians(a);
  translate(width/2, height);
  line(0, 0, 0, -200);
  translate(0, -200);
  branch(210);
}

void branch(float h ) {  
  h *= 0.67;
  if (h > 2) { 
    pushMatrix();    
    rotate(rad);  
    line(0, 0, 0, -h);  
    translate(0, -h);
    branch(h);      
    popMatrix();   

    pushMatrix();
    rotate(random(-rad));
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
  }
}



