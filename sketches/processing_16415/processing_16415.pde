
void setup() {
  size(600,600);
  background(203,237,233);
  smooth();
  noCursor();
  frameRate(25);
}

void draw() {
  background(203,237,233);
  float a=random(-20,20);
  float b=random(-10,10);

  //nuages.
  fill(255,150);
  noStroke();
  ellipse(100,210,40,40);
  ellipse(150,180,100,100);
  ellipse(200,160,140,140);
  ellipse(250,180,100,100);
  ellipse(300,210,40,40);

  ellipse(320,500,30,30);
  ellipse(350,480,70,70);
  ellipse(400,460,110,110);
  ellipse(450,480,70,70);
  ellipse(480,500,30,30);

  //corps.
  fill(131,104,64);
  strokeWeight(20);
  stroke(131,104,64);
  smooth();
  strokeJoin(ROUND);
  rect(mouseX,mouseY,100,220);

  //tête.
  fill(255);
  noStroke();
  ellipse(mouseX+20,mouseY+20,40,40);
  ellipse(mouseX+80,mouseY+20,40,40);
  ellipse(mouseX+50,mouseY+50,60,60);

  //yeux.
  fill(255);
  strokeWeight(2);
  stroke(131,104,64);
  ellipse(mouseX+20,mouseY+20,15,15);
  ellipse(mouseX+80,mouseY+20,15,15);

  //pupilles.
  fill(131,104,64);
  noStroke();
  ellipse(mouseX+18,mouseY+22,10,10);
  ellipse(mouseX+78,mouseY+22,10,10);

  //bouche.
  fill(255);
  strokeWeight(2);
  stroke(131,104,64);
  ellipse(mouseX+50,mouseY+50,40,40);
  line(mouseX+30,mouseY+50,mouseX+70,mouseY+50);

  //ventre.
  fill(255);
  noStroke();
  ellipse(mouseX+50,mouseY+155,80,120);

  //oreilles.
  fill(131,104,64);
  noStroke();
  ellipse(mouseX-10,mouseY+20,20,20);
  ellipse(mouseX+110,mouseY+20,20,20);

  //pattes.
  fill(131,104,64);
  stroke(131,104,64);
  strokeWeight(15);
  line(mouseX+20,mouseY+230,mouseX+20+b,mouseY+280);
  line(mouseX+80,mouseY+230,mouseX+80+b,mouseY+280);

  //bras.
  fill(131,104,64);
  stroke(131,104,64);
  strokeWeight(15);
  line(mouseX-10,mouseY+80,mouseX-50,mouseY+80+a);
  line(mouseX+110,mouseY+80,mouseX+150,mouseY+80+a);
}

        
                
