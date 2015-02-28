
float vel=0;
void setup () {
  size(800, 800);
}
void draw () {
  //background(0, 163, 159);
  vel=dist(mouseX, mouseY, pmouseX, pmouseY);
  println(vel);

  ellipse(width/2, height/2, vel, vel);
  ellipse(width/7, height/2, vel, vel);
  ellipse(width/5, height/2, vel, vel);  
  ellipse(width/1, height/8, vel, vel);
  ellipse(width/4, height/10, vel, vel);
  ellipse(width/10, height/100, vel, vel);
  ellipse(width/1, height/10, vel, vel);
  ellipse(width/4, height/10, vel, vel);
  ellipse(width/10, height/10, vel, vel);
  ellipse(width/10, height/100, vel, vel);
  ellipse(width/1, height/20, vel, vel);
  ellipse(width/4, height/20, vel, vel);
  ellipse(width/10, height/20, vel, vel);
  ellipse(width/20, height/100, vel, vel);
  ellipse(width/15, height/20, vel, vel);
  ellipse(width/20, height/20, vel, vel);
  ellipse(width/60, height/45, vel, vel);
  ellipse(width/2, height/45, vel, vel);
  ellipse(width/2, height/200, vel, vel);
  ellipse(width/2, height/267, vel, vel);
  vel=dist(mouseX, mouseY, pmouseX, pmouseY);
  println(vel);
  line(20, 30, 20, 30);

  if (mousePressed||mouseY< 200) {
    fill(142, 22, 115);
  }
  else {
    ellipse(width/1, height/21, vel, vel);
    ellipse(width/1, height/20, vel, vel);
    ellipse(width/258, height/100, vel, vel);
    ellipse(width/168, height, vel, vel);
    ellipse(width/20, height/20, vel, vel);
    ellipse(width/60, height/45, vel, vel);
    ellipse(width/2, height/45, vel, vel);
    fill(235, 226, 44,20);
     ellipse(width/20, height/20, vel, vel);
    
  }
}
