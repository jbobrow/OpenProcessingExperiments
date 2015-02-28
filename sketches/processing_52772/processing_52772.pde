
//WOAH

// CLICK AND DRAG SHIT
void setup() {
  size(600, 600);
  background(0);
}

void draw() {
  for (int i=360; i < height; i+=10) {
    stroke(255);  
    if (i < 200) {  
      stroke(10);
    }
    line(30, i, 80, i);
  }
  fill(152, mouseX, 175, mouseY);
  ellipse(200, 300, mouseX+3, mouseY-1);
  ellipse(400, 250, mouseX+3, mouseY-10);
  fill(pmouseX, random(200), 20, pmouseY);
  triangle(mouseX, 20, 300, 60, mouseX/1, mouseY/2);
  line(40, mouseY, mouseX/4, mouseY*81);
  rect(random(800), random(600), 100, 100);
  rect(random(800), random(600), 100, 100);
  vertex(mouseX, mouseY);
  vertex(mouseX+100, mouseY+120);
  vertex(mouseX, mouseY-110);
  
  imageMode(CENTER);           
  ellipse(400, 300, 400, 400);
}


