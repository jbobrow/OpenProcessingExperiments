
void setup() {
  size(500,500);
  background(0);
}

void draw() {
  
  if (mousePressed == true) {
    fill(0);
  } else {
    fill(255);
  }
    noStroke();
    ellipse(250,250,150,150);

    fill(255);
    ellipse(250,250,50,50);
    

  text("Platon avait raison",192,200,500,500);
  }


