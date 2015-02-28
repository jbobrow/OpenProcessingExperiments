
void setup() {

  size(200, 200);
}

void draw() {
  background(73, 170, 174);
  stroke(255);
  //oren L+R
  fill(0);
  ellipse(mouseX-40,mouseY-50, 50, 50);
  fill(0);
  ellipse(mouseX+40,mouseY-50, 50, 50);

  //poten
  fill(0);
  ellipse(mouseX+40,mouseY+50, 45, 35);
  fill(0);
  ellipse(mouseX-40,mouseY+50, 45, 35);

  //voorpoten
  fill(0);
  ellipse(mouseX-60,mouseY, 45, 35);
  fill(0);
  ellipse(mouseX+60,mouseY, 45, 35);



   //body
  fill(255);
  ellipse(mouseX,mouseY, 150, 150);
  fill(0);
  rect(mouseX-75,mouseY, 150, 25);
  

  //ogen L+R
  fill(0);
  ellipse(mouseX-30,mouseY-10, 50, 40);
  fill(0);
  ellipse(mouseX+30,mouseY-10, 50, 40);
  fill(255,0,0);
  ellipse(mouseX+25,mouseY-5, 20, 20);
  ellipse(mouseX-25,mouseY-5, 20, 20);


  
  //neus
  ellipse(mouseX,mouseY+15, 30, 10);
  //mond
  rect(mouseX-15,mouseY+20,30,50);
  
  

  //tanden
  fill(255);
  ellipse(mouseX-17,mouseY+33, 15, 12);
  fill(255);
  ellipse(mouseX-5, mouseY+33, 10, 12);
  fill(255);
  ellipse(mouseX+5, mouseY+33, 10, 12);
  fill(255);
  ellipse(mouseX+18, mouseY+33, 15, 12);
}

