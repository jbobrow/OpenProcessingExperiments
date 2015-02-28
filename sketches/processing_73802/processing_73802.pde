
float s = 20;
float r = 0;
PImage photo;

void setup() {
  size(400, 400);
  background(255, 105, 180);
  rectMode(CENTER);
  
  noFill();
  stroke(0);
  smooth();
}

void draw() {
  ellipse(mouseX, mouseY, s, s);
    if (mousePressed){
      s++;
    }
  if ((keyPressed == true) && (key == 'b')){
    fill(random(255), random(255), random(255));
    noStroke();
    translate (mouseX, mouseY);
    rotate(r);
    rect(0, 0, 50, 50);
  
    r = r + 0.07;
  }
  if ((keyPressed == true) && (key == 'r')){
    fill(255);
    rect(0,0, 800,800);
  }
  if ((keyPressed == true) && (key == 'c')){
    photo = loadImage("brush.png");
    translate (mouseX, mouseY);
    rotate(r);
    image(photo, 0, 0);    
  }    
}
void mouseReleased() {
  s=20;
}




