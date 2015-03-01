
void setup() {
  size(400,700);
  background(255,0,0);
  strokeWeight(2);
  line(250,250,200,75);
  line(250,250,300,75);
  noStroke();
  rect(85,235,230,250);
  fill(0,0,0);
  ellipse(130,450,20,20);
  ellipse(160,450,20,20);
}

void draw(){
  noStroke();
  fill(random(255),random(255),random(255));
  rect(100,250,200,180);
  strokeWeight(10);
  textSize(40);
  fill(random(255),random(255),random(255),70);
  text("PAY", width/2-40,height/2-32);
  text("YOUR", width/2-60,height/2);
  text("BILLS", width/2-55,height/2+32);
}
