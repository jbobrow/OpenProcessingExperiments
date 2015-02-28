
void setup(){
  size(500,800);
  background(17,188,178);
  ellipseMode(CENTER);
  strokeWeight(2);
  
  //background lines
  for (int x=0; x<500; x+=20) {
  line(x,0,x,800);
  stroke(255,45);
  strokeWeight(2);
  }
}

void draw(){
}


void mouseClicked(){
  drawSprite();
}

void drawSprite(){
  //body
  fill(176,255,155);
  noStroke();
  ellipse(mouseX,mouseY,200,200);
  
  //eyes
  fill(255);
  noStroke();
  ellipse(mouseX-40,mouseY-40,60,60);
  ellipse(mouseX+40,mouseY-40,60,60);
  
  //pupil
  fill(0);
  ellipse(mouseX-40,mouseY-40,20,20);
  ellipse(mouseX+40,mouseY-40,20,20);
  
  //eyebrows
  stroke(74,106,65);
  strokeWeight(15);
  line(mouseX-70,mouseY-80,mouseX-10,mouseY-80);
  line(mouseX+70,mouseY-80,mouseX+10,mouseY-80);
  
  //arms
  stroke(74,106,65);
  strokeWeight(7);
  line(mouseX-100,mouseY,mouseX-160,mouseY-60);
  line(mouseX+100,mouseY,mouseX+160,mouseY-60);
  
  //legs
  stroke(74,106,65);
  strokeWeight(7);
  line(mouseX-60,mouseY+80,mouseX-80,mouseY+120);
  line(mouseX+60,mouseY+80,mouseX+80,mouseY+120);
}


