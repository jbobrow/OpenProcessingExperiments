
boolean m = false;
void setup () {
  size(500, 500);
  background(0);
}

void draw() {
  noStroke();
  fill(0, 0, 153, 80);
  ellipse(250, 250, 400, 400);

  fill(0, 0, 204, 70);
  ellipse(250, 250, 350, 350);

  fill(0, 0, 255, 60);
  ellipse(250, 250, 300, 300);

  fill(51, 51, 255, 50);
  ellipse(250, 250, 250, 250);

  fill(102, 102, 255, 40);
  ellipse(250, 250, 200, 200);

  fill(153, 153, 255, 30);
  ellipse(250, 250, 150, 150);

  fill(204, 204, 255, 20);
  ellipse(250, 250, 100, 100);

  fill(229, 204, 255, 10);
  ellipse(250, 250, 50, 50);

  if (m) {
    noStroke();
    fill(mouseX, mouseY, 153, 80);
    ellipse(250, 250, 400, 400);

    fill(mouseX+10, mouseY+10, mouseX+10, 70);
    ellipse(250, 250, 350, 350);

    fill(mouseX+20, mouseY+20, mouseX+20, 60);
    ellipse(250, 250, 300, 300);

    fill(mouseX+30, mouseY+30, mouseX+30, 50);
    ellipse(250, 250, 250, 250);

    fill(mouseX+40, mouseY+40, mouseX+40, 40);
    ellipse(250, 250, 200, 200);

    fill(mouseX+50, mouseY+50, mouseX+50, 30);
    ellipse(250, 250, 150, 150);

    fill(mouseX+60, mouseY+60, mouseX+60, 20);
    ellipse(250, 250, 100, 100);

    fill(mouseX+70, mouseY+70, mouseX+70, 10);
    ellipse(250, 250, 50, 50);

  }
  noStroke();
  fill(mouseX,mouseY,mouseX,mouseY);
  rectMode(CENTER);
  rect(250,250,10+cos(.1*frameCount)*2,10+sin(.1*frameCount)*2);
  ellipse(250,290,5+cos(.1*frameCount)*4,5+sin(.1*frameCount)*4);
  ellipse(290,250,5+cos(.1*frameCount)*4,5+sin(.1*frameCount)*4);
  ellipse(210,250,5+cos(.1*frameCount)*4,5+sin(.1*frameCount)*4);
  ellipse(250,210,5+cos(.1*frameCount)*4,5+sin(.1*frameCount)*4);
  rect(295,295,5+cos(.1*frameCount)*6,5+sin(.1*frameCount)*6);
  rect(205,205,5+cos(.1*frameCount)*6,5+sin(.1*frameCount)*6);
  ellipse(180,310,5+cos(.1*frameCount)*8,5+sin(.1*frameCount)*8);
  ellipse(310,180,5+cos(.1*frameCount)*8,5+sin(.1*frameCount)*8);
  rect(250,135,5+cos(.1*frameCount)*10,5+sin(.1*frameCount)*10);
  rect(250,365,5+cos(.1*frameCount)*10,5+sin(.1*frameCount)*10);
  ellipse(345,355,5+cos(.1*frameCount)*12,5+sin(.1*frameCount)*12);
  ellipse(145,155,5+cos(.1*frameCount)*12,5+sin(.1*frameCount)*12);
  rect(360,130,5+cos(.1*frameCount)*14,5+sin(.1*frameCount)*14);
  rect(130,360,5+cos(.1*frameCount)*14,5+sin(.1*frameCount)*14);
  //ellipse(350,400,5+cos(.1*frameCount)*14,5+sin(.1*frameCount)*14);

}


void mouseMoved(){
    m =true;
}

void mousePressed() {
  fill(0);
  line(mouseX, 0, mouseY, 0);
}



