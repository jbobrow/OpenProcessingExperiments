
PImage img1; 
PImage img2;
PImage img3;
PImage img4;
PImage img5;

void setup() {

  size(700, 450);

  img1 = loadImage("flower1.jpg");
  img2 = loadImage("flower2.jpg");
  img3 = loadImage("flower3.jpg");
  img4 = loadImage("flower4.jpg");
  img5 = loadImage("flower5.jpg");


  image(img1, 0, 0);
  smooth();
}

int malwerkzeug=1;

void draw() {
  noStroke();
  rectMode(CENTER);  
  float objektgrosse = random(10, 50);

  if (mousePressed) {
    if (malwerkzeug == 1) {


      color bildfarbe = img1.get(mouseX, mouseY);
      fill(bildfarbe);
      ellipse(mouseX, mouseY, objektgrosse, objektgrosse);
    }

    if (malwerkzeug == 2) {
      pushMatrix();
      translate (mouseX, mouseY);
      rotate(random(0, 360));
      color bildfarbe = img1.get(mouseX, mouseY);
      fill(bildfarbe);
      rect(0, 0, objektgrosse, objektgrosse); 
      popMatrix();
    }


    if (malwerkzeug == 3) {
      pushMatrix();
      translate (mouseX, mouseY);
      rotate(random(0, 360));
      color bildfarbe = img1.get(mouseX, mouseY);
      stroke(bildfarbe);
      strokeWeight(10);
      float linienlaenge = random(0, 50);
      line(0, 0, 0+linienlaenge, 0+linienlaenge); 
      popMatrix();
    }
  }


  if (keyPressed) {
    if (key==' ') {
      background(0);
    }
  }
}



void keyPressed() {
  if (key == '1') {
    malwerkzeug = 1 ;
  }

  if (key == '2') {
    malwerkzeug = 2 ;
  }

  if (key == '3') {
    malwerkzeug = 3 ;
  }




  if (key == 'q') {
    img1 = img5 ;
    image(img5, 0, 0);
  }

  if (key == 'w') {
    img1 = img2 ;
    image(img2, 0, 0);
  }

  if (key == 'e') {
    img1 = img3 ;
    image(img3, 0, 0);
  }

  if (key == 'r') {
    img1 = img4 ;
    image(img4, 0, 0);
  }
}


