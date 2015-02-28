
float x;
float y;
//float radius;
float spdX, spdY;
float w, h;
float gravity;
float damping;
float wind;
float friction;
float[] line1, line2, line3, line4;
int tumbleCount = 50;



void setup() {
  size (600, 600);
  smooth ();
  x= 0;
  y = 600-w;
  w = 50;  
  h = 50;
  //radius = 50;
  spdX = 5.0;
  gravity = .002;
  damping = .05;
  wind  = 0;
  friction = .99;
  spdY= 0.55;

  line1 = new float[tumbleCount];
  line2 = new float[tumbleCount];
  line3 = new float[tumbleCount];
  line4 = new float[tumbleCount];

  for (int i = 0; i < tumbleCount; i++) {
    line1[i] = random(-30, 30);
    line2[i] = random(-30, 30);
    line3[i] = random(-30, 30);
    line4[i] = random(-30, 30);
  }
}

void draw () {

  background (120, 170, 247);

  //clouds 
  noStroke();
  fill (255);
  ellipse (70, 70, 120, 100);
  ellipse (120, 120, 100, 100);
  ellipse (140, 70, 100, 100);

  ellipse (200, 200, 110, 100);
  ellipse (230, 240, 120, 105);
  ellipse (250, 190, 120, 100);
  
    ellipse (350, 100, 100, 100);
  ellipse (380, 140, 120, 100);
  ellipse (410, 80, 105, 105);

    ellipse (500, 200, 100, 100);
  ellipse (540, 260, 150, 100);
  ellipse (580, 205, 100, 100);

  ellipse (580, 55, 160, 100);
  
    ellipse (50, 305, 200, 70);
      ellipse (10, 275, 100, 100);
      
          ellipse (370, 305, 200, 70);
      ellipse (400, 275, 100, 100);


  fill (255, 250, 205);
  rect (0, 400, 600, 600);

  //saloon
  stroke(206, 96, 31);
  fill (152, 84, 20);
  rect (40, 310, 250, 150);
  fill (206, 96, 31);
  rect (95, 310, 1, 150);
  rect (230, 310, 1, 150);
  rect (85, 310, 1, 150);
  rect (240, 310, 1, 150);
  noFill();
  rect (130, 450, 70, 10);
  rect (140, 440, 50, 10);
  rect (150, 430, 30, 10);
  rect (150, 400, 30, 40);
  
  stroke (255);
  rect (110, 330, 110, 50);
  fill(255);
  PFont font;
  font = createFont("Mesquite Std", 55); 
  textFont(font); 
  text("Saloon", 122, 335, 125, 70);


  //cacti 
  fill (44, 227, 66);
  noStroke();
  ellipse (500, 460, 50, 100);
  ellipse (500, 450, 100, 20);
  ellipse (420, 430, 50, 100);
  ellipse (420, 420, 100, 20);
  ellipse (560, 400, 50, 100);
  ellipse (560, 390, 100, 20);

  //tumbleweed
  fill (139, 119, 101);
  pushMatrix();
  translate(x, y);
  rotate(radians(x));
  // ellipse(0, 0, w, h);

  stroke(185, 180, 85);

  for (int i = 0; i < tumbleCount; i++) {
    line (line1[i], line2[i], line3[i], line4[i]);
  }

  popMatrix();

  x += spdX;
  spdX += -wind;
  spdY += gravity;
  y += spdY;

  if (x > width-w) {
    spdX *= -1;
    spdY *= damping;
  }

  if (x < 0) {
    spdX *= -1;
  }

  if (y > height-h) {
    y = height - h;
    spdY *= -1;
    spdY *= damping;
    spdX *= friction;
  }


  if (y < 0) {
    spdY *= -1;
  }
} 


