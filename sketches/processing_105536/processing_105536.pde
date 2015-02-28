
void setup() {
size(displayWidth, displayHeight);
background(255);
rectMode(CENTER);
}


void draw() {
colorMode(HSB);
stroke(random(0, 255), 255, 255);

//make the circle draw in the middle

float centerX = width/2;
float centerY = height/2;

rect(centerX, centerY, 50, 50);
rect(centerX, centerY, 50, 50);

  for (int i = 0; i < 40; i++) {

    float radius = 100 + i * 20;
    float angle = millis() / 1000.0 * (1 + i / 10.0);
    //float angle = millis() / 1000.0;
    float x = mouseX + radius * cos(angle);
    float y = mouseY + radius * -sin(angle);
    //float distance = dist (i, i, mouseX*2, mouseY*2);
    ellipse(x, y, 30, 30);
    fill(random(0,100),2,25);
  }
}

boolean sketchFullScreen() {
  return true;
}




