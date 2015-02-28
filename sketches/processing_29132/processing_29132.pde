
float x;
float y;
float targetX, targetY;
float easing = 0.05;

void setup() {
  size(800,600);
  smooth();
}

void draw () {
  background(255);

  targetX = mouseX;
  float dx = targetX - x;
  if(abs(dx) > 1) {
    x += dx * easing;
  }

  targetY = mouseY;
  float dy = targetY - y;
  if(abs(dy) > 1) {
    y += dy * easing;
  }


  //legs x=230 y=225
  stroke(0);
  strokeWeight(1);
  noFill();
  beginShape();
  vertex(x, y);
  vertex(x-30, y+75);
  vertex(x+10, y+155);
  vertex(x, y+160);
  endShape();

  beginShape();
  vertex(x+40, y);
  vertex(x+70, y+75);
  vertex(x+30, y+155);
  vertex(x+40, y+160);
  endShape();

  //arms
  if(mousePressed) {
  beginShape();
  vertex(x-15, y-40);
  vertex(x-50, y-25);
  vertex(x-60, y-65);
  endShape();

  beginShape();
  vertex(x+45, y-40);
  vertex(x+85, y-25);
  vertex(x+95, y-65);
  endShape();
  }
  else {
  beginShape();
  vertex(x-15, y-40);
  vertex(x-50, y-25);
  vertex(x-60, y+15);
  endShape();

  beginShape();
  vertex(x+45, y-40);
  vertex(x+85, y-25);
  vertex(x+95, y+15);
  endShape();
  }

  //body
  fill(0);
  noStroke();
  ellipse(x+20,y-65,80,80);
  ellipse(x+20,y-19,66,60);
  quad(x-19, y-63, x+60, y-63, x+53, y-16, x-13, y-16);

  //mouth
  if(mousePressed) {
    stroke(255);
    line(x,y-30, x+40,y-30);
    noStroke();
    fill(255);
    bezier(x+12, y-29,  x+8, y-10,  x+22, y-10,  x+20, y-29);
  } 
  else {
    stroke(255);
    fill(255,0,0);
    line(x,y-30, x+40,y-30);
  }
  
  //eyes
  if(mousePressed) {
    stroke(255);
    line(x,y-55, x+11,y-60);
    line(x,y-60, x+11,y-60);
    line(x+40,y-55, x+29,y-60);
    line(x+40,y-60, x+29,y-60);
    
  } 
  else {
    noStroke();
    fill(255);
    ellipse(x+5,y-60, 20,15);
    ellipse(x+35,y-60, 20,15);
    stroke(0);
    strokeWeight(2);
    point(x+5,y-60);
    point(x+35,y-60);
  }
  
}
                
