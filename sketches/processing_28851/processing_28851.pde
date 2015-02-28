
void setup() {
  size(400,400);
  smooth();
  background(50);
}

void draw() {
/*  int durchmesser = 40; */
  float durchmesser = 40;
  durchmesser = random(10,100);
  ellipse(mouseX,mouseY,durchmesser,durchmesser);

}



