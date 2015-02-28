
void setup() {
size(640, 480, P3D);
smooth(); 
background(190);
noStroke();
ellipse(width/2,height/2, 400,400);

noFill();
stroke(0);
for (int i =0; i<=100; i++) {
  ellipse(width/2,height/2, 200+i,200+i);
    for(int j = 0; j <= 90; j++) {
      line(0,0,j, i*48);
    }
}
fill(0);

noFill();
  
}

void draw() {
 lights(); 
  translate(width/2, height/2, 0);
  sphere(150);
  fill(255);
  noStroke();
  rect(mouseX, mouseY, 150, 150);
  stroke(1);
  noFill();
}



