
int camila = 150;

void setup () {
size(200,200);
background(0);

  
if (camila > 100) {
  stroke(255);
  strokeWeight(8);
  line(20,20,180,180);
  line(20,180,180,20);
  line(20,100,180,100);
  line(100,20,100,180);
  noStroke();
  fill(3,147,255);
  ellipse(100,100,50,50);
  fill(0);
  ellipse(90,90,8,8);
  ellipse(110,90,8,8);
  stroke(0);
  strokeWeight(5);
  line(90,110,110,110); 
}
}

void draw () {
  if (mousePressed) {
    background(255);
    noStroke();
    fill(255,0,222);
    ellipse(30,130,50,50);
    fill(0);
    ellipse(20,120,8,8);
    ellipse(40,120,8,8);
    stroke(0);
    strokeWeight(5);
    line(20,140,40,140);
  } else { 
  background(0);
    stroke(255);
  strokeWeight(8);
  line(20,20,180,180);
  line(20,180,180,20);
  line(20,100,180,100);
  line(100,20,100,180);
  noStroke();
  fill(3,147,255);
  ellipse(100,100,50,50);
  fill(0);
  ellipse(90,90,8,8);
  ellipse(110,90,8,8);
  stroke(0);
  strokeWeight(5);
  line(90,110,110,110); 
}
}
                
