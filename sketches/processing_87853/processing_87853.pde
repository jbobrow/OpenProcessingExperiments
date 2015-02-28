
/* Define globals */
color fillBg = color(0,0,0);
color fillTriangle = color(100, 100, 255);
color strokeTriangle = color(200, 200, 255);
color fillHandle = color(200, 200, 200);
color strokeHandle = color(255, 255, 255);
float x1, x2, x3, y1, y2, y3;
float margin = 10;

void setup(){
  size(300, 300);
  background(fillBg, 180);
  x1 = random(0,width);
  x2 = random(0, width);
  x3 = random(0, width);
  y1 = random(0, height);
  y2 = random(0, height);
  y3 = random(0, height);
}

void draw(){
  noStroke();
  fill(fillBg, 50);
  rect(0, 0, width, height);
  strokeWeight(1);
  stroke(strokeTriangle, 80);
  fill(fillTriangle, 200);
  triangle(x1, y1, x2, y2, x3, y3);
  strokeWeight(1);
  stroke(strokeHandle, 200);
  fill(fillHandle, 200);
  ellipse(x1, y1, 10, 10);
  ellipse(x2, y2, 10, 10);
  ellipse(x3, y3, 10, 10);
}

void mouseDragged(){
  if(mouseX <= (x1 + margin) && mouseX >= (x1 - margin) && mouseY <= (y1 + margin) && mouseY >= (y1 - margin)){
    x1 = mouseX;
    y1 = mouseY;
  }
  if(mouseX <= (x2 + margin) && mouseX >= (x2 - margin) && mouseY <= (y2 + margin) && mouseY >= (y2 - margin)){
    x2 = mouseX;
    y2 = mouseY;
  }
  if(mouseX <= (x3 + margin) && mouseX >= (x3 - margin) && mouseY <= (y3 + margin) && mouseY >= (y3 - margin)){
    x3 = mouseX;
    y3 = mouseY;
  }
}

/* Print canvas when "p" is pressed */
void keyPressed(){
  if (key == 'p') {
    save("trihandles.jpg");
  }
}

