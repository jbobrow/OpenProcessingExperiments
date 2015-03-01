
//landscape project - tatooine-ish sunset

//alter the horizon 
int y = 300;

//sandy ground color
color color1 = color(219, 162, 78);
//sky color
color color2 = color(220, 80, 71);


void setup() {
  size(500, 500);
  smooth();
  background(255);
  noStroke();

  //ground
  fill(color1, 230);
  rect(0, y, width, height-y);
  //sky
  fill(color2, 220);
  rect(0, 0, width, y);
  // mountains
  for (int j = 0; j < width; j = j + 5) {
    arc(j, random(y, (0.99*y)), random(0.09*width), random(0.1*height), PI, TWO_PI);
  }
  
  //building
  fill(color1);
  rect(50, y-20, 0.1*width, 0.1*height);
  rect(50+ 0.1*width, (y-10), 0.04*width, 0.08*height);
  arc(50 + 0.05*width, y-20, 0.1*width, 0.08*height, PI, TWO_PI);
  arc(50 + 0.1*width, y-10, 0.08*width, 0.04*height, PI, TWO_PI);
  
  //river
  for (int k = y; k <= y + (0.07*height); k = k + 1) {
    stroke(random(70,75), random(80, 85), random(100, 105), random(255));
    strokeWeight(2);
    strokeCap(ROUND);
    strokeJoin(ROUND);

    beginShape();
    vertex(random(0.5*width, 0.6*width), k);
    vertex(random(0.5*width, 0.7*width), k);
    vertex(random(0.5*width, 0.7*width), k);
    endShape();
  }
  //rocks
  noStroke();
  fill(170, 100, random(20, 30), random(255));
  for (int i = y; i <= y+ (0.05*height); i = i + 1) {
    arc(random((width*0.25), (width*0.5)), i, random(0.035*width), random(0.021*height), PI, TWO_PI);
  }
  fill(170, 100, random(20, 30), random(255));
  for (int i = y; i <= y+ (0.05*height); i = i + 1) {
    arc(random((width*0.65), (width*0.99)), i, random(0.034*width), random(0.025*height), PI, TWO_PI);
  }
  fill(170, 100, random(20, 30), random(255));
  for (int i = y; i <= y+ (0.05*height); i = i + 1) {
    arc(random((width*0.25), (width*0.5)), i, random(0.04*width), random(0.023*height), PI, TWO_PI);
  }
  fill(170, 100, random(20, 30), random(255));
  for (int i = y; i <= y+ (0.05*height); i = i + 1) {
    arc(random((width*0.7), (width*0.95)), i, random(0.031*width), random(0.02*height), PI, TWO_PI);
  }
}
void draw() {
}

void mousePressed() {
  //too many suns!
  if (mouseY < y) {
    fill(color2, 210);
    float scale1 = (y - mouseY)/65.0;
    float width1 = width*scale1;
    float height1 = height*scale1;
    print(scale1, width1, height1);
    print(" ");
    ellipse(mouseX, mouseY, 0.05*width1, 0.05*height1);
    fill(244, 121, 5, 200);
    ellipse(mouseX, mouseY, 0.03*width1, 0.03*height1);
  }

  //too many D2's! (in shadow)
  if (mouseY > y) {
    float scale2 = (mouseY - y)/60.0;
    float width2 = width*scale2;
    float height2 = height*scale2;
    float a = 0.02*width2;
    float b = 0.03*height2;
    float c = 0.01*width2;
    float d = 0.01*height2;
    float e = 0.02*height2;
    fill(0, 230);
    noStroke();
    rect(mouseX, mouseY, a, b); //body
    arc(mouseX+(c), mouseY, a, e, PI, TWO_PI); //head
    arc(mouseX+(c), mouseY+(b), 0.03*width2, e, PI, TWO_PI); //wheels
    arc(mouseX+(c), mouseY+(d), 0.03*width2, d, PI, TWO_PI); //arm attachment
    rect(mouseX+(0.021*width2), mouseY+(d), 0.002*width2, e); //arm right
    rect(mouseX-(0.004*width2), mouseY+(d), 0.002*width2, e); //arm left
  }
}

