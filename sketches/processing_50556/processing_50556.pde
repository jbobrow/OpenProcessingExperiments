
color yellow, pink, neonBlue, neonGreen;


void setup() {
  size(900, 380);
  
  yellow = color(243,243,21);
  pink = color(242, 83, 39);
  neonGreen = color(0, 255, 102);
  neonBlue = color(77, 77, 255);
  
  background(neonBlue);
  strokeWeight(.5);
  
  drawBGLine();
}


void draw(){

  
  pushMatrix();
   translate(width/2, height/2);
   float proportion = cos(radians(frameCount * 3.0));
   scale(map(proportion, -1, 1, 1, 2));
   rotate(-PI * frameCount/700);
   drawRect();
  popMatrix();

  pushMatrix();
    noStroke();
    translate(width/2, height/2);
    rotate(PI * frameCount/600);
    drawLine();
  popMatrix();
  
  
}


void drawLine() {
 for(int x = 0; x < width; x += 150){
   strokeWeight(1);
    stroke(pink, 200);
    line(width, height, x, 0);
  }
}

void drawBGLine() {
 for(int y = 0; y < height; y += 8){
   strokeWeight(2);
    stroke(neonGreen);
    line(0, y, width, y);
  }
}

  
 void drawRect() {
   noFill();
   stroke(yellow, 100);
      rect(0, 0, 100, 100);
 }



