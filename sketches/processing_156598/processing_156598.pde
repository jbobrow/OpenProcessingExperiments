


void setup () {
  size(600,600);
  background (128);
}

void draw () {
  background (128);
  mouseTrail();
  crossHair();
  drawGuides();
  drawArcs();
}

void mouseTrail() {
  if ((frameCount+1)%25==0) {
    background (128);
    ellipse(pmouseX,pmouseY,10,10);
  }
  fill(255);
  line(mouseX,mouseY,pmouseX,pmouseY);
}

void crossHair() {
  fill(255);
  line(mouseX-10,mouseY-10,mouseX+10,mouseY+10);
  line(mouseX-10,mouseY+10,mouseX+10,mouseY-10);
}

void drawGuides() {  
  line(25,0,25,600); 
  fill(0);
  rect(0,0,25,mouseY);
  line(0,25,600,25);
  rect(0,0,mouseX,25);
  fill(255);
  text(mouseX+", "+mouseY,550,12);
  
}

void drawArcs() {
  noFill();
  float mousedist=dist(pmouseX,pmouseY,mouseX,mouseY);
  //arc(mouseX,mouseY,(pmouseX-mouseX)*100,(pmouseY-mouseY)*10, radians(90),radians(180));
  arc(mouseX,mouseY,100,100, radians(((frameCount%360)*5)+0),radians(((frameCount%360)*5)+120));
  arc(mouseX,mouseY,75,75, radians(((frameCount%360)*3)+120),radians(((frameCount%360)*3)+240));
  arc(mouseX,mouseY,50,50, radians((frameCount%360)+240),radians((frameCount%360)+360));
}



