
float xpos = 20;
float ypos = height/2;


void setup() {
  size(500, 500,P3D);
  smooth();
}


void draw() {
  for (float x=0; x<=width; x+=10) {
    for (float y=0; y<=height; y+=10) {
      stroke(150);
      fill(random(0, 100), random(150, 200), random(x, 100), 150);
      rect(x, y, xpos, xpos);
    }
  }

  for (float i=mouseX; i>= 10 && i<=width; i+=10) {
    noFill();
    strokeWeight(random(1,5));
    stroke(170,100,random(i,255),90);
    beginShape();
    vertex(i, width/9);
    vertex(i, width/8);
    vertex(i, width/7);
    vertex(i, width/6);
    vertex(i, width/5);
    vertex(i, width/4);
    vertex(width-i, width/9);
    vertex(width-i, width/8);
    vertex(width-i, width/7);
    vertex(width-i, width/6);
    vertex(width-i, width/5);
    vertex(width-i, width/4);
    vertex(i,width);
    endShape();
    
  }
}



