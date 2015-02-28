
void setup() {
size(600, 600);
background(0);
smooth();
}
void draw() {



for(int i = 1; i<300; i++){
  textSize(19 + i/2);
  fill(random(290), 88, 59, random(190));
  text("my tendencies are outside the mainstream", random(9), i*10);
  
  noFill();
  stroke(map(i++, 0, 100 + i, 0, 255),i + random(width),i + random(300));
  ellipse(width/4, height/4, i + random(height - mouseX),i+ random(width -mouseY));
  triangle( i+ random(9), 400 - random(i, 90), i - mouseY, 0, 100, 100);
}

}

