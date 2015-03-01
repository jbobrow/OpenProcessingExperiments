


int mida = 80;
float x = 50;
float y = 40;
float velocitat = 5.5;

void setup () {
  size(600,400);
  //stroke(202,45,36,109);
  //fill(215);
  
}

void draw () {
  background(143+mouseY/5,83+mouseX/5,167+mouseX/5);
  
  //cos
  fill(240 - mouseX/3,68 + mouseY/5,68 + mouseX/5);
  stroke(240 - mouseX/3,68 + mouseY/5,68 + mouseX/58);
  ellipse (mouseX, mouseY, 250, 150);
  fill(240 - mouseX/3,68 + mouseY/5,68 + mouseX/5);
  stroke(240 - mouseX/3,68 + mouseY/5,68 + mouseX/5);
  ellipse (mouseX, mouseY+60, 250, 150);
  fill(240 - mouseX/3,68 + mouseY/5,68 + mouseX/5);
  stroke(240 - mouseX/3,68 + mouseY/5,68 + mouseX/5);
  ellipse (mouseX+100, mouseY+100, 80, 50);
  ellipse (mouseX-100, mouseY+100, 80, 50);
  
  //ulls i boca
  fill(00);
  stroke(00);
  ellipse (mouseX+50, mouseY+10, 20, 50);
  ellipse (mouseX-50, mouseY+10, 20, 50);
  ellipse(mouseX,mouseY+40, 30, mouseY/10);
  
  //pilota
  fill(random(10,250),random(10,250),random(10,250));
stroke(random(10,250),random(10,250),random(10,250));
ellipse (mouseX+200, mouseY/2+200,50 +mouseX/20,50 +mouseY/10);
  

}


