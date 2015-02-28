
PImage img;
PImage img2;
int flag = 0;

void setup() {
  size(450, 450);
  background(255);
  tint(0);
  img = loadImage("apple_white.png");

  img2 = loadImage("gya-_06.png");
  image(img, 300, 150);
}


void draw() {
  background(255);
  image(img, 90, 70);
}

void mousePressed() {
  tint(225, 0, 0);
}

void mouseReleased() {
  tint(0);
}
void mouseDragged() {

  for (int x = 0; x <= width; x +=60) {
    for (int y = 0; y <= width; y += 50) {
      image(img2, x, y);
    }
  }

 
  image(img, 90, 70);
  fill(0, 255, 0);
  noStroke();    
  ellipse(200, 200, 50, 50); 

  fill(0, 255, 0);   
  ellipse(250, 200, 50, 50); 

  fill(0, 255, 0);
  ellipse(300, 200, 50, 50); 

  fill(255, 0, 0);
  triangle(200, 200, 155, 220, 200, 220);
   strokeWeight(4);
  stroke(0);
  line(180, 190, 200, 190);

}



