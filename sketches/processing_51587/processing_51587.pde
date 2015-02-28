
//dEvil
//2. Create a representational picture using simple geometric shapes that evoke either cute or evil.

void setup() {
  size (500, 500);
}

void draw() {
  strokeWeight(5);
  translate(250, 250);
  background(250, 100, 0);
  smooth();
  fill (240, 0, 0); //head
  triangle (-160, -170, -100, 0, 0, -70); //horns
  triangle (160, -170, 100, 0, 0, -70);

  ellipse (0, 0, 300, 300);
  fill(255, 0, 0);

  fill(255);//eyes
  ellipse(-50, 0, 90, 90);
  ellipse(50, 0, 90, 90);

  fill(0);//pupil
  ellipse(-50, 0, 40, 40);
  ellipse(50, 0, 40, 40);
  ellipse(50, 90, 40, 20);

  strokeWeight(20);//angry eyebrows
  line(10, -25, 80, -60);
  line(-10, -25, -80, -60);
}

                
                
