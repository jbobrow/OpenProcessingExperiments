
void setup() {
  size(500, 500);
}

void draw() {
  background(255);

for (int i=0; i <25; i++) {
  if(dist(mouseX, mouseY, i*50, 200) < 25) {
  fill(200);
  } else {
    fill(random(255), random(255), random(255));
  }
  ellipse(i*50, 100, 50, 50);
}

for (int i=0; i <25; i++) {
  if(dist(mouseX, mouseY, i*50, 200) < 25) {
  fill(200);
  } else {
    fill(random(255));
  }
  ellipse(i*50, 200, 50, 50);
}

for (int i=0; i <50; i++) {
  if(dist(mouseX, mouseY, i*25, 200) < 25) {
  fill(200);
  } else {
    fill(random(255), random(255), random(255));
  }
  ellipse(i*25, 340, 50, 100);
}



}


