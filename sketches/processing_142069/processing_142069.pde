
void setup () {
  size(500, 500);
  background(255);
}
void draw () {
  noStroke();
  float x1 = map (mouseX, 0, 500, 0, 200);
  //float x2 = map (mouseX, 0, 500, 0, 100);

  float y1 = map (mouseY, 0, 500, 50, 250);
  float y2 = map (mouseY, 0, 500, 150, 250);
  float y3 = map (mouseY, 0, 500, 350, 250);
  float y4 = map (mouseY, 0, 500, 450, 250);
  float s = map (second(), 0, 59, 0, 100);
  float a = map (second(), 0, 59, 50, 200);
  float rot = map (mouseX, 0, 500, 0, 360);
  //mitte
  background (50);
  fill(150, 100);
  pushMatrix();
  rectMode(CENTER);
  translate(250, 250);
  rotate(radians(rot));
  rect(0, 0, 70, 70);
  popMatrix();
  
  //oben
  ellipse (250, y1, 100, 100);
  ellipse (250, y2, 100, 100);
  ellipse (250, 250, 100, 100);
  //unten
  ellipse (250, y3, 100, 100);
  ellipse (250, y4, 100, 100);

  //links
  ellipse (250-x1, y1, 100, 100);
  ellipse (250-x1, y2, 100, 100);
  ellipse (250-x1, 250, 100, 100);
  ellipse (250-x1, y3, 100, 100);
  ellipse (250-x1, y4, 100, 100);
  //rechts
  ellipse (250+x1, 250, 100, 100);
  ellipse (250+x1, y1, 100, 100);
  ellipse (250+x1, y2, 100, 100);
  ellipse (250+x1, y3, 100, 100);
  ellipse (250+x1, y4, 100, 100);
  fill (245, 155, 60, a);
  ellipse (250, 250, s, s);

  /*  fill(100, 100);
   rect (400,0, 200,100);
   rect (x,y, 200+x,100-y);*/
}



