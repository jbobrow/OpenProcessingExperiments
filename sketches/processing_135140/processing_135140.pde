
float vel=0;
void setup () {
  size(800, 800);
}
void draw () {
  //background(0, 163, 159);
  vel=dist(mouseX, mouseY, pmouseX, pmouseY);
  //println(vel);
 
  rect(2, height/2, vel, vel);
  triangle(30, 75, 58, 20, 86, 75);
  rect(width/5, height/2, vel, vel); 
  triangle(30, 75, 58, 20, 86, 75);
  rect(4, height/10, vel, vel);
  triangle(30, 75, 58, 20, 86, 75);
  rect(1, height/10, vel, vel);
  triangle(30, 75, 58, 20, 86, 75);
  rect(10, height/10, vel, vel);
  triangle(30, 75, 58, 20, 86, 75);
  rect(1, height/20, vel, vel);
  triangle(30, 75, 58, 20, 86, 75);
  rect(10, height/20, vel, vel);
  triangle(30, 75, 58, 20, 86, 75);
  rect(15, height/20, vel, vel);
  triangle(30, 75, 58, 20, 86, 75);
  rect(60, height/45, vel, vel);
  triangle(30, 75, 58, 20, 86, 75);
  rect(2, height/200, vel, vel);
  triangle(30, 75, 58, 20, 86, 75);
  vel=dist(mouseX, mouseY, pmouseX, pmouseY);
  println(vel);
  line(20, 30, 20, 30);
 
  if (mousePressed||mouseY< 200) {
    fill(random(255),random (255), random (255));
    //fill(142, 22, 115);
  }
  else {
    rect(width/1, height/21, vel, vel);
    triangle(30, 75, 58, 20, 86, 75);
    rect(width/258, height/100, vel, vel);
    triangle(30, 75, 58, 20, 86, 75);
    rect(width/20, height/20, vel, vel);
    triangle(30, 75, 58, 20, 86, 75);
    rect(width/2, height/45, vel, vel);
    fill(235, 226, 44,20);
     
     
  }
}

