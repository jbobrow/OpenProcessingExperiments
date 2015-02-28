
float hue = random(0,255);
float sat;
float bright;


void setup() {
  size(600,600);
  colorMode(HSB);
  background(255);
  smooth();
}

void draw() {
  //fill(0,1);
  //noStroke();
  //rect(0,0,width,height);

  if (mousePressed && mouseButton == LEFT) {
    if (random(0,100) > 50) {  
      sat = random(0,255);
      bright = random(0,127);
      noFill();
      stroke(hue, sat, bright, 64);
      strokeWeight(0.5);
      float x = random(-width,width*2);
      float y = random(-height,height*2);
      line(x, y, mouseX, mouseY);
      for (float w=0.5; w < 3; w += 0.1) {
        float lerpDist = 0.8 + (w * 0.2/3);
        stroke(hue,sat,bright,10);
        strokeWeight(w);
        line( lerp(x, mouseX, lerpDist), 
              lerp(y, mouseY, lerpDist), 
              mouseX, 
              mouseY );
      }
    }
  }
}

void mousePressed() {
  if (mouseButton == RIGHT) {
    hue = random(0,255);
    background(255);
  }
}

void keyPressed() {
  if (key == 's' || key == 'S') { // save an image
  save("drawing" + year() +"-"+ month() +"-"+ day() +"-" + hour() +"-" + minute() + ".png");
  }
}

