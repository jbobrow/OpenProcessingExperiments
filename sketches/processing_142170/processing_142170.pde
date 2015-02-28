
void setup() {
  size(600,600);
  background(#fdbae6);
}

void draw(){
  //shadow
  filter(BLUR, 3);
  stroke(#3E2D38);
  fill(#3E2D38);
  ellipse(height/2,width/2,400,400);
  //text
  fill(#C994B7);
  textSize(25);
  textAlign(CENTER);
  text("I wanna be",width/2,250);
  text("just like a melody,",width/2,280);
  text("just like a simple song,",width/2, 310);
  text("like a harmony.",width/2, 340);
}

void keyPressed(){
  if (key == 's' || key == 'S') saveFrame("typography1.png");
}
    

