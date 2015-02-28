
int h = hour();

void setup() {
  size(300, 300);
  fill(random(255), random(255), random(255), 50);
  filter(BLUR, 6);
  if (h < 12) {
    background(#ffffff);   
  } else {
    background(#000000);       
  }
}

void draw() {
  int y = mouseY;
  
  int s = second();

  noStroke();
  fill(random(255), random(255), random(255), 50);

  if(y <= 100) { 
    triangle(random(300), random(300), random(300), random(600), s*5, s*5);
    filter(BLUR, 6);
  } else if(y >= 101 && y <= 200) {
    ellipse( s*5, s*5, random(200,300), random(200,300));
    filter(BLUR, 6);
  } else if(y >= 201 && y <= 300) {
    rect( s*5, s*5, random(200,300), random(200,300));
    filter(BLUR, 6);
  }
}


