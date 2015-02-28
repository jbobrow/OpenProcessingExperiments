
PImage img, back;
ArrayList dots;
boolean flip;

void setup() {
  size(600, 600);
  background(255);
  imageMode(CENTER);

  img = loadImage("test2.png");
  back = loadImage("back.png");

  dots = new ArrayList();
  dots.add(new PVector(700, 700));
  flip = true;
}

void draw() {  
  //background(255);
  tint(255, 255); 
  image(back, height / 2, width / 2);
  tint(0, 255); 
  if (flip == true) {
    image(img, mouseX, mouseY);
  }
  for (int i = 0; i < dots.size(); i++) {
    fill(125);
    stroke(125);
    PVector temp = (PVector) dots.get(i);
    ellipse(temp.x, temp.y, 5, 5);
  }
}


void mouseDragged() {
  dots.add(new PVector(mouseX, mouseY));
}

void keyPressed() {
  if (key == 'a') {
    if (flip == true) {
      flip = false;
    }
    else {
      flip = true;
    }
  }
  if (key == 'c') {
    dots.clear();
  }
}


