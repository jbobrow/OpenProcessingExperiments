
size(400,400);
background(255);
smooth();

float w = 5;

while(w <= 350) {
  strokeWeight(0.5);
  fill(0, 44, 74, 5);
  ellipse(width/2, height/2, w, w);
  w = w + 5;
}



