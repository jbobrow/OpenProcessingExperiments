
//PImage = a;

void setup() {
  //pImage =
  size(1600, 2000);
  background(87);

 
}

void draw() {
  background (120);
  for (int i =0; i<40; i++) {
    fill(i++, random(i++), 220, 10);
    arc(i,i, i*15, 10, 25, PI/7);
    arc(i,i/i, 35, 50, 33, PI/9);
    rect(mouseX, mouseY, 200, i*10);
    rect(mouseX, mouseY, random(width), random(height));
    rect(mouseX+i, mouseY+i, i-1, i);
    ellipse(mouseY, mouseX+i, i+1, i);
    ellipse(mouseY, mouseX+i,random(width), random(height));
    rect(mouseY, mouseX, i+10, i*10);
    arc(i,i*i, 75, 80, 23, PI/4);
  }
}


