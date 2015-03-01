


boolean recordPDF = false;

color strokeColor = color(0, 10);


void setup(){
  size(330, 330);
  colorMode(RGB, 360, 100, 255, 100);
  smooth();
  noFill();
  background(255);
}

void draw(){
  if(mousePressed){
    pushMatrix();
    translate(width/2,height/2);

    int circleResolution = (int)map(mouseY+100,0,height,2, 10);
    int radius = mouseX-width/2;
    float angle = TWO_PI/circleResolution;

    strokeWeight(2);
    stroke(strokeColor);

    beginShape();
    for (int i=0; i<=circleResolution; i++){
      float x = 0 + cos(angle*i) * radius;
      float y = 0 + sin(angle*i) * radius;
      vertex(x, y);
    }
    endShape();
    
    popMatrix();
  }
}

