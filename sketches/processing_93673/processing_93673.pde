
float a=0;//size of sunlight1
float aa;//size of sunlight2
float b=50;//value of halo-opacity
float arate=0.5;//increasing rate
float angle;
 
void setup() {
  size(400, 400);
}
 
void draw() {
  background(240, 140, 0);
  angle = mouseX;
  translate(width/2,height/2);
  rotate(radians(angle));
  //Sun
 // beginShape();
 
  //Halo of sunlight
  strokeWeight(7);
  fill(240, 160, 0, b-50);
  noStroke();
  ellipse(mouseX/80, mouseY/80, 310, 310);
 
  fill(240, 130, 0, b+20);
  noStroke();
  ellipse(mouseX/80, mouseY/80, 220, 220);
 
  fill(240, 120, 0, b+70);
  noStroke();
  ellipse(mouseX/80, mouseY/80, 140, 140);
 
  fill(240, 110, 0, b+100);
  noStroke();
  ellipse(mouseX/80, mouseY/80, 80, 80);
  
  //light lines
  stroke(255);
  line(0, -40,0, -40-a);
  line(40, 0, 40+a, 0);
  line(0, 40, 0, 40+a);
  line(-40, 0, -40-a, 0);
 
  aa= a*sqrt(2)/2;
  line(20*sqrt(2), -20*sqrt(2),20*sqrt(2)+aa,-20*sqrt(2)-aa);
  line(20*sqrt(2), 20*sqrt(2), 20*sqrt(2)+aa, 20*sqrt(2)+aa);
  line(-20*sqrt(2), 20*sqrt(2),-20*sqrt(2)-aa, 20*sqrt(2)+aa);
  line(-20*sqrt(2), -20*sqrt(2), -20*sqrt(2)-aa,-20*sqrt(2)-aa);
 
 
  //face
  noFill();
  ellipse(0, 0, 50, 50);
  point(-10, -5);
  point(10, -5);
  strokeWeight(4);
  arc(0,0, 20, 20, 1, PI-1);
  
  //endShape();
 
  //increasing or shrinking the objects.
  if (a>=100) {
    arate = -0.5;
  }
  else if (a <=-10) {
    arate = 0.5;
  }
  a = a + arate;
  b = b + arate*2;//increase or shrink the opacity of halos.
}
void mouseClicked() {
  a = 0;
  b = 50;
}

