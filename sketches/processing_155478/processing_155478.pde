

void setup(){
  size(1440, 794);
  smooth ();
  background(255);
  fill(0);
  stroke(255);
  ellipse(720, 392, 700, 700);
  ellipse(720, 392, 600, 600);
  ellipse(720, 392, 500, 500);
  ellipse(720, 392, 400, 400);
  ellipse(720, 392, 300, 300);
  ellipse(720, 392, 200, 200);
  ellipse(720, 392, 100, 100);
  fill(255); 
  PFont f = createFont("Arial", 24);
  textAlign(CENTER);
  textFont(f);
  textSize(12);
  text("500", 720, 395);
  text("300", 795, 395);
  text("200", 845, 395);
  text("100", 895, 395);
  text("50", 945, 395);
  text("25", 995, 395);
  text("10", 1045, 395);
  fill(0);
  textSize(24);
  text("Click to 'shoot'", 720, 30);
}

void draw(){

    if (mousePressed){
  fill(255);
  noStroke();
  ellipse (mouseX, mouseY, 10, 10);
  }
}




