
int diam = 50;
 
void setup () {
  size(300, 500);
  smooth();
  background(255);
  frameRate(25);
}
 
void draw() {
  float a = map(mouseX, 0, 500, 125, 180);
  float b = map(mouseX, 0, 500, 325, 380);
  float c = map(mouseY, 0, 500, 125, 180);
 
  if (mousePressed == false) {
 
 
    //CenterMode
    ellipseMode(CENTER);
 
    //Frog Body
    stroke(0);
    strokeWeight(10);
    fill(101, 234, 99);
    ellipse(250, 450, 350, 650);
    noStroke();
    fill(255);
    ellipse(250, 450, 250, 400);
 
 
    //Frog Eye - Left
    stroke(0);
    strokeWeight(10);
    fill(255);
    ellipse(150, 150, 120, 120);
 
    //Left Pupil
    fill(0);
    ellipse(a, c, diam, diam);
 
    //Frog Eye - Right
    stroke(0);
    strokeWeight(10);
    fill(255);
    ellipse(350, 150, 120, 120);
 
    //Right Pupil
    fill(0);
    ellipse(b, c, diam, diam);
 
    //Frog mouth
    line(230, 230, 270, 230);
  }
 
  else {
    //Left Eye
    diam=50;
    stroke(0);
    strokeWeight(10);
    fill(255);
    ellipse(150, 150, 120, 120);
    line(120, 120, 180, 180);
    line(120, 180, 180, 120);
 
    //Right Eye
    diam=50;
    stroke(0);
    strokeWeight(10);
    fill(255);
    ellipse(350, 150, 120, 120);
    line(320, 120, 380, 180);
    line(320, 180, 380, 120);
  }
}
