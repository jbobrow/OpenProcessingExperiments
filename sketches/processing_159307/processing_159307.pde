

void setup() {
size(500,500);
}

void draw() {
  background(255);
  textSize(40);
  fill(random(255),random(255),random(255));
  textMode(CENTER);
  text("family", width/2,height/2-32);
  text("portraits", width/2,height/2);
  rectMode (CENTER);
  for (int c = 0; c<mouseY; c= c+30){
    noFill();
    strokeWeight(5);
    stroke(random(255),random(255),random(255));
    rect(width/2, height/2, c,c);}
for (float a=0;a<25000;a++) {
  strokeWeight(1);
  noFill();
  point(random(width),random(height));
}

}

