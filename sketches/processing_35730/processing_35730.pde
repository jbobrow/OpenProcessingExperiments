
void setup() {
  size(600,250);
  smooth();
  rectMode(CENTER);
}

void draw() {
  //Redraw background to prevent ghosting
  background(252,198,130);
  legs();
  body();
  face();
  filters();
}


//Draw body
void body() {
  fill(25,131,44);
  rect(mouseX+50,mouseY+5,90,40);
  ellipse(mouseX+95,mouseY+5,20,40);
  stroke(0);
  line(mouseX+95,mouseY+5,mouseX+110,mouseY-5);
  fill(0);
  ellipse(mouseX+110,mouseY-5,5,5);
  
}

//Draw face
void face() {
  //Outline
  fill(165,7,7); //red face
  ellipse(mouseX,mouseY,42,60);
  //Eyes
  fill(0);
  ellipse(mouseX+5,mouseY-15,4,4);
  ellipse(mouseX-5,mouseY-15,4,4);
  //Mouth
  fill(0);
  ellipse(mouseX,mouseY+15,20,5);
  
} 
//Draw legs
void legs() {
  stroke(0);
  for (int x = mouseX + 10; x <= mouseX + 90; x += 5) {
    line(x,mouseY+25,x+pmouseX-mouseX,pmouseY+40);
  }
}
//Invert color
void filters() {
  if (mouseX <= 2 || mouseX >= width-2 || mouseY <= 2 || mouseY >= height-2) {
    filter(INVERT);
  }
  else if ((mouseX <= (width/2)+10 && mouseX >= (width/2)-10) && (mouseY <= (height/2)+10 && mouseY >= (height/2)-10)) {
    filter(BLUR,3);
  }
}
