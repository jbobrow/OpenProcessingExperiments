
int i;

void setup() {
  //size(screen.width, screen.height);
  size(1280, 800);
  background(0);
  smooth();
  noStroke();
  frameRate(50);
  colorMode(HSB, 100, 100, 100, 100);
}

void draw() {
  i+=1;

  //background(0);

  //x += random(-2, 5);
  //y += random(-5, 2);

  fill(random(70, 90), 80, 80, 50);  
  //ellipse(i++, (sin(i)*200)+(height/2)-100, 50, 50);

  fill(random(40, 60), 80, 80, 70);  
  ellipse(i, (tan(i)*200)+(height/2)+100, 25, 25);

  //fill(random(10, 30), 80, 80, 50);  
  //ellipse(i, (tan(i)*200)+(height/2)+100, 50, 50);
}


