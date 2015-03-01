
float circleX, circleY, circle2X, circle2Y;
float diam=50;

void setup() {
  size(700, 700);
  background(8);
  circleX = diam/2;
  // circle2X = 3*width/4;
}

void draw() {
  //y=sinX


  float time = millis()*0.001;


  for ( float i = diam/2; i < width; i += diam) {
    float sine = sin(time + HALF_PI*i);
    circleY = map (sine, -1, 1, diam/2, height - diam/2);
    float cl = map (sine, -1, 1, 0, 255);
    
    float dis = dist(mouseX, mouseY, width/2, height/2);
    float disl = dist(mouseX, mouseY, 0, height/2);
    float disy = dist(mouseX, mouseY, width/2, 0);
    fill(dis, disl, disy);
    stroke(disy,dis,disl);
    ellipse(i, circleY, diam, diam);
    println(dis);
    diam = map(dis, 0, 500, 20, 80);
    diam = map(disl, 0, 700, 20, 80);
    diam = map(disy, 0, 700, 20, 80);
  }
}



