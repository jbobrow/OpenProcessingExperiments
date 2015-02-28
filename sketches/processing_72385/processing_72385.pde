
//William Aldrich
  //Introduction to Digital Media Fall 2012
  //Section B
  //9/13/12

void setup(){
  size(1200,600);
  background(0,0,255);
}

void draw(){
  smooth();
  float r = random(255);
  float b = random(255);
  float c = random(255);
  float d = random(50);
  float e = random(600);
  float f = random(1200);
    fill(0,0,c);
    stroke(r,0,c);
  ellipse(f,e,d,d);
  stroke(r,b,c);
  strokeWeight(2);
  line(mouseX,mouseY,0,0);
  line(mouseX,mouseY,mouseX,mouseY);
  
}

void mouseClicked(){
  float r = random(255);
  background(0,0,r);
}

void keyPressed(){
  if(key == 's'){
    save("williamaldrich3.png");
  }
}
