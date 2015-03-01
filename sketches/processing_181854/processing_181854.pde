
float difx = 40;
float dify = 30;
float midaCasa = 60;
float midaFinestres = 10;
float midaPorta = 20;
float midaSol = 10;

void setup() {
  size(255, 255);
}

void draw() {
  background(mouseX, mouseX/3, mouseX/3);

  //sol
  fill(255);
  line(mouseY-110,mouseX-160,mouseY-90,mouseX-140);
  line(mouseY-110,mouseX-140,mouseY-90,mouseX-160);
  line(mouseY-110,mouseX-150,mouseY-90,mouseX-150);
  line(mouseY-100,mouseX-160,mouseY-100,mouseX-140);
  ellipse(mouseY-100,mouseX-150,midaSol,midaSol);
  
   //casa
  fill(255);
  triangle(mouseX-difx, mouseY+dify, mouseX, mouseY, mouseX+difx, mouseY+dify);
  noFill();
  stroke(255);
  rect(mouseX-difx+10, mouseY+dify, midaCasa, midaCasa-10);

  //*llumFinestres
  if (mouseX<=127) {
    fill(249, 250, 53);
  }
  if (mouseX>=120) {
    fill(46, 242, 227);
  }

  //finestres
  rect(mouseX-difx+20, mouseY+dify+10, midaFinestres, midaFinestres);
  rect(mouseX-difx+50, mouseY+dify+10, midaFinestres, midaFinestres);
  rect(mouseX-difx+30, mouseY+dify+30, midaPorta, midaPorta);
}
