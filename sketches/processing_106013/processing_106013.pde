
float x;
float y;
float posX;


void setup() {
  size(700, 700);
  x=100;
  y=height/2;
}

void draw() {
  background(255);

  //Body
  fill(0);
  ellipse (mouseX, mouseY, 80, 80);

  //Eyes
  fill(255);
  rect(mouseX-15, mouseY-8, 10, 10);
  rect(mouseX+10, mouseY-8, 10, 10);

  //Mouth

  stroke(0);
  fill(255);
  ellipse(mouseX+10, mouseY+20, 10, 10); // Constant mouth
  if (mousePressed == true) {
    // Help from Yehang!
    
    fill (random(255), random(255), random(255)); //Spitting mouth
    ellipse(posX, mouseY+20, 10, 10);
    posX+=75;
  }
  else {
    posX=mouseX+10; // Mouth comes back therefore allowing it for multiple spits
  }
}
