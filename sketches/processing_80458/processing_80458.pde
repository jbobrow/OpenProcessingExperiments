
float angle;
float jitter;

void setup(){
  size(500, 700); //width, height
  background(166, 168, 175);
  frameRate(50);
  rectMode(CENTER);
 
}

void draw(){
  // during even-numbered seconds (0, 2, 4, 6...)
  if (second() % 2 == 0) {  
    jitter = random(-0.1, 0.1);
  }
  angle = angle + jitter;
  float c = cos(angle);
  translate(width/4, height/4);
  rotate(c);
  rect(0, 0, 180, 180);   
  
  fill(30, 33, 44, 50);
  quad(10, 10, 350, 300, 300, 400, 350, 50);
 
  fill(250, 231, 121);
  triangle(120, 100, 150, 150, 100, 100);
  stroke(250,250,250);
  
  fill(3, 3, 3);
  ellipse(-60, 0, 25, 25);
  
  fill(255, 222, 57);
  ellipse(350, 350, 50, 50);
  
  fill(37, 38, 41, 10);
  
  
}

void mousePressed(){
  saveFrame("img###.jpg");
}



