
color randomColor;

void setup(){
  size(600,600);
  background(235,220,180);
}

void draw(){
    
  float Z = dist(pmouseX, pmouseY, mouseX, mouseY);
  
  background(randomColor);
  stroke(0);
  noFill();
  line(200,200-mouseY/3,200,400+mouseY/3);
  line(300,200-mouseY/3,300,400+mouseY/3);
  line(400,200-mouseY/3,400,400+mouseY/3);
  line(200-mouseX/3,200,400+mouseX/3,200);
  line(200-mouseX/3,300,400+mouseX/3,300);
  line(200-mouseX/3,400,400+mouseX/3,400);
  noStroke();
  fill(255-Z*2,255-Z*4,255-Z*4);
  rect(201,201,99,99);
  rect(301,301,99,99);
  fill(150-Z*2,70+Z*2,20+Z*2);
  rect(301,201,99,99);
  fill(240-Z*2,160-Z*2,120+Z*2);
  rect(201,301,99,99);
}

void mouseReleased(){
  randomColor= color(random(255),random(255),random(255));
}


