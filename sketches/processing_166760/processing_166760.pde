
float wp=400;
float c=1;


void setup() {
  size(600, 600);
  frameRate(15);
}


void draw() {

  float h_x= mouseX, h_y=420;

  
  noStroke();
  fill(50, 200, 50);
  rect(0, 0, 600, 500);
  

  stroke(#8B8B8B);
  fill(139);
  rect(0, 50, 220, 450);

  fill(#7A7E7C);
  rect(150,370,70,130);

  stroke(#2DCAF7);
  noFill();
  for (float i =100; i < 200; i+=0.4) {
    beginShape();
    vertex(i, 50);  
    bezierVertex(random(100, 500), 50, random(250, 500), 500, random(150, 500), 500);
    endShape();
  }

  if (h_x>240) {
    noStroke();
    fill(50, 200, 50);
    ellipse(h_x, h_y-10, 40, 40);
    rect(h_x-20, h_y-20, 40, height);


    stroke(0);
    fill(255);
    line(h_x, h_y, h_x, h_y+60);
    line(h_x, h_y+20, h_x+20, h_y+30);
    line(h_x, h_y+20, h_x-20, h_y+30);
    line(h_x-20, h_y+30, h_x+20, h_y+30);
    line(h_x, h_y+60, h_x+20, h_y+80);
    line(h_x, h_y+60, h_x-20, h_y+80);
    ellipse(h_x, h_y, 30, 30);
  }

  fill(#23C5F5);
  noStroke();
  rect(0, 500, 600, 100);

  c++;

  if (c>=4) c=1;
}
