

//SETUP

void setup() {
  size(800, 800);
  background(255);
}



//DRAW
void draw() {
  background(0,150,0);
  

  //LICHAAM


  stroke(0);
  fill(200, 200, 100);
  ellipse(mouseX+110, pmouseY+30, 35, 35);

  stroke(0);
  fill(200, 200, 100);
  ellipse(mouseX+90, pmouseY+40, 45, 45);

  stroke(0);
  fill(200, 200, 100);
  ellipse(mouseX+70, pmouseY+50, 50, 50);

  stroke(0);
  fill(200, 200, 100);
  ellipse(mouseX+50, pmouseY+50, 50, 50);

  stroke(0);
  fill(200, 200, 100);
  ellipse(mouseX+30, pmouseY+30, 50, 50);


  //HOOFDJE

  stroke(0);
  fill(200, 200, 100);
  ellipse(mouseX, mouseY, 80, 80);

  stroke(0);  //oog li
  fill(240);
  ellipse(mouseX-20, mouseY-10, 20, 25);
  
  stroke(0); //pupil li
  fill(0);
  ellipse(mouseX-20, mouseY-15, 3,3);

  stroke(0);  //oog re
  fill(240);
  ellipse(mouseX+20, mouseY-10, 20, 25);
  
  stroke(0); //pupil re
  fill(0);
  ellipse(mouseX+20, mouseY-15, 3,3);

  stroke(0);
  fill(200, 100, 100);
  ellipse(mouseX, mouseY, 20, 20);
  
  stroke(0);
  fill(200);
  triangle(mouseX-25,mouseY-30,mouseX+25,mouseY-30,mouseX,mouseY-70);
  
}

