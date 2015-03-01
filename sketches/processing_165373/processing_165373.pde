
void setup(){
  size(800,800);
  background(255,231,144);
  smooth();
  noStroke();
}

void draw(){
  background(255,231,144);

  //cara conill
  noStroke();
  fill(255);
  ellipse(mouseX,mouseY,300,300);
  //orelles
  beginShape();
  vertex(mouseX-119, mouseY-77);
  bezierVertex(mouseX-119, mouseY-77, mouseX-92, mouseY-75, mouseX-119, mouseY-77);
  bezierVertex(mouseX-146, mouseY-79, mouseX-237, mouseY-142, mouseX-238, mouseY-196);
  bezierVertex(mouseX-239, mouseY-250, mouseX-200, mouseY-275, mouseX-160, mouseY-272);
  bezierVertex(mouseX-120, mouseY-269, mouseX-80, mouseY-233, mouseX-42, mouseY-130);
  endShape();
  beginShape();
  vertex(mouseX+37, mouseY-132);
  bezierVertex(mouseX+30, mouseY-139, mouseX+23, mouseY-75, mouseX+37.0, mouseY-132);
  bezierVertex(mouseX+51.0, mouseY-189, mouseX+82.0, mouseY-235, mouseX+130.0, mouseY-257);
  bezierVertex(mouseX+178.0, mouseY-279, mouseX+234.0, mouseY-232, mouseX+221.0, mouseY-175);
  bezierVertex(mouseX+208.0, mouseY-118, mouseX+139.0, mouseY-75, mouseX+104.0, mouseY-64);
  endShape();
  //boca conill
  stroke(60);
  strokeWeight(5);
  arc(mouseX-15,mouseY+80,30,30, 0, radians(180));
  arc(mouseX+15,mouseY+80,30,30, 0, radians(180));
  line(mouseX+15,mouseY+95,mouseX+15,mouseY+110);
  line(mouseX+15,mouseY+110,mouseX-15,mouseY+110);
  line(mouseX-15,mouseY+110,mouseX-15,mouseY+95);
  line(mouseX,mouseY+80,mouseX,mouseY+110);
  //ulls conill
  noStroke();
  fill(60);
  ellipse(mouseX-50,mouseY+30,25,30);
  ellipse(mouseX+50,mouseY+30,25,30);
  //bigotis
  noFill();
  stroke(60);
  strokeWeight(0.5);
  arc(mouseX+90,mouseY+260,400,400,radians(255),radians(300));
  arc(mouseX-90,mouseY+260,400,400,radians(240),radians(285));
  arc(mouseX-55,mouseY+170,200,200,radians(220),radians(280));
  arc(mouseX+55,mouseY+170,200,200,radians(260),radians(320));
  fill(60);
  ellipse(mouseX-32,mouseY+68,2,2);
  ellipse(mouseX-45,mouseY+75,2,2);
  ellipse(mouseX-60,mouseY+65,2,2);
  ellipse(mouseX-50,mouseY+60,2,2);
  ellipse(mouseX+32,mouseY+68,2,2);
  ellipse(mouseX+45,mouseY+75,2,2);
  ellipse(mouseX+60,mouseY+65,2,2);
  ellipse(mouseX+50,mouseY+60,2,2);
  //nas
  strokeWeight(5);
  triangle(mouseX-5,mouseY+70,mouseX,mouseY+80,mouseX+5,mouseY+70);


}
